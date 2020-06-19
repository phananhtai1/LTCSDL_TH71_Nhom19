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
    public class TTTuyenDungController : ControllerBase
    {
        public TTTuyenDungController()
        {
            _svc = new TTTuyenDungSvc();
        }

        [HttpPost("get-by-id")]
        public IActionResult getTTTuyenDungById(int Id)
        {
            var res = new SingleRsp();
            res = _svc.Read(Id);
            return Ok(res);
        }

        [HttpPost("get-all")]
        public IActionResult getAllTTTuyenDung()
        {
            var res = new SingleRsp();
            res.Data = _svc.All;
            return Ok(res);
        }

        [HttpPost("create-TTTuyenDung")]
        public IActionResult CreateTTTuyenDung([FromBody]TTTuyenDungReq req)
        {
            var res = _svc.CreateTTTuyenDung(req);
            return Ok(res);
        }

        [HttpPost("update-TTTuyenDung")]
        public IActionResult UpdateTTTuyenDung([FromBody] TTTuyenDungReq req)
        {
            var res = _svc.UpdateTTTuyenDung(req);
            return Ok(res);
        }

        [HttpPost("delete-TTTuyenDung")]
        public IActionResult DeleteTTTuyenDung([FromBody] SimpleReq req)
        {
            var res = new SingleRsp();
            res = _svc.DeleteTTTuyenDung(req.Id);
            return Ok(res);
        }

        [HttpPost("get-by-MaCongTy")]
        public IActionResult GetTTTuyenDungByMaCongTy(string MaCongTy)
        {
            var res = _svc.GetTTTuyenDungByMaCongTy(MaCongTy);
            return Ok(res);
        }

        [HttpPost("get-by-MaChucVu")]
        public IActionResult GetTTTuyenDungByMaChucVu(int MaChucVu)
        {
            var res = _svc.GetTTTuyenDungByMaChucVu(MaChucVu);
            return Ok(res);
        }

        [HttpPost("search-TTTuyenDung")]
        public IActionResult SearchTTTuyenDung([FromBody]SearchReq req)
        {
            var res = new SingleRsp();
            res.Data = _svc.SearchTTTuyenDung(req.Keyword, req.Page, req.Size);
            return Ok(res);
        }

        [HttpPost("get-TTTuyenDung-by-TenCongTy-or-TenChucVu")]
        public IActionResult getTTTDByTenCongTyOrTenChucVu(string key)
        {
            var res = new SingleRsp();
            res.Data = _svc.getTTTDByTenCongTyOrTenChucVu(key);
            return Ok(res);
        }

        [HttpPost("get-TTTuyenDung-by-MaTuyenDung")]
        public IActionResult getTTTDByMaTuyenDung(int MaTuyenDung)
        {
            var res = new SingleRsp();
            res.Data = _svc.getTTTDByMaTuyenDung(MaTuyenDung);
            return Ok(res);
        }

        private readonly TTTuyenDungSvc _svc;
    }
}
