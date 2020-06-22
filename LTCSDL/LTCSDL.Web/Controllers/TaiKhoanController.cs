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
    public class TaiKhoanController : ControllerBase
    {
        public TaiKhoanController()
        {
            _svc = new TaiKhoanSvc();

        }

        [HttpGet("get-by-id/{MaTaiKhoan}")]
        public IActionResult getTaiKhoanById(int MaTaiKhoan)
        {
            var res = new SingleRsp();
            res = _svc.Read(MaTaiKhoan);
            return Ok(res);

        }

        [HttpPost("get-all")]
        public IActionResult getAllTaiKhoan()
        {
            var res = new SingleRsp();
            res.Data = _svc.All;
            return Ok(res);
        }

        [HttpPost("create-tai-khoan")]
        public IActionResult CreateTaiKhoan([FromBody] TaiKhoanReq req)
        {
            var res = _svc.CreateTaiKhoan(req);
            return Ok(res);
        }

        [HttpPost("update-tai-khoan")]
        public IActionResult UpdateTaiKhoan([FromBody] TaiKhoanReq req)
        {
            var res = _svc.UpdateTaiKhoan(req);
            return Ok(res);
        }

        private readonly TaiKhoanSvc _svc;
    }
}
