import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs";
import { Md5 }        from "ts-md5";
import { API }        from "@mod/api/api";
import { Response }   from "@mod/response/response";

@Injectable( {
  providedIn: 'root'
} )
export class AuthService {

  constructor( private http: HttpClient ) {
  }

  /**
   * 登录
   * @param {string} username 用户名
   * @param {string} password 密码
   * @param {number} type 类型
   * @returns {Observable<Response>} response
   */
  oauth_token( username: string, password: string, type: number ): Observable<Response> {
    let body: FormData = new FormData();
    body.append( 'grant_type', 'password' );
    body.append( 'scope', 'all' );
    body.append( 'client_id', 'admin_client' );
    body.append( 'client_secret', 'admin_client_secret' );
    body.append( 'username', JSON.stringify( { type: type, username: username } ) );
    body.append( 'password', Md5.hashStr( Md5.hashStr( password ).toString() ).toString() );
    return this.http.post<Response>( API.uri.commons.oauth.token, body );
  }

  /**
   * 刷新token
   * @param refresh_token refresh_token值
   */
  refresh_token( refresh_token: string ): Observable<Response> {
    let body = new FormData();
    body.append( 'grant_type', 'refresh_token' );
    body.append( 'client_id', 'admin_client' );
    body.append( 'client_secret', 'admin_client_secret' );
    body.append( 'refresh_token', refresh_token );
    return this.http.post<Response>( API.uri.commons.oauth.token, body );
  }
}
