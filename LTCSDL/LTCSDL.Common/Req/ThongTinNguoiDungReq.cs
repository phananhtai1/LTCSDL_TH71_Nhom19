using System;
using System.Collections.Generic;
using System.Text;

namespace LTCSDL.Common.Req
{
    public class ThongTinNguoiDungReq
    {
        public int MaNguoiDung { get; set; }
        public string HoVaTen { get; set; }
        public int? MaTaiKhoan { get; set; }
        public string GioiTinh { get; set; }
        public DateTime? NgaySinh { get; set; }
        public string QueQuan { get; set; }
        public string DiaChi { get; set; }
        public string SoDienThoai { get; set; }
        public string ViTriChucVu { get; set; }
        public int? SoNamKinhNghiem { get; set; }
        public string CapBac { get; set; }
        public string TrinhDoHocVan { get; set; }
    }
}
