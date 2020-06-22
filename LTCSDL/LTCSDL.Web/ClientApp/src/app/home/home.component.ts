import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import {CookieService} from 'ngx-cookie-service';
import { Router } from '@angular/router';

//import { Console, error } from 'console';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit{
  
  public x:any ={
    page:1,
    size: 10,
    keyword:""
  };
  public list: td[];
  constructor(
    private http: HttpClient, @Inject('BASE_URL') baseUrl: string,
    private cookie:CookieService,
    private router: Router){

  }
  
  public lst : tttd[] = [];
  ngOnInit(){
    this.searchCV();
  }

  searchCV(){
    
    this.http
    .post('https://localhost:44368/api/TTTuyenDung/search-TTTuyenDung', this.x)
    .subscribe(result =>{
      var res : any;
      res = result;
      this.list = res.data.data;
      console.log(this.list);
      this.list.forEach(x=>{
        var item: tttd ={
          tenCongTy: "",
          thanhPho: "",
          tenChucVu: "",
          mucLuong: "",
          maTuyenDung: 0,
          hanNopDon:"",
        };
        console.log(x);
        this.http.get(`https://localhost:44368/api/ChucVu/get-by-id/`+ x.maChucVu)
        .subscribe(result =>{
          var res : any;
          var y : cv;
          res = result;
          y = res.data;
          item.tenChucVu = y.tenChucVu;
        })
        this.http.get(`https://localhost:44368/api/TTNhaTuyenDung/get-by-id/` + x.maCongTy)
        .subscribe(result=>{
          var res : any;
          var y : congty;
          res = result;
          y = res.data;
          item.tenCongTy = y.tenCongTy;
          item.thanhPho = y.thanhPho;
        })
        item.mucLuong = x.mucLuong;
        item.hanNopDon = x.hanNopDon.substr(0,10);
        item.maTuyenDung = x.maTuyenDung;
        console.log(item);
        this.lst.push(item);
      });
    });
    
    console.log(this.lst);
  }

  public myclick(ma: number){
    this.cookie.set("matd",ma.toString());
    this.router.navigate(["/apply"]);
  }
  
  
}

interface tttd{
  maTuyenDung: number,
  tenCongTy: string,
  thanhPho: string,
  tenChucVu: string,
  mucLuong: string,
  hanNopDon:string,
  
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

interface cv{
  maChucVu: number,
  tenChucVu: string,
  thongTinTuyenDung: []
}

interface congty{
    maCongTy: string,
    tenCongTy: string,
    diaChi: string,
    thanhPho: string,
    soDienThoai: string,
    email: string,
    thongTinTuyenDung: []
}

interface kt{
  data:[]
}