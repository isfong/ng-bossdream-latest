import { Injectable }    from '@angular/core';
import { CryptoService } from "@ser/crypto/crypto.service";
import { Md5 }           from "ts-md5";

@Injectable( {
  providedIn: 'root'
} )
export class SessionStorageService {
  constructor( private crypto: CryptoService ) {
  }

  /**
   * 获取
   * @param {string} key
   * @returns {string}
   */
  get( key: string ) {
    let item = sessionStorage.getItem( Md5.hashStr( key ).toString() );
    if ( item ) {
      return this.crypto.aesDecrypt( item );
    }
    return null;
  }

  /**
   * 设置
   * @param {string} key
   * @param {string} value
   */
  set( key: string, value: string ) {
    sessionStorage.setItem(
      Md5.hashStr( key ).toString(),
      this.crypto.aesEncrypt( value )
    );
  }

  // noinspection JSMethodCanBeStatic,JSUnusedGlobalSymbols
  /**
   * 删除
   * @param {string} key
   */
  del( key: string ) {
    sessionStorage.removeItem( Md5.hashStr( key ).toString() );
  }

  // noinspection JSMethodCanBeStatic,JSUnusedGlobalSymbols
  /**
   * 清空
   */
  clear() {
    sessionStorage.clear();
  }

  // noinspection JSMethodCanBeStatic,JSUnusedGlobalSymbols
  /**
   * 判断
   * @param {string} key
   * @returns {boolean}
   */
  has( key: string ): boolean {
    return sessionStorage.getItem( Md5.hashStr( key ).toString() ) != null;
  }
}
