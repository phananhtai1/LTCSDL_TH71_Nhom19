using System;
using System.Collections.Generic;

namespace LTCSDL.DAL.Models
{
    public partial class ChucVu
    {
        public ChucVu()
        {
            ThongTinTuyenDung = new HashSet<ThongTinTuyenDung>();
        }

        public int MaChucVu { get; set; }
        public string TenChucVu { get; set; }

        public virtual ICollection<ThongTinTuyenDung> ThongTinTuyenDung { get; set; }
    }
}
