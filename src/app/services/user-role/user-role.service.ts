import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs";
import { Response }   from "@mod/response/response";
import { API }        from "@mod/api/api";
import { UserRole }   from "@mod/user-role/user-role";

@Injectable( {
  providedIn: 'root'
} )
export class UserRoleService {

  constructor( private req: HttpClient ) {
  }

  list( userId: number, userType: number ): Observable<Response> {
    return this.req.get<Response>( API.uri.commons.user_role.list + '/' + userId + '/' + userType );
  }

  update( userId: number, userType: number, userRoles: UserRole[] ): Observable<Response> {
    return this.req.put<Response>( API.uri.commons.user_role.update + '/' + userId + '/' + userType, userRoles );
  }
}
