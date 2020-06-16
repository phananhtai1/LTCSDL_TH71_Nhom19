using System;
using System.Collections.Generic;

namespace LTCSDL.DAL.Models
{
    public partial class ThongTinNhaTuyenDung
    {
        public ThongTinNhaTuyenDung()
        {
            ThongTinTuyenDung = new HashSet<ThongTinTuyenDung>();
        }

        public string MaCongTy { get; set; }
        public string TenCongTy { get; set; }
        public string DiaChi { get; set; }
        public string ThanhPho { get; set; }
        public string SoDienThoai { get; set; }
        public string Email { get; set; }

        public virtual ICollection<ThongTinTuyenDung> ThongTinTuyenDung { get; set; }
    }
}
