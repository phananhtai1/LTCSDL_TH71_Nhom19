using System;
using System.Collections.Generic;
using System.Text;

namespace LTCSDL.Common.Req
{
    public class NguoiDungTuyenDungReq
    {
        public int MaNguoiDung { get; set; }
        public int MaTuyenDung { get; set; }
        public DateTime? NgayNopDon { get; set; }
    }
}
