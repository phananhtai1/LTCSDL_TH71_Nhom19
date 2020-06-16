using System;
using System.Collections.Generic;

namespace LTCSDL.DAL.Models
{
    public partial class TaiKhoan
    {
        public int MaTaiKhoan { get; set; }
        public string TenTaiKhoan { get; set; }
        public string MatKhau { get; set; }

        public virtual ThongTinNguoiDung ThongTinNguoiDung { get; set; }
    }
}
