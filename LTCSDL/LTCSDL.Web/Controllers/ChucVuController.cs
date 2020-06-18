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
            _svc = new ChucVusvc();
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
        private readonly ChucVusvc _svc;
    }
}

