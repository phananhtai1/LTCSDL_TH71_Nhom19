using System;
using System.Collections.Generic;
using LTCSDL.Common.DAL;
using System.Text;

namespace LTCSDL.DAL
{
    using LTCSDL.DAL.Models;
    using Models;
    using System.Linq;
    public class ChucVuRep : GenericRep<ViecLamITContext, ChucVu>
    {
        #region --Overrides--
        public override ChucVu Read(int id)
        {
            var res = All.FirstOrDefault(p => p.MaChucVu == id);
            return res;
        }

        public int Remove(int id)
        {
            var m = base.All.First(i => i.MaChucVu == id);
            m = base.Delete(m);
            return m.MaChucVu;
        }
        #endregion
    }
}
