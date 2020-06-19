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

    public class ChucVuSvc : GenericSvc<ChucVuRep, ChucVu>
    {
        public override SingleRsp Read(int id)
        {
            var res = new SingleRsp();

            var m = _rep.Read(id);
            res.Data = m;

            return res;
        }

        public override SingleRsp Update(ChucVu m)
        {
            var res = new SingleRsp();

            var m1 = m.MaChucVu > 0 ? _rep.Read(m.MaChucVu) : _rep.Read(m.TenChucVu);
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

        public SingleRsp CreateChucVu(ChucVuReq chuc)
        {
            var res = new SingleRsp();
            ChucVu chucvu = new ChucVu();
            chucvu.MaChucVu = chuc.MaChucVu;
            chucvu.TenChucVu = chuc.TenChucVu;
            res = _rep.CreateChucVu(chucvu);

            return res;
        }

        public SingleRsp UpdateChucVu(ChucVuReq chuc)
        {
            var res = new SingleRsp();
            ChucVu chucvu = new ChucVu();
            chucvu.MaChucVu = chuc.MaChucVu;
            chucvu.TenChucVu= chuc.TenChucVu;
            res = _rep.UpdateChucVu(chucvu);

            return res;
        }

        public object SearchChucVu(string keyword, int page, int size)
        {
            var cv = All.Where(x => x.TenChucVu.Contains(keyword));
            var offset = (page - 1) * size;
            var total = cv.Count();
            int totalPage = (total % size) == 0 ? (int)(total % size) : (int)((total % size) + 1);
            var data = cv.OrderBy(x => x.TenChucVu).Skip(offset).Take(size).ToList();
            var res = new
            {
                Data = data,
                TotalRecord = total,
                TotalPage = totalPage,
                Page = page,
                Size = size
            };
            return res;
        }

        public ChucVuSvc() { }
    }
}
