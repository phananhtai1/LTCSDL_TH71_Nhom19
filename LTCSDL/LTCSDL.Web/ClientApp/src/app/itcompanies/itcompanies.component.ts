import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import {CookieService} from 'ngx-cookie-service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-itcompanies',
  templateUrl: './itcompanies.component.html',
  styleUrls: ['./itcompanies.component.css']
})
export class ITCompaniesComponent implements OnInit {

  public x:any ={
    page:1,
    size: 20,
    keyword:""
  };

  constructor(
    private http: HttpClient, @Inject('BASE_URL') baseUrl: string,
    private cookie:CookieService,
    private router: Router) { }

  public TTNTD : ttntd ={
    maCongTy: "",
    tenCongTy: "",
    diaChi: "",
    thanhPho: "",
    soDienThoai: "",
    email: "",
    thongTinTuyenDung: []
  }
  public list : ttntd[] = []; 
  ngOnInit() {
    this.http.post('https://localhost:44368/api/TTNhaTuyenDung/search-thongtin-nhatuyendung' , this.x).subscribe(result =>{
      var res : any;
      res = result;
      var y : ttntd ={
        maCongTy: "",
        tenCongTy: "",
        diaChi: "",
        thanhPho: "",
        soDienThoai: "",
        email: "",
        thongTinTuyenDung: []
      }
      y = res.data.data;
      this.TTNTD = y;
      console.log(y);
      console.log(this.TTNTD);
      this.list.push(this.TTNTD);
    })
    
  } 


}

interface ttntd{
  maCongTy: string,
  tenCongTy: string,
  diaChi: string,
  thanhPho: string,
  soDienThoai: string,
  email: string,
  thongTinTuyenDung: []
}
