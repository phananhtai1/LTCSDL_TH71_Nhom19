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
    public class NguoiDungTuyenDungSvc : GenericSvc<NguoiDungTuyenDungRep, NguoiDungTuyenDung>
    {
        #region -- Overrides --
        public override SingleRsp Read(int id)
        {
            var res = new SingleRsp();
            var m = _rep.Read(id);
            res.Data = m;
            return res;
        }
        #endregion

        public override SingleRsp Update(NguoiDungTuyenDung m)
        {
            var res = new SingleRsp();

            var m1 = m.MaNguoiDung > 0 ? _rep.Read(m.MaNguoiDung) : _rep.Read(m.MaTuyenDung);

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

        public SingleRsp CreateNguoiDungTuyenDung(NguoiDungTuyenDungReq emp)
        {
            var res = new SingleRsp();

            NguoiDungTuyenDung nguoiDungTuyenDung = new NguoiDungTuyenDung();

            nguoiDungTuyenDung.MaNguoiDung = emp.MaNguoiDung;
            nguoiDungTuyenDung.MaTuyenDung = emp.MaTuyenDung;
            nguoiDungTuyenDung.NgayNopDon = emp.NgayNopDon;

            res = _rep.CreateNguoiDungTuyenDung(nguoiDungTuyenDung);
            return res;
        }

        public SingleRsp DeleteNguoiDungTuyenDung(NguoiDungTuyenDungReq emp)
        {
            var res = new SingleRsp();

            NguoiDungTuyenDung nguoiDungTuyenDung = new NguoiDungTuyenDung();

            nguoiDungTuyenDung.MaNguoiDung = emp.MaNguoiDung;
            nguoiDungTuyenDung.MaTuyenDung = emp.MaTuyenDung;
            nguoiDungTuyenDung.NgayNopDon = emp.NgayNopDon;

            res = _rep.DeleteNguoiDungTuyenDung(nguoiDungTuyenDung);
            return res;
        }
    
        public object SearchIDNguoiDung(int id,string keyword)
        {
            var us = All.Where(x => x.MaNguoiDung == id);
            var data = us.ToList();
            var res = new
            {
                Data = data,
            };
            return res;
        }

        public object SearchIDTuyenDung(int id, string keyword)
        {
            var us = All.Where(x => x.MaTuyenDung == id);
            var data = us.ToList();
            var res = new
            {
                Data = data,
            };
            return res;
        }
    }

}
