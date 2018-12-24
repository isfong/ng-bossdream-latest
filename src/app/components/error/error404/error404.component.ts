import { Component, OnInit } from '@angular/core';
import { NzModalService }    from "ng-zorro-antd";

@Component( {
  selector: 'app-error-error404',
  templateUrl: './error404.component.html',
  styleUrls: [ './error404.component.less' ]
} )
export class Error404Component implements OnInit {

  constructor( private modalSer: NzModalService ) {
    modalSer.closeAll();
  }

  ngOnInit() {
  }

}
