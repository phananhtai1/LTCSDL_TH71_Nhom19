using LTCSDL.Common.DAL;
using LTCSDL.Common.Rsp;
using LTCSDL.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LTCSDL.DAL
{
    public class TTTuyenDungRep: GenericRep<ViecLamITContext, ThongTinTuyenDung>
    {
        #region -- Overrides --
        /// <summary>
        /// Read single object
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Return the object</returns>
        public override ThongTinTuyenDung Read(int id)
        {
            var res = All.FirstOrDefault(p => p.MaTuyenDung == id);
            return res;
        }


        /// <summary>
        /// Remove and not restore
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Number of affect</returns>
        public int Remove(int id)
        {
            var m = base.All.First(i => i.MaTuyenDung == id);
            m = base.Delete(m); //TODO
            return m.MaTuyenDung;
        }
        #endregion
    }
}
