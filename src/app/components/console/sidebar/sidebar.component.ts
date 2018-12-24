import { Component, OnInit } from '@angular/core';
import { API }               from "@mod/api/api";
import { TokenService }      from "@ser/token/token.service";
import { NzMessageService }  from "ng-zorro-antd";
import { Router }            from "@angular/router";

@Component( {
  selector: 'app-console-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: [ './sidebar.component.less' ]
} )
export class SidebarComponent implements OnInit {

  ossPre: string = API.uri.oss_pre;

  // noinspection JSUnusedGlobalSymbols
  constructor(
    public tokens: TokenService,
    public msg: NzMessageService,
    private router: Router,
  ) {
  }

  ngOnInit() {
  }

  signOut() {
    this.router.navigateByUrl( '/passport/sign-in' ).catch();
  }
}
