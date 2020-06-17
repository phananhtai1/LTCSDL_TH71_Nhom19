using System;
using System.Collections.Generic;

namespace LTCSDL.DAL.Models
{
    public partial class KyNangTuyenDung
    {
        public int MaTuyenDung { get; set; }
        public int MaKyNang { get; set; }

        public virtual KyNang MaKyNangNavigation { get; set; }
        public virtual ThongTinTuyenDung MaTuyenDungNavigation { get; set; }
    }
}
