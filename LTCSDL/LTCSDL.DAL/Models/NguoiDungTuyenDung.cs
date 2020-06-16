using System;
using System.Collections.Generic;

namespace LTCSDL.DAL.Models
{
    public partial class NguoiDungTuyenDung
    {
        public int MaNguoiDung { get; set; }
        public int MaTuyenDung { get; set; }
        public DateTime? NgayNopDon { get; set; }

        public virtual ThongTinNguoiDung MaNguoiDungNavigation { get; set; }
        public virtual ThongTinTuyenDung MaTuyenDungNavigation { get; set; }
    }
}
