import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs";
import { API }        from "@mod/api/api";
import { Response }   from "@mod/response/response";

@Injectable( {
  providedIn: 'root'
} )
export class FileService {

  constructor( private httpClient: HttpClient ) {
  }

  /**
   * 上传多个
   * @param {File[]} files　文件数组
   * @param {string} save_dir　存储目录
   * @param {boolean} original　是否保留原始文件名
   * @returns {Observable<Response>}
   */
  uploads( files: File[], save_dir: string, original: boolean ): Observable<Response> {
    let formData = new FormData();
    files.forEach( file => {
      formData.append( "files", file );
    } );
    formData.append( "save_dir", save_dir );
    formData.append( "original", JSON.stringify( original ) );
    return this.httpClient.post<Response>( API.uri.commons.file.upload, formData );
  }

  /**
   * 上传单个
   * @param {File} file　文件
   * @param {string} save_dir　存储目录
   * @param {boolean} original　是否保留原始文件名
   * @returns {Observable<Response>}
   */
  upload( file: File, save_dir: string, original: boolean ): Observable<Response> {
    let files: File[] = [];
    files.push( file );
    return this.uploads( files, save_dir, original );
  }

  base64( img: File, callback: ( img: any ) => void ) {
    const reader = new FileReader();
    reader.addEventListener( 'load', () => callback( reader.result ) );
    reader.readAsDataURL( img );
  }
}
