import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs";
import { Response }   from "@mod/response/response";
import { API }        from "@mod/api/api";

@Injectable( {
  providedIn: 'root'
} )
export class WarehouseService {

  constructor( private request: HttpClient ) {
  }

  list(): Observable<Response> {
    return this.request.get<Response>( API.uri.commons.warehouse.list );
  }
}
