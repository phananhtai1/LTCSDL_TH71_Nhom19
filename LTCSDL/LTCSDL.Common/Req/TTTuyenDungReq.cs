using System;
using System.Collections.Generic;
using System.Text;

namespace LTCSDL.Common.Req
{
    public class TTTuyenDungReq
    {
        public int MaTuyenDung { get; set; }
        public string MaCongTy { get; set; }
        public int? MaChucVu { get; set; }
        public string CapBac { get; set; }
        public string MoTaCongViec { get; set; }
        public string YeuCauCongTy { get; set; }
        public string MucLuong { get; set; }
        public DateTime? HanNopDon { get; set; }
    }
}
