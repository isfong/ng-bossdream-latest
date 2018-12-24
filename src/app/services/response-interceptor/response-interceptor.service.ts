import { Injectable, Injector } from '@angular/core';
import { NzModalService }       from "ng-zorro-antd";
import {
  HttpErrorResponse, HttpHandler, HttpHeaderResponse,
  HttpInterceptor, HttpProgressEvent,
  HttpRequest,
  HttpResponse,
  HttpSentEvent, HttpUserEvent
}                               from "@angular/common/http";
import { Router }               from "@angular/router";
import { Observable, of }       from "rxjs";
import { _HttpClient }          from "@delon/theme";
import { catchError, mergeMap } from "rxjs/operators";
import { AuthService }          from "@ser/auth/auth.service";
import { TokenService }         from "@ser/token/token.service";

@Injectable( {
  providedIn: 'root'
} )
export class ResponseInterceptorService implements HttpInterceptor {

  constructor( private injector: Injector,
               private authSer: AuthService,
               private tokenSer: TokenService, ) {
  }

  get msg(): NzModalService {
    return this.injector.get( NzModalService );
  }

  private goTo( url: string ) {
    setTimeout( () => this.injector.get( Router ).navigateByUrl( url ) );
  }

  private handleData( event: HttpResponse<any> | HttpErrorResponse ): Observable<any> {
    // 可能会因为 `throw` 导出无法执行 `_HttpClient` 的 `end()` 操作
    this.injector.get( _HttpClient ).end();
    // 业务处理：一些通用操作
    switch ( event.status ) {
      case 200:
        let res = JSON.parse( JSON.stringify( event ) ).body;
        if ( res.code === 400 && res.sub_code === 'access_denied' ) this.goTo( `/error/403` );
        if ( res.code === 500 ) this.goTo( `/error/500` );
        break;
      case 401: // 未登录状态码
        this.goTo( '/passport/sign-in' );
        break;
      case 403:
      case 404:
      case 500:
        this.goTo( `/error/${event.status}` );
        break;
      default:
        if ( event instanceof HttpErrorResponse ) {
          if ( event.url ) {
            console.warn(
              '未可知错误，大部分是由于后端不支持CORS或无效配置引起',
              event,
            );
            // this.msg.error( event.message );
            let _this = this;
            this.msg.error( {
              nzTitle: '出错了',
              nzContent: '请求出错了, 请检查你的请求地址是否正确, 网络是否通畅, 服务器是否可用, 错误信息: ' + event.message,
              nzClosable: false,
              nzMaskClosable: false,
              nzOnOk: () => {
                _this.goTo( '/error/500' );
              }
            } );
          }
        }
        break;
    }
    return of( event );
  }

  intercept( req: HttpRequest<any>, next: HttpHandler ): Observable<| HttpSentEvent | HttpHeaderResponse | HttpProgressEvent | HttpResponse<any> | HttpUserEvent<any>> {
    // 统一加上服务端前缀
    let url = req.url;
    // if ( !url.startsWith( 'https://' ) && !url.startsWith( 'http://' ) ) {
    //   url = environment.SERVER_URL + url;
    // }
    const newReq = req.clone( {
      url: url,
    } );
    return next.handle( newReq ).pipe(
      mergeMap( ( event: any ) => {
        // 允许统一对请求错误处理，这是因为一个请求若是业务上错误的情况下其HTTP请求的状态是200的情况下需要
        if ( event instanceof HttpResponse && event.status === 200 ) {

          if ( event.body.sub_code === 'invalid_token' ) {
            this.authSer.refresh_token( this.tokenSer.token.refresh_token ).subscribe( res => {
              if ( res.code === 200 ) {
                this.tokenSer.set( res.result, this.tokenSer.remember );
              } else {
                let _this = this;
                this.msg.error( {
                  nzTitle: '登录超时', nzContent: '你的登录已超时，请重新登录', nzClosable: false, nzMaskClosable: false,
                  nzOnOk: () => {
                    _this.goTo( '/passport/sign-in' );
                  }
                } );
              }
            } );
          }

          return this.handleData( event );
        }
        // 若一切都正常，则后续操作
        return of( event );
      } ),
      catchError( ( err: HttpErrorResponse ) => this.handleData( err ) )
    );
  }
}
