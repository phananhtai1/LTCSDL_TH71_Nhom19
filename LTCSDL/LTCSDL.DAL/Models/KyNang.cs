using System;
using System.Collections.Generic;

namespace LTCSDL.DAL.Models
{
    public partial class KyNang
    {
        public KyNang()
        {
            KyNangTuyenDung = new HashSet<KyNangTuyenDung>();
        }

        public int MakyNang { get; set; }
        public string TenKyNang { get; set; }

        public virtual ICollection<KyNangTuyenDung> KyNangTuyenDung { get; set; }
    }
}
