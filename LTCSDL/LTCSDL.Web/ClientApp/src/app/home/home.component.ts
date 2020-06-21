import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Console, error } from 'console';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit{

  key:any = "";

  constructor(
    private http: HttpClient, @Inject('BASE_URL') baseUrl: string){

  }

  ngOnInit(){
    this.searchCV(1);
  }

  searchCV(cPage){
    let x ={
      page:cPage,
      size: 10,
      keyword: this.key
    };
    this.http
    .post('https://localhost:44368/' + '​/api​/ChucVu​/search-chuc-vu', x)
    .subscribe(
      (result) =>{
        this.key = result;
        this.key = this.key.data;
        console.log(this.key);
      },
      (error) => console.error(error)
    );
  }

  
}
