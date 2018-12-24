import { Component, OnInit } from '@angular/core';
import { NzModalService }    from "ng-zorro-antd";

@Component( {
  selector: 'app-error-error403',
  templateUrl: './error403.component.html',
  styleUrls: [ './error403.component.less' ]
} )
export class Error403Component implements OnInit {

  constructor( private modalSer: NzModalService ) {
    modalSer.closeAll();
  }

  ngOnInit() {
  }

}
