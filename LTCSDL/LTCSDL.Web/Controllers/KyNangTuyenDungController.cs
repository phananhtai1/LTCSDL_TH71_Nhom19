using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LTCSDL.Web.Controllers
{
    using BLL;
    using DAL.Models;
    using Common.Req;
    using System.Collections.Generic;
    //using BLL.Req;
    using Common.Rsp;

    [Route("api/[controller]")]
    [ApiController]
    public class KyNangTuyenDungController : ControllerBase
    {
        public KyNangTuyenDungController()
        {
            _svc = new KyNang_TuyenDungSvc();
        }

        [HttpPost("get-all")]
        public IActionResult getAllKNTD()
        {
            var res = new SingleRsp();
            res.Data = _svc.All;
            return Ok(res);
        }

        [HttpPost("create-KyNang_TuyenDung")]
        public IActionResult CreateKyNangTuyenDung([FromBody]KyNang_TuyenDungReq req)
        {
            var res = new SingleRsp();
            res = _svc.CreateKyNangTuyenDung(req);
            return Ok(res);
        }

        [HttpPost("delete-KyNang_TuyenDung")]
        public IActionResult DeleteKyNangTuyenDung([FromBody]KyNang_TuyenDungReq req)
        {
            var res = new SingleRsp();
            res = _svc.DeleteKyNangTuyenDung(req);
            return Ok(res);
        }

        [HttpGet("delete-KyNang_TuyenDung-by-MaTuyenDung/{MaTuyenDung}")]
        public IActionResult DeleteKNTDByMaTD(int MaTuyenDung)
        {
            var res = new SingleRsp();
            res.Data = _svc.DeleteKNTDByMaTD(MaTuyenDung);
            return Ok(res);
        }

        [HttpGet("get-by-MaKyNang/{MaKyNang}")]
        public IActionResult getByMaKyNang(int MaKyNang)
        {
            var res = new SingleRsp();
            res = _svc.getByMaKyNang(MaKyNang);
            return Ok(res);
        }

        [HttpGet("get-KyNangTuyenDung-by-TenKyNang/{TenKyNang}")]
        public IActionResult getKNTDbyTenKyNang(string TenKyNang)
        {
            var res = new SingleRsp();
            res.Data = _svc.getKNTDbyTenKyNang(TenKyNang);
            return Ok(res);
        }

        [HttpGet("get-KyNangTuyenDung-by-MaTuyenDung/{MaTuyenDung}")]
        public IActionResult getKNTDbyMaTuyenDung(int MaTuyenDung)
        {
            var res = new SingleRsp();
            res.Data = _svc.getKNTDbyMaTuyenDung(MaTuyenDung);
            return Ok(res);
        }

        private readonly KyNang_TuyenDungSvc _svc;
    }
}
