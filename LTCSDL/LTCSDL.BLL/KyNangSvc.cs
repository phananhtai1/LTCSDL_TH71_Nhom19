using System;
using System.Collections.Generic;
using System.Text;
using LTCSDL.Common.BLL;
using LTCSDL.Common.Rsp;
namespace LTCSDL.BLL
{
    using DAL;
    using DAL.Models;
    public class KyNangSvc : GenericSvc<KyNangRep, KyNang>
    {
        public override SingleRsp Read(int id)
        {
            var res = new SingleRsp();

            var m = _rep.Read(id);
            res.Data = m;

            return res;
        }

        public override SingleRsp Update(KyNang m)
        {
            var res = new SingleRsp();

            var m1 = m.MakyNang > 0 ? _rep.Read(m.MakyNang) : _rep.Read(m.TenKyNang);
            if (m1 == null)
            {
                res.SetError("EZ103", "No data.");
            }
            else
            {
                res = base.Update(m);
                res.Data = m;
            }

            return res;
        }

        public KyNangSvc() { }
    }
}
