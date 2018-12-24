import { Injectable, Injector }                                 from '@angular/core';
import { HttpEvent, HttpHandler, HttpInterceptor, HttpRequest } from "@angular/common/http";
import { TokenService }                                         from "@ser/token/token.service";
import { Observable }                                           from "rxjs";
import { Router }                                               from "@angular/router";
import { NzModalService }                                       from "ng-zorro-antd";
import { Md5 }                                                  from "ts-md5";

@Injectable( {
  providedIn: 'root'
} )
export class RequestInterceptorService implements HttpInterceptor {
  ignoreUriPatterns: string[] = [
    '/assets/tmp/**',
    '/commons/oauth/**',
  ];
  signatureContent: string = '';

  constructor( private injector: Injector,
               private tokenSer: TokenService ) {
  }

  get msg(): NzModalService {
    return this.injector.get( NzModalService );
  }

  private goTo( url: string ) {
    setTimeout( () => this.injector.get( Router ).navigateByUrl( url ) );
  }

  private inPatterns( url: string ): boolean {
    for ( let i = 0; i < this.ignoreUriPatterns.length; i++ ) {
      let pattern = this.ignoreUriPatterns[ i ];
      if ( pattern.endsWith( '*' ) ) pattern = pattern.replace( new RegExp( '\\*', 'g' ), '' );
      if ( url.startsWith( pattern ) ) return true;
    }
    return false;
  }

  private signature( req: HttpRequest<any> ): string {
    this.signatureContent = '';
    if ( req.body ) {
      if ( Array.isArray( req.body ) ) {
        this.signatureContent += JSON.stringify( req.body ) + '&';
      } else if ( req.body.entries ) {
        let entries = req.body.entries();
        let names = [];
        while ( true ) {
          let nt = entries.next();
          if ( nt.done ) break;
          names.push( nt.value[ 0 ] );
        }
        names.sort();
        if ( names[ 0 ] === 'files' ) names.splice( 0, 1 );
        for ( let name of names ) {
          let value = req.body.get( name );
           if ( value === null || value === 'null' ) continue;
          this.signatureContent += name + '=' + value + '&';
        }
      } else {
        let keys = [];
        for ( let key in req.body ) if ( req.body.hasOwnProperty( key ) ) keys.push( key );
        keys.sort();
        for ( let key of keys ) {
          let value = req.body[ key ];
          if ( value === null || value === 'null' ) continue;
          this.signatureContent += key + '=' + value + '&';
        }
      }
    }
    let url = req.url;
    if ( url.indexOf( '?' ) !== -1 && url.lastIndexOf( '=' ) !== -1 ) {
      this.signatureContent = url.substring( url.indexOf( '?' ) + 1 ) + '&';
      url = url.substring( 0, url.indexOf( '?' ) );
    }
    this.signatureContent += 'method=' + encodeURI( url );
    this.signatureContent = this.signatureContent.replace( /\s/g, '' );
    console.log( 'signatureContent[' + this.signatureContent + ']' );
    return Md5.hashStr( this.signatureContent ).toString().toUpperCase();
  }

  intercept( req: HttpRequest<any>, next: HttpHandler ): Observable<HttpEvent<any>> {
    req = req.clone( { setHeaders: { 'x-api-key': this.signature( req.clone() ) } } );
    if ( this.inPatterns( req.url ) ) return next.handle( req );
    if ( !this.tokenSer.token ) {
      // 不存在去登录
      this.tokenSer.del();
      let _this = this;
      this.msg.error( {
        nzTitle: '登录超时', nzContent: '你的登录已超时，请重新登录', nzClosable: false, nzMaskClosable: false,
        nzOnOk: () => {
          _this.goTo( '/passport/sign-in' );
        }
      } );
    }
    // 设置token授权头信息
    const access_token = `Bearer ${this.tokenSer.token.access_token}`;
    req = req.clone( {
      setHeaders: {
        Authorization: access_token
      }
    } );
    return next.handle( req );

  }
}
