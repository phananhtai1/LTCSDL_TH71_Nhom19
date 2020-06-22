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

        [HttpGet("get-by-id/{MaKyNang}")]
        public IActionResult layMaKyNang(int MaKyNang)
        {
            var res = new SingleRsp();
            res = _svc.Read(MaKyNang);
            return Ok(res);
        }

        [HttpPost("get-all")]
        public IActionResult layTatCaKyNang()
        {
            var res = new SingleRsp();
            res.Data = _svc.All;
            return Ok(res);
        }

        [HttpPost("create-ky-nang")]
        public IActionResult CreateKyNang([FromBody] KyNangReq req)
        {
            var res = _svc.CreateKyNang(req);
            return Ok(res);
        }

        [HttpPost("update-ky-nang")]
        public IActionResult UpdateKyNang([FromBody] KyNangReq req)
        {
            var res = _svc.UpdateKyNang(req);
            return Ok(res);
        }

        [HttpPost("search-ky-nang")]
        public IActionResult SearchKyNang([FromBody] SearchKyNangReq req)
        {
            var res = new SingleRsp();
            var ky = _svc.SearchKyNang(req.KeyWord,req.Page,req.Size);
            res.Data = ky;
            return Ok(res);
        }
        private readonly KyNangSvc _svc;
    }
}
