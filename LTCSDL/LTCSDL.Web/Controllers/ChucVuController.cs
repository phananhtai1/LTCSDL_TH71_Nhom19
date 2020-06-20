using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LTCSDL_ViecLamIT.Controllers
{
    using LTCSDL.BLL;
    using LTCSDL.DAL.Models;
    using LTCSDL.Common.Req;
    using System.Collections.Generic;
    //using BLL.Req;
    using LTCSDL.Common.Rsp;
    [Route("api/[controller]")]
    [ApiController]
    public class ChucVuController : ControllerBase
    {
        public ChucVuController()
        {
            _svc = new ChucVuSvc();
        }

        [HttpPost("get-by-id")]
        public IActionResult layMaChucVu([FromBody] SimpleReq req)
        {
            var res = new SingleRsp();
            res = _svc.Read(req.Id);
            return Ok(res);
        }

        [HttpPost("get-all")]
        public IActionResult layTatCaChucVu()
        {
            var res = new SingleRsp();
            res.Data = _svc.All;
            return Ok(res);
        }

        [HttpPost("create-chuc-vu")]
        public IActionResult CreateChucVu([FromBody] ChucVuReq req)
        {
            var res = _svc.CreateChucVu(req);
            return Ok(res);
        }

        [HttpPost("update-chuc-vu")]
        public IActionResult UpdateChucVu([FromBody] ChucVuReq req)
        {
            var res = _svc.UpdateChucVu(req);
            return Ok(res);
        }

        [HttpPost("search-chuc-vu")]
        public IActionResult SearchChucVu([FromBody] SearchKyNangReq req)
        {
            var res = new SingleRsp();
            var cv = _svc.SearchChucVu(req.KeyWord, req.Page, req.Size);
            res.Data = cv;
            return Ok(res);
        }
        private readonly ChucVuSvc _svc;
    }
}

