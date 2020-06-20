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
    public class KyNang_TuyenDungSvc: GenericSvc<KyNang_TuyenDungRep, KyNangTuyenDung>
    {
        #region -- Overrides --

        /// <summary>
        /// Read single object
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Return the object</returns>
        public SingleRsp Read(int matd, int makn)
        {
            var res = new SingleRsp();

            var m = _rep.Read(matd,makn);
            res.Data = m;

            return res;
        }
        #endregion

        #region
        public SingleRsp CreateKyNangTuyenDung(KyNang_TuyenDungReq req)
        {
            return _rep.CreateKyNangTuyenDung(req.MaTuyenDung, req.MaKyNang);
        }

        public SingleRsp DeleteKyNangTuyenDung(KyNang_TuyenDungReq req)
        {
            return _rep.DeleteKyNangTuyenDung(req.MaTuyenDung, req.MaKyNang);
        }

        public object DeleteKNTDByMaTD(int MaTuyenDung)
        {
            return _rep.DeleteKNTDByMaTD(MaTuyenDung);
        }

        public SingleRsp getByMaKyNang(int makn)
        {
            return _rep.getByMaKyNang(makn);
        }

        public object getKNTDbyTenKyNang(string kw)
        {
            return _rep.getKNTDbyTenKyNang(kw);
        }

        public object getKNTDbyMaTuyenDung(int key)
        {
            return _rep.getKNTDbyMaTuyenDung(key);
        }

        #endregion
    }
}
