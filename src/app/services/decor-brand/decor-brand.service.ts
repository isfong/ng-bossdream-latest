import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs";
import { Response }   from "@mod/response/response";
import { API }        from "@mod/api/api";


@Injectable( {
  providedIn: 'root'
} )
export class DecorBrandService {

  constructor( private request: HttpClient ) {
  }

  list( name?: string, typeId?: number ): Observable<Response> {
    let params = { name: null, typeId: null };
    if ( name ) params.name = name;
    if ( typeId ) params.typeId = typeId;
    return this.request.get<Response>( API.paramsWithUrl( API.uri.business.decor_bran.list, params ) );
  }
}
