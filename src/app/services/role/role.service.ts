import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { Role }       from "@mod/role/role";
import { Observable } from "rxjs";
import { API }        from "@mod/api/api";
import { Response }   from "@mod/response/response";

@Injectable( {
  providedIn: 'root'
} )
export class RoleService {

  constructor( private httpClient: HttpClient ) {
  }

  /**
   * 新增
   * @param {Role} role
   * @returns {Observable<Response>}
   */
  add( role: Role ): Observable<Response> {
    return this.httpClient.post<Response>( API.uri.commons.role.add, role );
  }

  /**
   * 列表
   * @returns {Observable<Response>}
   */
  list(): Observable<Response> {
    return this.httpClient.get<Response>( API.uri.commons.role.list );
  }

  /**
   * 更新
   * @param {Role} role
   * @returns {Observable<Response>}
   */
  update( role: Role ): Observable<Response> {
    return this.httpClient.put<Response>( API.uri.commons.role.update, role );
  }

  /**
   * 删除
   * @param {number} id
   */
  delete( id: number ): Observable<Response> {
    return this.httpClient.delete <Response>( API.uri.commons.role.delete + '/' + id )
  }

  permits( id: number ): Observable<Response> {
    return this.httpClient.get<Response>( API.uri.commons.role.permits + '/' + id );
  }

  role_permits( id: number, rolePermits: any[] ): Observable<Response> {
    return this.httpClient.put<Response>( API.uri.commons.role.role_permits + '/' + id, rolePermits );
  }
}
