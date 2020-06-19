using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LTCSDL.Common.DAL;
using LTCSDL.Common.Rsp;
using LTCSDL.DAL.Models;

namespace LTCSDL.DAL
{
    public class NguoiDungTuyenDungRep : GenericRep<ViecLamITContext, NguoiDungTuyenDung>
    {
        #region -- Overrides 
        public override NguoiDungTuyenDung Read(int id)
        {
            var res = All.FirstOrDefault(p => p.MaNguoiDung == id || p.MaTuyenDung == id);
            return res;
        }

        public int Remove(int id)
        {
            var m = base.All.First(i => i.MaNguoiDung == id);
            m = base.Delete(m);
            return m.MaNguoiDung;
        }

        #endregion

        #region -- Methods --
        public SingleRsp CreateNguoiDungTuyenDung(NguoiDungTuyenDung emp)
        {
            var res = new SingleRsp();
            using (var context = new ViecLamITContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.NguoiDungTuyenDung.Add(emp);
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

        public SingleRsp DeleteNguoiDungTuyenDung(NguoiDungTuyenDung emp)
        {
            var res = new SingleRsp();
            using (var context = new ViecLamITContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.NguoiDungTuyenDung.Remove(emp);
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
