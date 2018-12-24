import { Injectable }                                                                         from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, CanActivateChild, Router, RouterStateSnapshot } from "@angular/router";
import { Observable }                                                                         from "rxjs";
import { TokenService }                                                                       from "@ser/token/token.service";
import { NzModalService }                                                                     from "ng-zorro-antd";
import { PermitsService }                                                                     from "@ser/permit/permits.service";

/**
 * 路由守卫拦截器服务类
 */
@Injectable( {
  providedIn: 'root'
} )
export class RouterInterceptorService implements CanActivate, CanActivateChild {

  constructor( private router: Router,
               private tokenSer: TokenService,
               private modalSer: NzModalService,
               private permitSer: PermitsService ) {
  }

  /**
   * @param route 路由
   * @param state 状态
   * @return true: 跳转到当前路由, false: 不跳转到当前路由
   */
  canActivate( route: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<boolean> | Promise<boolean> | boolean {
    let routePath = route.routeConfig.path;
    console.log( "RouterInterceptorService.canActivate() 跳转到路由 =>", routePath );
    if ( routePath === 'console' ) {
      if ( !this.tokenSer.token ) {
        this.router.navigateByUrl( '/passport/sign-in' ).catch();
        return false;
      }

      if ( this.tokenSer.expiredRefreshToken ) {
        this.modalSer.warning( {
          nzTitle: '登录超时',
          nzContent: '您的登录凭证已经过期, 请重新登录',
          nzClosable: false,
          nzMaskClosable: false,
          nzOnOk: () => {
            this.tokenSer.del();
            this.router.navigateByUrl( '/passport/sign-in' ).catch();
          }
        } );
        return false;
      }

      this.permitSer.loadMenus();
    }
    return true;
  }

  canActivateChild( childRoute: ActivatedRouteSnapshot, state: RouterStateSnapshot ): Observable<boolean> | Promise<boolean> | boolean {
    let routePath = childRoute.routeConfig.path;
    console.log( "canActivateChild => ", routePath );
    return true;
  }

}
