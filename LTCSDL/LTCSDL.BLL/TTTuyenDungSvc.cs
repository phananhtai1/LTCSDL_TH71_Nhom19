using LTCSDL.Common.BLL;
using LTCSDL.Common.Req;
using LTCSDL.Common.Rsp;
using LTCSDL.DAL;
using LTCSDL.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LTCSDL.BLL
{
    public class TTTuyenDungSvc : GenericSvc<TTTuyenDungRep, ThongTinTuyenDung> 
    {
        #region -- Overrides --

        /// <summary>
        /// Read single object
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Return the object</returns>
        public override SingleRsp Read(int id)
        {
            var res = new SingleRsp();

            var m = _rep.Read(id);
            res.Data = m;

            return res;
        }
        #endregion
        #region 
        public SingleRsp CreateTTTuyenDung(TTTuyenDungReq td)
        {
            var res = new SingleRsp();
            ThongTinTuyenDung tttd = new ThongTinTuyenDung();
            tttd.MaTuyenDung = td.MaTuyenDung;
            tttd.MaCongTy = td.MaCongTy;
            tttd.MaChucVu = td.MaChucVu;
            tttd.CapBac = td.CapBac;
            tttd.MoTaCongViec = td.MoTaCongViec;
            tttd.YeuCauCongTy = td.YeuCauCongTy;
            tttd.MucLuong = td.MucLuong;
            tttd.HanNopDon = td.HanNopDon;
            res = _rep.CreateTTTuyenDung(tttd);
            return res;
        }

        public SingleRsp UpdateTTTuyenDung(TTTuyenDungReq td)
        {
            var res = new SingleRsp();
            ThongTinTuyenDung tttd = new ThongTinTuyenDung();
            tttd.MaTuyenDung = td.MaTuyenDung;
            tttd.MaCongTy = td.MaCongTy;
            tttd.MaChucVu = td.MaChucVu;
            tttd.CapBac = td.CapBac;
            tttd.MoTaCongViec = td.MoTaCongViec;
            tttd.YeuCauCongTy = td.YeuCauCongTy;
            tttd.MucLuong = td.MucLuong;
            tttd.HanNopDon = td.HanNopDon;
            res = _rep.UpdateTTTuyenDung(tttd);
            return res;
        }

        public SingleRsp DeleteTTTuyenDung(int matd)
        {
            return _rep.DeleteTTTuyenDung(matd);
        }

        public SingleRsp GetTTTuyenDungByMaCongTy(string mcty)
        {
            return _rep.GetTTTuyenDungByMaCongTy(mcty);
            
        }

        public SingleRsp GetTTTuyenDungByMaChucVu(int macvu)
        {
            return _rep.GetTTTuyenDungByMaChucVu(macvu);

        }

        public object SearchTTTuyenDung(string keyword, int page, int size)
        {
            var tttd = All.Where(x => x.MaCongTy.Contains(keyword));
            var offset = (page - 1) * size;
            var total = tttd.Count();
            int totalPages = (total % size) == 0 ? (int)(total / size) : (int)((total / size) + 1);
            var data = tttd.OrderBy(x => x.MaCongTy).Skip(offset).Take(size).ToList();
            var res = new
            {
                Data = data,
                TotalRecord = total,
                TotalPages = totalPages,
                Page = page,
                Size = size
            };
            return res;
        }

        public object getTTTDByTenCongTyOrTenChucVu(string kw)
        {
            return _rep.getTTTDByTenCongTyOrTenChucVu(kw);
        }

        public object getTTTDByMaTuyenDung(int kw)
        {
            return _rep.getTTTDByMaTuyenDung(kw);
        }

        #endregion

    }
}
