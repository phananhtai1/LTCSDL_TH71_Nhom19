using System;
using System.Collections.Generic;

namespace LTCSDL.DAL.Models
{
    public partial class ThongTinTuyenDung
    {
        public ThongTinTuyenDung()
        {
            KyNangTuyenDung = new HashSet<KyNangTuyenDung>();
            NguoiDungTuyenDung = new HashSet<NguoiDungTuyenDung>();
        }

        public int MaTuyenDung { get; set; }
        public string MaCongTy { get; set; }
        public int? MaChucVu { get; set; }
        public string CapBac { get; set; }
        public string MoTaCongViec { get; set; }
        public string YeuCauCongTy { get; set; }
        public string MucLuong { get; set; }
        public DateTime? HanNopDon { get; set; }

        public virtual ChucVu MaChucVuNavigation { get; set; }
        public virtual ThongTinNhaTuyenDung MaCongTyNavigation { get; set; }
        public virtual ICollection<KyNangTuyenDung> KyNangTuyenDung { get; set; }
        public virtual ICollection<NguoiDungTuyenDung> NguoiDungTuyenDung { get; set; }
    }
}
