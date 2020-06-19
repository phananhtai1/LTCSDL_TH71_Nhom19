using LTCSDL.Common.DAL;
using LTCSDL.DAL.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace LTCSDL.DAL
{

    using LTCSDL.Common.Rsp;
    using LTCSDL.DAL.Models;
    using Models;
    using System.Linq;
    public class TTNhaTuyenDungRep : GenericRep<ViecLamITContext,ThongTinNhaTuyenDung>
    {
        #region --Overrides--
        public override ThongTinNhaTuyenDung Read(string id)
        {
            var res = All.FirstOrDefault(p => p.MaCongTy == id);
            return res;
        }

        #endregion

        #region
        public SingleRsp CreateTTNTD(ThongTinNhaTuyenDung nhaTD)
        {
            var res = new SingleRsp();
            using (var context = new ViecLamITContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.ThongTinNhaTuyenDung.Add(nhaTD);
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
        public SingleRsp UpdateTTNTD(ThongTinNhaTuyenDung nhaTD)
        {
            var res = new SingleRsp();
            using (var context = new ViecLamITContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.ThongTinNhaTuyenDung.Update(nhaTD);
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
