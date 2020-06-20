using System;
using System.Collections.Generic;
using System.Text;
using LTCSDL.Common.BLL;
using LTCSDL.Common.Rsp;
namespace LTCSDL.BLL
{
    using DAL;
    using DAL.Models;
    using LTCSDL.Common.Req;
    using System.Linq;

    public class KyNangSvc : GenericSvc<KyNangRep, KyNang>
    {
        public override SingleRsp Read(int id)
        {
            var res = new SingleRsp();

            var m = _rep.Read(id);
            res.Data = m;

            return res;
        }

        public override SingleRsp Update(KyNang m)
        {
            var res = new SingleRsp();

            var m1 = m.MakyNang > 0 ? _rep.Read(m.MakyNang) : _rep.Read(m.TenKyNang);
            if (m1 == null)
            {
                res.SetError("EZ103", "No data.");
            }
            else
            {
                res = base.Update(m);
                res.Data = m;
            }

            return res;
        }

        public SingleRsp CreateKyNang(KyNangReq ky)
        {
            var res = new SingleRsp();
            KyNang kynang = new KyNang();
            kynang.MakyNang = ky.MakyNang;
            kynang.TenKyNang = ky.TenKyNang;
            res = _rep.CreateKyNang(kynang);

            return res;
        }

        public SingleRsp UpdateKyNang(KyNangReq ky)
        {
            var res = new SingleRsp();
            KyNang kynang = new KyNang();
            kynang.MakyNang = ky.MakyNang;
            kynang.TenKyNang = ky.TenKyNang;
            res = _rep.UpdateKyNang(kynang);

            return res;
        }

        public object SearchKyNang(string keyword, int page, int size)
        {
            var ky = All.Where(x => x.TenKyNang.Contains(keyword));
            var offset = (page - 1) * size;
            var total = ky.Count();
            int totalPage = (total % size) == 0 ? (int)(total % size) : (int)((total % size) + 1);
            var data = ky.OrderBy(x => x.TenKyNang).Skip(offset).Take(size).ToList();
            var res = new
            {
                Data = data,
                TotalRecord = total,
                TotalPage=totalPage,
                Page = page,
                Size = size
            };
            return res;
        }
        public KyNangSvc() { }
    }
}
