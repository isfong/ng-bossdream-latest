import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs";
import { Response }   from "@mod/response/response";
import { API }        from "@mod/api/api";

@Injectable( {
  providedIn: 'root'
} )
export class RolePermitsService {

  constructor( private request: HttpClient ) {
  }

  list( roleId: number ): Observable<Response> {
    return this.request.get<Response>( API.uri.commons.role_permit.list + '/' + roleId );
  }

  update( roleId: number, permitIdArray: string[] ): Observable<Response> {
    let rolePermits: any[] = [];
    for ( const permitId of permitIdArray ) rolePermits.push( { id: null, permitId, roleId } )
    return this.request.put<Response>( API.uri.commons.role_permit.update + '/' + roleId, rolePermits );
  }
}
