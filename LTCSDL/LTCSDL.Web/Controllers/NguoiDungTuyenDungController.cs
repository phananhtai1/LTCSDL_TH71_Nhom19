using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using LTCSDL.BLL;
using LTCSDL.Common.Req;
using LTCSDL.Common.Rsp;

namespace LTCSDL.Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NguoiDungTuyenDungController : ControllerBase
    {
        public NguoiDungTuyenDungController()
        {
            _svc = new NguoiDungTuyenDungSvc();

        }

        //[HttpPost("get-by-id")]
        //public IActionResult getNguoiDungTuyenDungById([FromBody] SimpleReq req)
        //{
        //    var res = new SingleRsp();
        //    res = _svc.Read(req.Id);
        //    return Ok(res);

        //}

        [HttpPost("get-by-id-user")]
        public IActionResult SearchIDNguoiDung([FromBody] SearchIDNguoiDungTuyenDungReq req)
        {
            var res = new SingleRsp();
            var us = _svc.SearchIDNguoiDung(req.Id,req.Keyword);
            res.Data = us;
            return Ok(res);
        }

        [HttpPost("get-by-id-employment")]
        public IActionResult SearchIDTuyenDung([FromBody] SearchIDNguoiDungTuyenDungReq req)
        {
            var res = new SingleRsp();
            var us = _svc.SearchIDTuyenDung(req.Id, req.Keyword);
            res.Data = us;
            return Ok(res);
        }

        [HttpPost("get-all")]
        public IActionResult getAllNguoiDungTuyenDung()
        {
            var res = new SingleRsp();
            res.Data = _svc.All;
            return Ok(res);
        }

        [HttpPost("create-nguoi-dung-tuyen-dung")]
        public IActionResult CreateNguoiDungTuyenDung([FromBody] NguoiDungTuyenDungReq req)
        {
            var res = _svc.CreateNguoiDungTuyenDung(req);
            return Ok(res);
        }

        [HttpPost("delete-nguoi-dung-tuyen-dung")]
        public IActionResult DeleteNguoiDungTuyenDung([FromBody] NguoiDungTuyenDungReq req)
        {
            var res = _svc.DeleteNguoiDungTuyenDung(req);
            return Ok(res);
        }

        private readonly NguoiDungTuyenDungSvc _svc;
    }
}
