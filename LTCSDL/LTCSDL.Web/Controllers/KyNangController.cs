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
    public class KyNangController : ControllerBase
    {
        public KyNangController()
        {
            _svc = new KyNangSvc();
        }

        [HttpPost("get-by-id")]
        public IActionResult layMaKyNang([FromBody] SimpleReq req)
        {
            var res = new SingleRsp();
            res = _svc.Read(req.Id);
            return Ok(res);
        }

        [HttpPost("get-all")]
        public IActionResult layTatCaKyNang()
        {
            var res = new SingleRsp();
            res.Data = _svc.All;
            return Ok(res);
        }
        private readonly KyNangSvc _svc;
    }
}
