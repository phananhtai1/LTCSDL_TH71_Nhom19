using System;
using System.Collections.Generic;
using LTCSDL.Common.DAL;
using System.Text;

namespace LTCSDL.DAL
{
    using LTCSDL.DAL.Models;
    using Models;
    using System.Linq;

    public class KyNangRep : GenericRep<ViecLamITContext, KyNang>
    {
        #region --Overrides--
        public override KyNang Read(int id)
        {
            var res = All.FirstOrDefault(p => p.MakyNang == id);
            return res;
        }

        public int Remove(int id)
        {
            var m = base.All.First(i => i.MakyNang == id);
            m = base.Delete(m);
            return m.MakyNang;
        }
        #endregion
    }
}
