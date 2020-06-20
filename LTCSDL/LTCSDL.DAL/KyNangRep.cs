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

    public class KyNangRep : GenericRep<ViecLamITContext, KyNang>
    {
        #region --Overrides--
        public override KyNang Read(int id)
        {
            var res = All.FirstOrDefault(p => p.MakyNang == id);
            return res;
        }

        public int Remove(int id)
        {
            var m = base.All.First(i => i.MakyNang == id);
            m = base.Delete(m);
            return m.MakyNang;
        }

        #endregion

        #region
        public SingleRsp CreateKyNang(KyNang ky)
        {
            var res = new SingleRsp();
            using (var context = new ViecLamITContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.KyNang.Add(ky);
                        context.SaveChanges();
                        tran.Commit();
                    }
                    catch(Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }                    
            }
            return res;
        }
        public SingleRsp UpdateKyNang(KyNang ky)
        {
            var res = new SingleRsp();
            using (var context = new ViecLamITContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.KyNang.Update(ky);
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
