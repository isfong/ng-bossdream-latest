import { Injectable }             from '@angular/core';
import { SessionStorageService }  from "@ser/session-storage/session-storage.service";
import { LocalStorageService }    from "@ser/local-storage/local-storage.service";
import { JwtHelperService }       from "@auth0/angular-jwt";
import { OAuth2Token, TokenEnum } from "@mod/token/token";
import { MENU_KEY }               from "@mod/permit/permit";

const jwt = new JwtHelperService();
const key = "5E551E95DE6376B5AA9E35E4F6E5EB19";
@Injectable( {
  providedIn: 'root'
} )
export class TokenService {

  constructor( private ss: SessionStorageService,
               private ls: LocalStorageService ) {
  }

  set( token: OAuth2Token, remember: boolean ) {
    if ( remember ) {
      this.ls.set( key, JSON.stringify( token ) );
    }
    this.ss.set( key, JSON.stringify( token ) );
  }

  get remember(): boolean {
    let token = this.ls.get( key );
    return token !== null && token !== undefined && token !== '';
  }

  get token(): OAuth2Token {
    let token = this.ls.get( key );
    if ( !token ) {
      token = this.ss.get( key );
    }
    if ( token === null ) return null;
    return JSON.parse( token );
  }

  del() {
    this.ls.del( key );
    this.ss.del( key );
    this.ls.del( MENU_KEY );
    this.ss.del( MENU_KEY );
  }

  payload( tokenEnum: number ): any {
    let payload: any = null;
    let token = this.token;
    if ( token ) {
      switch ( tokenEnum ) {
        case TokenEnum.Access:
          payload = jwt.decodeToken( token.access_token );
          break;
        case TokenEnum.Refresh:
          payload = jwt.decodeToken( token.refresh_token );
          break;
      }
    }
    return payload;
  }

  get sub(): any {
    let token = this.token;
    if ( token ) {
      return token.sub;
    }
    return null;
  }

  /**
   * AccessToken小于60秒视为过期
   */
  get expiredAccessToken(): boolean {
    let token = this.token;
    if ( token ) {
      let current: number = parseInt( ( new Date().getTime() / 1000 ).toString() );
      console.log( "token是否过期? this.payload( TokenEnum.Access ).exp - current < 60? ", this.payload( TokenEnum.Access ).exp - current < 60 );
      return this.payload( TokenEnum.Access ).exp - current < 60;
    }
    return true;
  }

  /**
   * RefreshToken小于60秒视为过期
   */
  get expiredRefreshToken(): boolean {
    let token = this.token;
    if ( token ) {
      let current: number = parseInt( ( new Date().getTime() / 1000 ).toString() );
      console.log( this.payload( TokenEnum.Refresh ).exp - current );
      return this.payload( TokenEnum.Refresh ).exp - current < 60;
    }
    return true;
  }
}
