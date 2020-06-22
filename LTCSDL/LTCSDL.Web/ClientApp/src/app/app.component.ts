import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import {CookieService} from 'ngx-cookie-service';
import { Router } from '@angular/router';
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html'
})
export class AppComponent {
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

  public kntd: kntd ={
    maTuyenDung: 0,
    makyNang: 0,
    tenKyNang: ""
  }

  
  public matd: number
  title = 'app';
  key:string;
  public kt: kynang[];
  public z: kntd[];
  public list : tttd[]=[];
  constructor(private http: HttpClient, private cookie: CookieService, private route: Router){}
  public search(key:string){
    this.http.get(`https://localhost:44368/api/KyNangTuyenDung/get-KyNangTuyenDung-by-TenKyNang/`+key)
    .subscribe(result=>{
      var res : any;
      var check : check = {
        data: [],
        success: "",
        code: "",
        message: "",
        variant: "",
        title: ""
      }
      
      res = result;
      check = res;
      this.kt = check.data;
      console.log(check.data);
      if(check.data.length == 0)
      {
         console.log(key);
         this.cookie.set("key",key);
         this.route.navigate(["/search"]);
      }
      else
      {
        key = this.kt[0].tenKyNang;
        console.log(key);
        this.cookie.set("key",key);
        this.route.navigate(["/search"]);
          

      }

    })
  }
}

interface check{
  data: kynang[],
  success: string,
  code: string,
  message: string,
  variant: string,
  title: string
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

interface kntd{
  maTuyenDung: number,
  makyNang: number,
  tenKyNang: string
}

interface tttd{
  maTuyenDung: number,
  maCongTy: string,
  tenCongTy: string,
  tenChucVu: string,
  thanhPho: string,
  mucLuong: string,
  hanNopDon: string
}
