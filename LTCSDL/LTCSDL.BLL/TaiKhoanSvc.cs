using System;
using System.Collections.Generic;
using System.Text;
using LTCSDL.Common.BLL;
using LTCSDL.Common.Rsp;
using LTCSDL.DAL;
using LTCSDL.DAL.Models;
using LTCSDL.Common.Req;
using System.Linq;

namespace LTCSDL.BLL
{
    public class TaiKhoanSvc : GenericSvc<TaiKhoanRep, TaiKhoan>
    {
        public override SingleRsp Read(int id)
        {
            var res = new SingleRsp();
            var m = _rep.Read(id);
            res.Data = m;
            return res;
        }

        public override SingleRsp Update(TaiKhoan m)
        {
            var res = new SingleRsp();

            var m1 = m.MaTaiKhoan > 0 ? _rep.Read(m.MaTaiKhoan) : _rep.Read(m.MatKhau);

            if (m1 == null)
            {
                res.SetError("EZ103", "No Data");
            }
            else
            {
                res = base.Update(m);
                res.Data = m;
            }

            return res;
        }

        public SingleRsp CreateTaiKhoan(TaiKhoanReq acc)
        {
            var res = new SingleRsp();

            TaiKhoan taiKhoan = new TaiKhoan();

            taiKhoan.MaTaiKhoan = acc.MaTaiKhoan;
            taiKhoan.TenTaiKhoan = acc.TenTaiKhoan;
            taiKhoan.MatKhau = acc.MatKhau;

            res = _rep.CreateTaiKhoan(taiKhoan);
            return res;
        }


        public SingleRsp UpdateTaiKhoan(TaiKhoanReq acc)
        {
            var res = new SingleRsp();

            TaiKhoan taiKhoan = new TaiKhoan();

            taiKhoan.MaTaiKhoan = acc.MaTaiKhoan;
            taiKhoan.TenTaiKhoan = acc.TenTaiKhoan;
            taiKhoan.MatKhau = acc.MatKhau;

            res = _rep.UpdateTaiKhoan(taiKhoan);
            return res;
        }
    }
}
