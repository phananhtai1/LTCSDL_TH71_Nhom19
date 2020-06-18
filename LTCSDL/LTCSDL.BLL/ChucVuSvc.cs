using System;
using System.Collections.Generic;
using System.Text;
using LTCSDL.Common.BLL;
using LTCSDL.Common.Rsp;


namespace LTCSDL.BLL
{
    using DAL;
    using DAL.Models;
    public class ChucVusvc : GenericSvc<ChucVuRep, ChucVu>
    {
        public override SingleRsp Read(int id)
        {
            var res = new SingleRsp();

            var m = _rep.Read(id);
            res.Data = m;

            return res;
        }

        public override SingleRsp Update(ChucVu m)
        {
            var res = new SingleRsp();

            var m1 = m.MaChucVu > 0 ? _rep.Read(m.MaChucVu) : _rep.Read(m.TenChucVu);
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

        public ChucVusvc() { }
    }
}
