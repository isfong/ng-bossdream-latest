import { Injectable }    from '@angular/core';
import { HttpClient }    from "@angular/common/http";
import { Observable }    from "rxjs";
import { Response }      from "@mod/response/response";
import { API }           from "@mod/api/api";
import { Administrator } from "@mod/administrator/administrator";
import { Md5 }           from "ts-md5";

@Injectable( {
  providedIn: 'root'
} )
export class AdministratorService {

  constructor( private request: HttpClient ) {
  }

  list( num: number, size: number ): Observable<Response> {
    return this.request.get<Response>( API.uri.commons.administrator.list + '/' + num + '/' + size );
  }

  exist( username: string ): Observable<Response> {
    return this.request.get<Response>( API.uri.commons.administrator.exist + '/' + username );
  }

  add( administrator: Administrator ): Observable<Response> {
    administrator.password = Md5.hashStr( Md5.hashStr( administrator.password ).toString() ).toString();
    return this.request.post<Response>( API.uri.commons.administrator.add, administrator );
  }
}
