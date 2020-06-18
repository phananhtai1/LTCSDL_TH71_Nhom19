using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace LTCSDL.DAL.Models
{
    public partial class ViecLamITContext : DbContext
    {
        public ViecLamITContext()
        {
        }

        public ViecLamITContext(DbContextOptions<ViecLamITContext> options)
            : base(options)
        {
        }

        public virtual DbSet<ChucVu> ChucVu { get; set; }
        public virtual DbSet<KyNang> KyNang { get; set; }
        public virtual DbSet<KyNangTuyenDung> KyNangTuyenDung { get; set; }
        public virtual DbSet<NguoiDungTuyenDung> NguoiDungTuyenDung { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoan { get; set; }
        public virtual DbSet<ThongTinNguoiDung> ThongTinNguoiDung { get; set; }
        public virtual DbSet<ThongTinNhaTuyenDung> ThongTinNhaTuyenDung { get; set; }
        public virtual DbSet<ThongTinTuyenDung> ThongTinTuyenDung { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                //#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Data Source=.\\SQLEXPRESS;Initial Catalog=ViecLamIT;Persist Security Info=True;User ID=sa;Password=123456;Pooling=False;MultipleActiveResultSets=False;Encrypt=False;TrustServerCertificate=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ChucVu>(entity =>
            {
                entity.HasKey(e => e.MaChucVu);

                entity.Property(e => e.TenChucVu)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<KyNang>(entity =>
            {
                entity.HasKey(e => e.MakyNang);

                entity.Property(e => e.TenKyNang)
                    .IsRequired()
                    .HasMaxLength(20);
            });

            modelBuilder.Entity<KyNangTuyenDung>(entity =>
            {
                entity.HasKey(e => new { e.MaTuyenDung, e.MaKyNang })
                    .HasName("PK_KyNang_TuyenDung_1");

                entity.ToTable("KyNang_TuyenDung");

                entity.HasOne(d => d.MaKyNangNavigation)
                    .WithMany(p => p.KyNangTuyenDung)
                    .HasForeignKey(d => d.MaKyNang)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_KyNang_TuyenDung_KyNang");

                entity.HasOne(d => d.MaTuyenDungNavigation)
                    .WithMany(p => p.KyNangTuyenDung)
                    .HasForeignKey(d => d.MaTuyenDung)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_KyNang_TuyenDung_ThongTinTuyenDung");
            });

            modelBuilder.Entity<NguoiDungTuyenDung>(entity =>
            {
                entity.HasKey(e => new { e.MaNguoiDung, e.MaTuyenDung });

                entity.ToTable("NguoiDung_TuyenDung");

                entity.Property(e => e.NgayNopDon).HasColumnType("datetime");

                entity.HasOne(d => d.MaNguoiDungNavigation)
                    .WithMany(p => p.NguoiDungTuyenDung)
                    .HasForeignKey(d => d.MaNguoiDung)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_NguoiDung_TuyenDung_ThongTinNguoiDung");

                entity.HasOne(d => d.MaTuyenDungNavigation)
                    .WithMany(p => p.NguoiDungTuyenDung)
                    .HasForeignKey(d => d.MaTuyenDung)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_NguoiDung_TuyenDung_ThongTinTuyenDung");
            });

            modelBuilder.Entity<TaiKhoan>(entity =>
            {
                entity.HasKey(e => e.MaTaiKhoan);

                entity.Property(e => e.MatKhau).HasMaxLength(20);

                entity.Property(e => e.TenTaiKhoan).HasMaxLength(20);
            });

            modelBuilder.Entity<ThongTinNguoiDung>(entity =>
            {
                entity.HasKey(e => e.MaNguoiDung);

                entity.HasIndex(e => e.MaTaiKhoan)
                    .HasName("Unique_tk")
                    .IsUnique();

                entity.Property(e => e.CapBac).HasMaxLength(20);

                entity.Property(e => e.DiaChi).HasMaxLength(100);

                entity.Property(e => e.GioiTinh).HasMaxLength(10);

                entity.Property(e => e.HoVaTen)
                    .IsRequired()
                    .HasMaxLength(30);

                entity.Property(e => e.NgaySinh).HasColumnType("datetime");

                entity.Property(e => e.QueQuan).HasMaxLength(50);

                entity.Property(e => e.SoDienThoai).HasMaxLength(20);

                entity.Property(e => e.TrinhDoHocVan).HasMaxLength(20);

                entity.Property(e => e.ViTriChucVu).HasMaxLength(50);

                entity.HasOne(d => d.MaTaiKhoanNavigation)
                    .WithOne(p => p.ThongTinNguoiDung)
                    .HasForeignKey<ThongTinNguoiDung>(d => d.MaTaiKhoan)
                    .HasConstraintName("FK_ThongTinNguoiDung_TaiKhoan");
            });

            modelBuilder.Entity<ThongTinNhaTuyenDung>(entity =>
            {
                entity.HasKey(e => e.MaCongTy);

                entity.Property(e => e.MaCongTy).HasMaxLength(50);

                entity.Property(e => e.DiaChi).HasMaxLength(100);

                entity.Property(e => e.Email).HasMaxLength(50);

                entity.Property(e => e.SoDienThoai).HasMaxLength(50);

                entity.Property(e => e.TenCongTy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.ThanhPho).HasMaxLength(50);
            });

            modelBuilder.Entity<ThongTinTuyenDung>(entity =>
            {
                entity.HasKey(e => e.MaTuyenDung);

                entity.Property(e => e.CapBac).HasMaxLength(20);

                entity.Property(e => e.HanNopDon).HasColumnType("datetime");

                entity.Property(e => e.MaCongTy).HasMaxLength(50);

                entity.Property(e => e.MoTaCongViec).HasMaxLength(1000);

                entity.Property(e => e.MucLuong).HasMaxLength(20);

                entity.Property(e => e.YeuCauCongTy).HasMaxLength(1000);

                entity.HasOne(d => d.MaChucVuNavigation)
                    .WithMany(p => p.ThongTinTuyenDung)
                    .HasForeignKey(d => d.MaChucVu)
                    .HasConstraintName("FK_ThongTinTuyenDung_ChucVu");

                entity.HasOne(d => d.MaCongTyNavigation)
                    .WithMany(p => p.ThongTinTuyenDung)
                    .HasForeignKey(d => d.MaCongTy)
                    .HasConstraintName("FK_ThongTinTuyenDung_ThongTinNhaTuyenDung");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
