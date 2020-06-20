using LTCSDL.Common.DAL;
using LTCSDL.Common.Rsp;
using LTCSDL.DAL.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace LTCSDL.DAL
{
    public class TaiKhoanRep : GenericRep<ViecLamITContext, TaiKhoan>
    {
        #region -- Overrides 
        public override TaiKhoan Read(int id)
        {
            var res = All.FirstOrDefault(p => p.MaTaiKhoan == id);
            return res;
        }

        public int Remove(int id)
        {
            var m = base.All.First(i => i.MaTaiKhoan == id);
            m = base.Delete(m);
            return m.MaTaiKhoan;
        }
        #endregion

        #region -- Methods --
        public SingleRsp CreateTaiKhoan(TaiKhoan acc)
        {
            var res = new SingleRsp();
            using (var context = new ViecLamITContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.TaiKhoan.Add(acc);
                        context.SaveChanges();
                        tran.Commit();      //hoan thanh xong neu co thay doi se tu dong dua vo du lieu
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
                return res;
            }
        }

        public SingleRsp UpdateTaiKhoan(TaiKhoan acc)
        {
            var res = new SingleRsp();
            using (var context = new ViecLamITContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.TaiKhoan.Update(acc);
                        context.SaveChanges();
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
                return res;
            }
        }
        #endregion
    }
}
