import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs";
import { Response }   from "@mod/response/response";
import { API }        from "@mod/api/api";

@Injectable( {
  providedIn: 'root'
} )
export class AreaService {

  constructor( private request: HttpClient ) {
  }

  list( level: number ): Observable<Response> {
    return this.request.get<Response>( API.uri.commons.area.list + '/' + level );
  }

  children( id: number ): Observable<Response> {
    return this.request.get<Response>( API.uri.commons.area.children + '/' + id );
  }
}
