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
    public class KyNang_TuyenDungRep: GenericRep<ViecLamITContext, KyNangTuyenDung>
    {
        #region -- Overrides --
        /// <summary>
        /// Read single object
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Return the object</returns>
        public KyNangTuyenDung Read(int matd, int makn)
        {
            var res = All.FirstOrDefault(p => p.MaTuyenDung == matd && p.MaKyNang == makn);
            return res;
        }


        /// <summary>
        /// Remove and not restore
        /// </summary>
        /// <param name="id">Primary key</param>
        /// <returns>Number of affect</returns>
        public int Remove(int matd, int makn)
        {
            var m = base.All.First(p => p.MaTuyenDung == matd && p.MaKyNang == makn);
            m = base.Delete(m); //TODO
            return m.MaTuyenDung;
        }
        #endregion

        #region -- Methods --
        public SingleRsp CreateKyNangTuyenDung(int matd, int makn)
        {
            var res = new SingleRsp();
            using (var context = new ViecLamITContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        KyNangTuyenDung kntd = new KyNangTuyenDung();
                        kntd.MaTuyenDung = matd;
                        kntd.MaKyNang = makn;
                        var t = context.KyNangTuyenDung.Add(kntd);
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

        public SingleRsp DeleteKyNangTuyenDung(int matd, int makn)
        {
            var res = new SingleRsp();
            using (var context = new ViecLamITContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        res.Data = context.KyNangTuyenDung.FirstOrDefault(p => p.MaTuyenDung == matd && p.MaKyNang == makn);
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

        public object DeleteKNTDByMaTD(int matd)
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
                cmd.CommandText = "delete from [ViecLamIT].[dbo].[KyNang_TuyenDung]where[MaTuyenDung] = @matuyendung";
                cmd.Parameters.AddWithValue("@matuyendung", matd);;
                da.SelectCommand = cmd;
                da.Fill(ds);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        var x = new
                        {
                            MaTuyenDung = row["MaTuyenDung"],
                            MaKyNang = row["MaKyNang"]

                        };
                        res.Add(x);
                    }
                }
                else
                    res = null;
            }
            catch (Exception ex)
            {
                res = null;
            }
            return res;
        }

        public SingleRsp getByMaKyNang(int makn)
        {
            var res = new SingleRsp();
            var t = All.Where(p => p.MaKyNang == makn);
            res.Data = t;
            return res;
        }

        public object getKNTDbyTenKyNang(string kw)
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
                cmd.CommandText = "XuatMaTuyenDungTheoTenKyNang";
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
                            MakyNang = row["MakyNang"],
                            TenKyNang = row["TenKyNang"]
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

        public object getKNTDbyMaTuyenDung(int key)
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
                cmd.CommandText = "XuatTTinKyNangTheoMaTuyenDung";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@key", key);
                da.SelectCommand = cmd;
                da.Fill(ds);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        var x = new
                        {
                            MaTuyenDung = row["MaTuyenDung"],
                            MakyNang = row["MakyNang"],
                            TenKyNang = row["TenKyNang"]
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

        #endregion
    }
}
