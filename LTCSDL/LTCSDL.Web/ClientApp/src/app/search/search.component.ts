import { Component, OnInit, OnChanges } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import {CookieService} from 'ngx-cookie-service';
import { Router } from '@angular/router';
@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.css']
})
export class SearchComponent implements OnInit {

  public key:string;
  public key1:string;
  constructor(private cookie:CookieService, private http:HttpClient, private router: Router) { }
  public check: check;
  
  public tttd :tttd ={
    maTuyenDung: 0,
    maCongTy: "",
    tenCongTy: "",
    tenChucVu: "",
    thanhPho: "",
    mucLuong: "",
    hanNopDon: ""
  };

  public list: tttd[] =[];
  public hienthi: tttd[] =[];
  
  public data: kynang[] = [];
  ngOnInit() {
    this.key = this.cookie.get("key");
    this.http.get(`https://localhost:44368/api/KyNangTuyenDung/get-KyNangTuyenDung-by-TenKyNang/`+this.key)
    .subscribe(result =>{
      var res : any;
      res = result;
      this.check = res;
      this.data = this.check.data;
      console.log(this.data);
      if(this.data.length != 0){
        this.data.forEach(x=>{
          var y : tttd = {
            maTuyenDung: 0,
            maCongTy: "",
            tenCongTy: "",
            tenChucVu: "",
            thanhPho: "",
            mucLuong: "",
            hanNopDon: ""
          }
          this.http.get(`https://localhost:44368/api/TTTuyenDung/get-TTTuyenDung-by-MaTuyenDung/`+x.maTuyenDung)
          .subscribe(result=>{
              var r : any;
              r = result;
              y = r.data;
              console.log(r.data);
              console.log(this.list);
              y.hanNopDon = y.hanNopDon.substr(0,10);
              this.list.push(y);
          })
        })
        
      }
      else
      {
        this.http.get('https://localhost:44368/api/TTTuyenDung/get-TTTuyenDung-by-TenCongTy-or-TenChucVu/' + this.key)
        .subscribe(result =>{
            var r : any;
            var y : tttd = {
              maTuyenDung: 0,
              maCongTy: "",
              tenCongTy: "",
              tenChucVu: "",
              thanhPho: "",
              mucLuong: "",
              hanNopDon: ""
            };
            r = result;
            console.log(r.data);
            this.list = r.data;
            if(r.data.length == 0)
            {
              alert("Từ cần tìm không tìm thấy");
            }
            this.list.forEach(x=>{
              x.hanNopDon = x.hanNopDon.substr(0,10);
            })
           console.log(this.list);
        }) 
      }
    })
  }
  public myclick(ma: number){
    this.cookie.set("matd",ma.toString());
    this.router.navigate(["/apply"]);
  }
  ngDoCheck(){
    this.key1 = this.cookie.get("key");
    if(this.key != this.key1)
      location.reload();
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
