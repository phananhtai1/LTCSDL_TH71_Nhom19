using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LTCSDL.Web.Controllers
{
    using LTCSDL.BLL;
    using LTCSDL.DAL.Models;
    using LTCSDL.Common.Req;
    using System.Collections.Generic;
    //using BLL.Req;
    using LTCSDL.Common.Rsp;
    [Route("api/[controller]")]
    [ApiController]
    public class TTNhaTuyenDungController : ControllerBase
    {
        public TTNhaTuyenDungController()
        {
            _svc = new TTNhaTuyenDungSvc();
        }

        [HttpGet("get-by-id/{MaCongTy}")]
        public IActionResult layMaCongTy(string MaCongTy)
        {
            var res = new SingleRsp();
            res = _svc.Read(MaCongTy);
            return Ok(res);
        }

        [HttpPost("get-all")]
        public IActionResult layTatCaTTNTD()
        {
            var res = new SingleRsp();
            res.Data = _svc.All;
            return Ok(res);
        }

        [HttpPost("create-thongtin-nhatuyendung")]
        public IActionResult CreateTTNTD([FromBody] TTNhaTuyenDungReq req)
        {
            var res = _svc.CreateTTNTD(req);
            return Ok(res);
        }

        [HttpPost("update-thongtin-nhatuyendung")]
        public IActionResult UpdateTTNTD([FromBody] TTNhaTuyenDungReq req)
        {
            var res = _svc.UpdateTTNTD(req);
            return Ok(res);
        }

        [HttpPost("search-thongtin-nhatuyendung")]
        public IActionResult SearchTTNTD([FromBody] SearchKyNangReq req)
        {
            var res = new SingleRsp();
            var ntd = _svc.SearchTTNTD(req.KeyWord, req.Page, req.Size);
            res.Data = ntd;
            return Ok(res);
        }
        private readonly TTNhaTuyenDungSvc _svc;
    }
}
