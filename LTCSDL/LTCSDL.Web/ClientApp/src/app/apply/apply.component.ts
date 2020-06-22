import { Component, OnInit, Inject } from '@angular/core';
import {CookieService} from 'ngx-cookie-service';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
@Component({
  selector: 'app-apply',
  templateUrl: './apply.component.html',
  styleUrls: ['./apply.component.css']
})
export class ApplyComponent implements OnInit {
  public td : td ={
    maTuyenDung: 0,
    maCongTy: "",
    maChucVu: 0,
    capBac: "",
    moTaCongViec: "",
    yeuCauCongTy: "",
    mucLuong:"",
    hanNopDon: "",
    maChucVuNavigation: null,
    maCongTyNavigation: null,
    kyNangTuyenDung: [],
    nguoiDungTuyenDung: []
  };

  public ctntd : CTNTD ={
    tenCongTy: "",
    diaChi: "",
    capBac: "",
    thanhPho: "",
    soDienThoai: "",
    tenChucVu: "",
    kynang: [] = [],
    moTaCongViec: "",
    yeuCauCongTy: "",
    mucLuong:"",
    hanNopDon: "",
  }
  
  public matd: number
  constructor(private http: HttpClient, @Inject('BASE_URL') baseUrl: string,
  private cookie:CookieService,
  private router: Router) { }

  ngOnInit() {
    this.matd = parseInt(this.cookie.get("matd"));
    console.log(this.matd);
    this.http.get(`https://localhost:44368/api/TTTuyenDung/get-by-id/`+this.matd)
    .subscribe(result=>{
      var res : any;
      res = result;
      this.td = res.data;
      console.log(this.td);
      this.ctntd.hanNopDon = this.td.hanNopDon;
      this.ctntd.moTaCongViec = this.td.moTaCongViec;
      this.ctntd.mucLuong = this.td.mucLuong;
      this.ctntd.yeuCauCongTy = this.td.yeuCauCongTy;
      this.ctntd.capBac = this.td.capBac;
      this.ctntd.hanNopDon = this.ctntd.hanNopDon.substr(0,10);
      this.http.get(`https://localhost:44368/api/TTNhaTuyenDung/get-by-id/`+this.td.maCongTy)
      .subscribe(result=>{
        var res: any;
        var y : ct ={
          maCongTy: "",
          tenCongTy: "",
          diaChi: "",
          thanhPho: "",
          soDienThoai: "",
          email: "",
          thongTinTuyenDung: []
        }
        res = result;
        y = res.data;
        this.ctntd.tenCongTy = y.tenCongTy;
        this.ctntd.diaChi = y.diaChi;
        this.ctntd.thanhPho = y.thanhPho;
        this.ctntd.soDienThoai = y.soDienThoai;
      })
      console.log(this.ctntd);
      this.http.get(`https://localhost:44368/api/ChucVu/get-by-id/`+this.td.maChucVu)
      .subscribe(result=>{
        var res : any;
        var y : cv = {
          maChucVu: 0,
          tenChucVu: "",
          thongTinTuyenDung: []
        }
        res = result;
        y = res.data;
        this.ctntd.tenChucVu = y.tenChucVu;
      })
      this.http.get(`https://localhost:44368/api/KyNangTuyenDung/get-KyNangTuyenDung-by-MaTuyenDung/`
      +this.td.maTuyenDung).subscribe(result =>{
        var res: any;
        res = result;
        this.ctntd.kynang = res.data;
      })
    });
  }

}

interface td{
  maTuyenDung: number,
  maCongTy: string,
  maChucVu: number,
  capBac: string,
  moTaCongViec: string,
  yeuCauCongTy: string,
  mucLuong:string,
  hanNopDon: string,
  maChucVuNavigation: null,
  maCongTyNavigation: null,
  kyNangTuyenDung: [],
  nguoiDungTuyenDung: []
}

interface CTNTD{
  tenCongTy: string,
  diaChi: string,
  capBac: string,
  thanhPho: string,
  soDienThoai: string,
  tenChucVu: string,
  mucLuong: string,
  moTaCongViec: string,
  yeuCauCongTy: string,
  hanNopDon: string,
  kynang: kynang[]
}

interface kynang{
  maTuyenDung: number,
  makyNang: number,
  tenKyNang: string
}

interface ct{
  maCongTy: string,
  tenCongTy: string,
  diaChi: string,
  thanhPho: string,
  soDienThoai: string,
  email: string,
  thongTinTuyenDung: []
}

interface cv{
  maChucVu: number,
  tenChucVu: string,
  thongTinTuyenDung: []
}


