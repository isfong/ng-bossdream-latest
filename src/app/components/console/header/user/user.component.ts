import { Component, OnInit } from '@angular/core';
import { Router }                    from '@angular/router';
import { SettingsService }           from '@delon/theme';
import { TokenService }              from "@ser/token/token.service";
import { API }                       from "@mod/api/api";

@Component( {
  selector: 'app-console-header-user',
  templateUrl: './user.component.html',
  styleUrls: [ './user.component.less' ]
} )
export class UserComponent implements OnInit {
  ossPre: string = API.uri.oss_pre;

  constructor(
    public settings: SettingsService,
    public tokenSer: TokenService,
    private router: Router,
  ) {
  }

  ngOnInit() {
  }

  logout() {
    this.router.navigateByUrl( '/passport/sign-in' ).catch();
  }
}
