using LTCSDL.Common.DAL;
using LTCSDL.DAL.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace LTCSDL.BLL
{
    using DAL;
    using DAL.Models;
    using LTCSDL.Common.BLL;
    using LTCSDL.Common.Req;
    using LTCSDL.Common.Rsp;
    using System.Linq;

    public class TTNhaTuyenDungSvc : GenericSvc<TTNhaTuyenDungRep, ThongTinNhaTuyenDung>
    {
        public override SingleRsp Read(string id)
        {
            var res = new SingleRsp();

            var m = _rep.Read(id);
            res.Data = m;

            return res;
        }

        //public override SingleRsp Update(ThongTinNhaTuyenDung m)
        //{
        //    var res = new SingleRsp();

        //    var m1 = m.MaCongTy > 0 ? _rep.Read(m.MaCongTy) : _rep.Read(m.TenCongTy);
        //    if (m1 == null)
        //    {
        //        res.SetError("EZ103", "No data.");
        //    }
        //    else
        //    {
        //        res = base.Update(m);
        //        res.Data = m;
        //    }

        //    return res;

        //}

        public SingleRsp CreateTTNTD(TTNhaTuyenDungReq nhaTD)
        {
            var res = new SingleRsp();
            ThongTinNhaTuyenDung nhaTuyenDung = new ThongTinNhaTuyenDung();
            nhaTuyenDung.MaCongTy = nhaTD.MaCongTy;
            nhaTuyenDung.TenCongTy = nhaTD.TenCongTy;
            nhaTuyenDung.DiaChi = nhaTD.DiaChi;
            nhaTuyenDung.SoDienThoai = nhaTD.SoDienThoai;
            nhaTuyenDung.ThanhPho = nhaTD.ThanhPho;
            nhaTuyenDung.Email = nhaTD.Email;
            res = _rep.CreateTTNTD(nhaTuyenDung);

            return res;
        }

        public SingleRsp UpdateTTNTD(TTNhaTuyenDungReq nhaTD)
        {
            var res = new SingleRsp();
            ThongTinNhaTuyenDung nhaTuyenDung = new ThongTinNhaTuyenDung();
            nhaTuyenDung.MaCongTy = nhaTD.MaCongTy;
            nhaTuyenDung.TenCongTy = nhaTD.TenCongTy;
            nhaTuyenDung.DiaChi = nhaTD.DiaChi;
            nhaTuyenDung.SoDienThoai = nhaTD.SoDienThoai;
            nhaTuyenDung.ThanhPho = nhaTD.ThanhPho;
            nhaTuyenDung.Email = nhaTD.Email;
            res = _rep.UpdateTTNTD(nhaTuyenDung);

            return res;
        }

        public object SearchTTNTD(string keyword, int page, int size)
        {
            var ntd = All.Where(x => x.TenCongTy.Contains(keyword));
            var offset = (page - 1) * size;
            var total = ntd.Count();
            int totalPage = (total % size) == 0 ? (int)(total % size) : (int)((total % size) + 1);
            var data = ntd.OrderBy(x => x.TenCongTy).Skip(offset).Take(size).ToList();
            var res = new
            {
                Data = data,
                TotalRecord = total,
                TotalPage = totalPage,
                Page = page,
                Size = size
            };
            return res;
        }
    }
}
