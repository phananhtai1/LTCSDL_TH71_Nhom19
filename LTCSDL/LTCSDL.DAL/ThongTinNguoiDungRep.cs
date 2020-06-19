using LTCSDL.Common.DAL;
using LTCSDL.Common.Rsp;
using LTCSDL.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LTCSDL.DAL
{
    public class ThongTinNguoiDungRep : GenericRep<ViecLamITContext, ThongTinNguoiDung>
    {
        #region -- Overrides 
        public override ThongTinNguoiDung Read(int id)
        {
            var res = All.FirstOrDefault(p => p.MaNguoiDung == id || p.MaTaiKhoan == id);
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
        public SingleRsp CreateThongTinNguoiDung(ThongTinNguoiDung user)
        {
            var res = new SingleRsp();
            using (var context = new ViecLamITContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.ThongTinNguoiDung.Add(user);
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

        public SingleRsp UpdateThongTinNguoiDung(ThongTinNguoiDung user)
        {
            var res = new SingleRsp();
            using (var context = new ViecLamITContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.ThongTinNguoiDung.Update(user);
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
    }
        #endregion
}
