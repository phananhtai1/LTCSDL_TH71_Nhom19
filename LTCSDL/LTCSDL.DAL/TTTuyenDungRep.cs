using LTCSDL.Common.DAL;
using LTCSDL.Common.Rsp;
using LTCSDL.DAL.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace LTCSDL.DAL
{
    public class TTTuyenDungRep: GenericRep<ViecLamITContext, ThongTinTuyenDung>
    {
        #region -- Overrides --
        /// <summary>
        /// Read single object
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Return the object</returns>
        public override ThongTinTuyenDung Read(int id)
        {
            var res = All.FirstOrDefault(p => p.MaTuyenDung == id);
            return res;
        }


        /// <summary>
        /// Remove and not restore
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Number of affect</returns>
        public int Remove(int id)
        {
            var m = base.All.First(i => i.MaTuyenDung == id);
            m = base.Delete(m); //TODO
            return m.MaTuyenDung;
        }
        #endregion

        #region -- Methods --
        public SingleRsp CreateTTTuyenDung(ThongTinTuyenDung pro)
        {
            var res = new SingleRsp();
            using (var context = new ViecLamITContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.ThongTinTuyenDung.Add(pro);
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

        public SingleRsp UpdateTTTuyenDung(ThongTinTuyenDung pro)
        {
            var res = new SingleRsp();
            using (var context = new ViecLamITContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.ThongTinTuyenDung.Update(pro);
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

        public SingleRsp DeleteTTTuyenDung(int matd)
        {
            var res = new SingleRsp();

            using (var context = new ViecLamITContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        res.Data = context.ThongTinTuyenDung.Find(matd);
                        context.Remove(res.Data);
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

        public SingleRsp GetTTTuyenDungByMaCongTy(string macty)
        {
            var res = new SingleRsp();
            res.Data = All.Where(p => p.MaCongTy == macty);
            return res;
        }

        public SingleRsp GetTTTuyenDungByMaChucVu(int macvu)
        {
            var res = new SingleRsp();
            res.Data = All.Where(p => p.MaChucVu == macvu);
            return res;
        }

        public object getTTTDByTenCongTyOrTenChucVu(string kw)
        {
            List<object> res = new List<object>();
            var cnn = (SqlConnection)Context.Database.GetDbConnection();
            if (cnn.State == ConnectionState.Closed)
                cnn.Open();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter();
                DataSet ds = new DataSet();
                var cmd = cnn.CreateCommand();
                cmd.CommandText = "TKTheoTenChucVuVaTenCongTy";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@keywork", kw);
                da.SelectCommand = cmd;
                da.Fill(ds);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        var x = new
                        {
                            MaTuyenDung = row["MaTuyenDung"],
                            MaCongTy = row["MaCongTy"],
                            TenCongTy = row["TenCongTy"],
                            TenChucVu = row["TenChucVu"],
                            ThanhPho = row["ThanhPho"],
                            MucLuong = row["MucLuong"],
                            HanNopDon = row["HanNopDon"]
                        };
                        res.Add(x);
                    }
                }
            }
            catch (Exception ex)
            {
                res = null;
            }
            return res;
        }

        public object getTTTDByMaTuyenDung(int kw)
        {
            object res = new object();
            var cnn = (SqlConnection)Context.Database.GetDbConnection();
            if (cnn.State == ConnectionState.Closed)
                cnn.Open();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter();
                DataSet ds = new DataSet();
                var cmd = cnn.CreateCommand();
                cmd.CommandText = "TKThongTinTuyenDungTheoMaTuyenDung";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@key", kw);
                da.SelectCommand = cmd;
                da.Fill(ds);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        var x = new
                        {
                            MaTuyenDung = row["MaTuyenDung"],
                            MaCongTy = row["MaCongTy"],
                            TenCongTy = row["TenCongTy"],
                            TenChucVu = row["TenChucVu"],
                            ThanhPho = row["ThanhPho"],
                            MucLuong = row["MucLuong"],
                            HanNopDon = row["HanNopDon"]
                        };
                        res = x;
                    }
                }
            }
            catch (Exception ex)
            {
                res = null;
            }
            return res;
        }
        #endregion 
    }
}
