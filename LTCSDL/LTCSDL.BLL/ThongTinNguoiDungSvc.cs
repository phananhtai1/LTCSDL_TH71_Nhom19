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
    public class ThongTinNguoiDungSvc : GenericSvc<ThongTinNguoiDungRep, ThongTinNguoiDung>
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

        public object SearchIDAccount(int id,string keyword)
        {
            var acc = All.Where(x => x.MaTaiKhoan == id);
            var data = acc.ToList();
            var res = new
            {
                Data = data,
            };
            return res;
        }

        public object SearchThongTinNguoiDung(string keyword, int page, int size)
        {
            var user = All.Where(x => x.HoVaTen.Contains(keyword));

            var offset = (page - 1) * size;
            var total = user.Count();
            int totalPages = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = user.OrderBy(x => x.HoVaTen).Skip(offset).Take(size).ToList();

            var res = new
            {
                Data = data,
                TotalRecord = total,
                TotalPages = totalPages,
                Page = page,
                Size = size,
            };
            return res;
        }

        public SingleRsp CreateThongTinNguoiDung(ThongTinNguoiDungReq user)
        {
            var res = new SingleRsp();

            ThongTinNguoiDung thongTinNguoiDung = new ThongTinNguoiDung();


            thongTinNguoiDung.MaNguoiDung = user.MaNguoiDung;
            thongTinNguoiDung.HoVaTen = user.HoVaTen;
            thongTinNguoiDung.MaTaiKhoan = user.MaTaiKhoan;
            thongTinNguoiDung.NgaySinh = user.NgaySinh;
            thongTinNguoiDung.GioiTinh = user.GioiTinh;
            thongTinNguoiDung.DiaChi = user.DiaChi;
            thongTinNguoiDung.QueQuan = user.QueQuan;
            thongTinNguoiDung.SoDienThoai = user.SoDienThoai;
            thongTinNguoiDung.ViTriChucVu = user.ViTriChucVu;
            thongTinNguoiDung.SoNamKinhNghiem = user.SoNamKinhNghiem;
            thongTinNguoiDung.TrinhDoHocVan = user.TrinhDoHocVan;
            thongTinNguoiDung.CapBac = user.CapBac;

            res = _rep.CreateThongTinNguoiDung(thongTinNguoiDung);
            return res;
        }

        public SingleRsp UpdateThongTinNguoiDung(ThongTinNguoiDungReq user)
        {
            var res = new SingleRsp();

            ThongTinNguoiDung thongTinNguoiDung = new ThongTinNguoiDung();


            thongTinNguoiDung.MaNguoiDung = user.MaNguoiDung;
            thongTinNguoiDung.HoVaTen = user.HoVaTen;
            thongTinNguoiDung.MaTaiKhoan = user.MaTaiKhoan;
            thongTinNguoiDung.NgaySinh = user.NgaySinh;
            thongTinNguoiDung.GioiTinh = user.GioiTinh;
            thongTinNguoiDung.DiaChi = user.DiaChi;
            thongTinNguoiDung.QueQuan = user.QueQuan;
            thongTinNguoiDung.SoDienThoai = user.SoDienThoai;
            thongTinNguoiDung.ViTriChucVu = user.ViTriChucVu;
            thongTinNguoiDung.SoNamKinhNghiem = user.SoNamKinhNghiem;
            thongTinNguoiDung.TrinhDoHocVan = user.TrinhDoHocVan;
            thongTinNguoiDung.CapBac = user.CapBac;

            res = _rep.UpdateThongTinNguoiDung(thongTinNguoiDung);
            return res;
        }


        public override SingleRsp Update(ThongTinNguoiDung m)
        {
            var res = new SingleRsp();

            var m1 = m.MaNguoiDung > 0 ? _rep.Read(m.MaNguoiDung) : _rep.Read(m.QueQuan);

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
    }
}
