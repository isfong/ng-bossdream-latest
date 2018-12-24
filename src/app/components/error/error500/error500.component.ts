import { Component, OnInit } from '@angular/core';
import { NzModalService }    from "ng-zorro-antd";

@Component( {
  selector: 'app-error500',
  templateUrl: './error500.component.html',
  styleUrls: [ './error500.component.less' ]
} )
export class Error500Component implements OnInit {

  constructor( private modalSer: NzModalService ) {
    modalSer.closeAll();
  }

  ngOnInit() {
  }

}
