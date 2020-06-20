using System;
using System.Collections.Generic;
using LTCSDL.Common.DAL;
using System.Text;

namespace LTCSDL.DAL
{
    using LTCSDL.Common.Rsp;
    using LTCSDL.DAL.Models;
    using Models;
    using System.Linq;
    public class ChucVuRep : GenericRep<ViecLamITContext, ChucVu>
    {
        #region --Overrides--
        public override ChucVu Read(int id)
        {
            var res = All.FirstOrDefault(p => p.MaChucVu == id);
            return res;
        }

        public int Remove(int id)
        {
            var m = base.All.First(i => i.MaChucVu == id);
            m = base.Delete(m);
            return m.MaChucVu;
        }
        #endregion

        #region
        public SingleRsp CreateChucVu(ChucVu chuc)
        {
            var res = new SingleRsp();
            using (var context = new ViecLamITContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.ChucVu.Add(chuc);
                        context.SaveChanges();
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            return res;
        }
        public SingleRsp UpdateChucVu(ChucVu chuc)
        {
            var res = new SingleRsp();
            using (var context = new ViecLamITContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.ChucVu.Update(chuc);
                        context.SaveChanges();
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            return res;
        }
        #endregion
    }
}
