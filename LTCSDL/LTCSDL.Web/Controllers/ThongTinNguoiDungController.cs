using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using LTCSDL.BLL;
using LTCSDL.Common.Req;
using LTCSDL.Common.Rsp;
using Microsoft.AspNetCore.Mvc;

namespace LTCSDL.Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    public class ThongTinNguoiDungController : ControllerBase
    {
        public ThongTinNguoiDungController()
        {
            _svc = new ThongTinNguoiDungSvc();

        }

        [HttpPost("get-by-id-user")]
        public IActionResult getThongTinNguoiDungById([FromBody] SimpleReq req)
        {
            var res = new SingleRsp();
            res = _svc.Read(req.Id);
            return Ok(res);

        }

        [HttpPost("get-by-id-account")]
        public IActionResult SearchIDAccount([FromBody] SearchIDThongTinNguoiDungReq req)
        {
            var res = new SingleRsp();
            var acc = _svc.SearchIDAccount(req.Id, req.Keyword);
            res.Data = acc;
            return Ok(res);
        }

        [HttpPost("get-all")]
        public IActionResult getAllThongTinNguoiDung()
        {
            var res = new SingleRsp();
            res.Data = _svc.All;
            return Ok(res);

        }

        [HttpPost("search-thong-tin-nguoi-dung")]
        public IActionResult SearchThongTinNguoiDung([FromBody] SearchThongTinNguoiDungReq req)
        {
            var res = new SingleRsp();
            var pros = _svc.SearchThongTinNguoiDung(req.Keyword, req.Page, req.Size);
            res.Data = pros;
            return Ok(res);
        }

        [HttpPost("create-thong-tin-nguoi-dung")]
        public IActionResult CreateThongTinNguoiDung([FromBody] ThongTinNguoiDungReq req)
        {
            var res = _svc.CreateThongTinNguoiDung(req);
            return Ok(res);
        }

        [HttpPost("update-thong-tin-nguoi-dung")]
        public IActionResult UpdateThongTinNguoiDung([FromBody] ThongTinNguoiDungReq req)
        {
            var res = _svc.UpdateThongTinNguoiDung(req);
            return Ok(res);
        }

        private readonly ThongTinNguoiDungSvc _svc;
    }
}
