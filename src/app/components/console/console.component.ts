import { Component, OnInit }                                                              from '@angular/core';
import { MenuService, ScrollService, SettingsService }                                    from '@delon/theme';
import { NzMessageService }                                                               from 'ng-zorro-antd';
import { NavigationCancel, NavigationEnd, NavigationError, RouteConfigLoadStart, Router } from '@angular/router';
import { PermitsService }                                                                 from "@ser/permit/permits.service";
import { TokenService }                                                                   from "@ser/token/token.service";

@Component( {
  selector: 'app-console',
  templateUrl: './console.component.html',
  styleUrls: [ './console.component.less' ]
} )
export class ConsoleComponent implements OnInit {
  isFetching = false;

  constructor(
    public router: Router,
    scroll: ScrollService,
    msg: NzMessageService,
    public settings: SettingsService,
    private menuSer: MenuService,
    private permitSer: PermitsService,
    private tokenSer: TokenService,
  ) {
    router.events.subscribe( evt => {
      if ( !this.isFetching && evt instanceof RouteConfigLoadStart ) {
        this.isFetching = true;
      }
      if ( evt instanceof NavigationError || evt instanceof NavigationCancel ) {
        this.isFetching = false;
        if ( evt instanceof NavigationError ) {
          msg.error( `无法加载${evt.url}路由`, { nzDuration: 1000 * 3 } );
        }
        return;
      }
      if ( !( evt instanceof NavigationEnd ) ) {
        return;
      }
      setTimeout( () => {
        scroll.scrollToTop();
        this.isFetching = false;
      }, 100 );
    } );
  }

  ngOnInit() {
    //console.log( 'in console .....................', this.menuSer.menus );
    /*let sub = this.tokenSer.sub;
    console.log( sub );
    let principal = JSON.stringify( { type: sub.type, username: sub.username } );
    this.permitSer.personal( principal, sub.id, sub.type ).subscribe( res => {
      console.log( res );
      if ( res.ok ) {
        this.menuSer.add( JSON.parse( this.permitSer.sort( res.result ) ) );
        this.menuSer.openedByUrl( this.router.url );
      }
    } );*/
  }

}
