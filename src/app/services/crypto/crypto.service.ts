import { Injectable } from '@angular/core';
import { enc }        from 'crypto-js';
import { mode }       from 'crypto-js';
import { pad }        from 'crypto-js';
import { AES }        from "crypto-js";

@Injectable( {
  providedIn: 'root'
} )
export class CryptoService {
  private aesKey: string = enc.Utf8.parse( '51340723C241893C1C291028C7876B3B'.substring( 16 ) );

  constructor() {
  }

  /**
   * AES 加密
   * @param {string} unencrypted
   * @returns {string}
   */
  aesEncrypt( unencrypted: string ): string {
    let encrypted = AES.encrypt( enc.Utf8.parse( unencrypted ), this.aesKey, {
      mode: mode.ECB,
      padding: pad.Pkcs7
    } );
    return encrypted.toString();
  }

  /**
   * AES 解密
   * @param {string} encrypted
   * @returns {string}
   */
  aesDecrypt( encrypted: string ): string {
    let unencrypted = AES.decrypt( encrypted, this.aesKey, {
      mode: mode.ECB,
      padding: pad.Pkcs7
    } );
    // noinspection ALL
    return unencrypted.toString( enc.Utf8 );
  }
}
