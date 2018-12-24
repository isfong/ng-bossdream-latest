import { Injectable }                from '@angular/core';
import { HttpClient }                from "@angular/common/http";
import { MENU_KEY, Permit }          from "@mod/permit/permit";
import { API }                       from "@mod/api/api";
import { Response }                  from "@mod/response/response";
import { Observable }                from "rxjs";
import { CryptoService }             from "@ser/crypto/crypto.service";
import { SessionStorageService }     from "@ser/session-storage/session-storage.service";
import { LocalStorageService }       from "@ser/local-storage/local-storage.service";
import { TokenService }              from "@ser/token/token.service";
import { Router }                    from "@angular/router";
import { MenuService, TitleService } from "@delon/theme";
import { ReuseTabService }           from "@delon/abc";
import { TranslateService }          from "@ngx-translate/core";


@Injectable( {
  providedIn: 'root'
} )
export class PermitsService {

  constructor( private http: HttpClient,
               private router: Router,
               private cryptoSer: CryptoService,
               private sessionStorageSer: SessionStorageService,
               private localStorageSer: LocalStorageService,
               private tokenSer: TokenService,
               private menuSer: MenuService,
               private reuseTabSer: ReuseTabService,
               private titleSer: TitleService,
               private translateSer: TranslateService ) {
  }

  add( permit: Permit ): Observable<Response> {
    return this.http.post<Response>( API.uri.commons.permit.add, permit );
  }

  update( permit: Permit ): Observable<Response> {
    return this.http.put<Response>( API.uri.commons.permit.update, permit );
  }

  /**
   * 列表
   * @returns {Observable<Response>}
   */
  list(): Observable<Response> {
    return this.http.get<Response>( API.uri.commons.permit.list );
  }

  /**
   * 删除
   * @param {string} id
   * @returns {Observable<Response>}
   */
  delete( id: string ): Observable<Response> {
    return this.http.delete<Response>( API.uri.commons.permit.delete + '/' + id );
  }


  /**
   * 分级
   * @param {Permit[]} permits
   * @returns {any}
   */
  level( permits: Permit[] ): any {
    let level0 = [];
    let level1 = [];
    let level2 = [];
    let level3 = [];
    if ( permits.length > 0 ) {
      permits.forEach( function ( item ) {
        if ( item.level === 0 ) {
          level0.push( item );
        } else if ( item.level === 1 ) {
          level1.push( item );
        } else if ( item.level === 2 ) {
          level2.push( item );
        } else {
          level3.push( item );
        }
      } );
    }
    return {
      level0: level0,
      level1: level1,
      level2: level2,
      level3: level3
    };
  }


  /**
   * 通过permits数组tree
   * @param {Permit[]} permits
   * @param selectedKeys
   * @returns {any[]}
   */
  nzTree( permits: Permit[], selectedKeys?: string[] ): any[] {
    let level = this.level( permits );
    let level0 = level.level0;
    let level1 = level.level1;
    let level2 = level.level2;
    let level3 = level.level3;
    let nzTreeNodes: any[] = [];
    level0.forEach( ( item0 ) => {
      let childrenFor0: any[] = [];
      level1.forEach( item1 => {
        if ( item1.pid === item0.id ) {

          let childrenFor1: any[] = [];
          level2.forEach( item2 => {
            if ( item2.pid === item1.id ) {

              let childrenFor2: any[] = [];
              level3.forEach( item3 => {
                if ( item3.pid === item2.id ) {
                  let se: boolean = selectedKeys.indexOf( item3.id ) != -1;
                  let child3 = {
                    origin: item3,
                    key: item3.id,
                    title: item3.text,
                    icon: item3.icon,
                    selected: se,
                    expanded: se,
                    isLeaf: true
                  };
                  childrenFor2.push( child3 );
                }
              } );
              let isLeaf = childrenFor2.length <= 0;
              let se: boolean = selectedKeys.indexOf( item2.id ) != -1;
              let child2 = {
                origin: item2,
                key: item2.id,
                title: item2.text,
                icon: item2.icon,
                selected: se,
                expanded: se,
                isLeaf: isLeaf,
                children: childrenFor2
              };
              childrenFor1.push( child2 );
            }
          } );
          let isLeaf = childrenFor1.length <= 0;
          let se: boolean = selectedKeys.indexOf( item1.id ) != -1;
          let child1 = {
            origin: item1,
            key: item1.id,
            title: item1.text,
            icon: item1.icon,
            selected: se,
            expanded: se,
            isLeaf: isLeaf,
            children: childrenFor1
          };
          childrenFor0.push( child1 );
        }
      } );
      let isLeaf = childrenFor0.length <= 0;
      let se: boolean = selectedKeys.indexOf( item0.id ) != -1;
      let nzTreeNode0 = {
        origin: item0,
        key: item0.id,
        title: item0.text,
        icon: item0.icon,
        selected: se,
        expanded: se,
        isLeaf: isLeaf,
        children: childrenFor0
      };

      nzTreeNodes.push( nzTreeNode0 );
    } );
    console.log( 'nzTreeNodes', nzTreeNodes );
    return nzTreeNodes;
  }

  private sort( permits: Permit[] ): string {
    let levelObj = this.level( permits );
    let level0 = levelObj.level0;
    let level1 = levelObj.level1;
    let level2 = levelObj.level2;
    let level3 = levelObj.level3;
    let builder = '[';
    level0.forEach( ( item0, index0 ) => {
      builder += '{"text": "' + item0.text + '", "i18n": "' + item0.i18n + '", "link": "' + item0.link + '", "group": true, "hideInBreadcrumb": true, "children": [';
      level1.forEach( ( item1, index1 ) => {
        if ( item1.pid === item0.id ) {
          builder += '{"text": "' + item1.text + '", "i18n": "' + item1.i18n + '", "link": "' + item1.link + '", "icon": "' + item1.icon + '", "badge":' + item1.badge + ', "children": [';
          level2.forEach( ( item2, index2 ) => {
            if ( item2.pid === item1.id ) {
              builder += '{"text": "' + item2.text + '", "i18n": "' + item2.i18n + '", "link": "' + item2.link + '", "icon": "' + item2.icon + '", "badge":' + item2.badge + ', "children": [';
              level3.forEach( ( item3, index3 ) => {
                if ( item3.pid === item2.id ) {
                  builder += '{"text": "' + item3.text + '", "i18n": "' + item3.i18n + '", "link": "' + item3.link + '", "icon": "' + item3.icon + '", "badge":' + item3.badge + ', "children": [';
                  builder += ']},';
                }
                if ( index3 === level3.length - 1 && builder.lastIndexOf( ',' ) === builder.length - 1 ) {
                  builder = builder.substring( 0, builder.lastIndexOf( ',' ) );
                }
              } );
              builder += ']},';
            }
            if ( index2 === level2.length - 1 && builder.lastIndexOf( ',' ) === builder.length - 1 ) {
              builder = builder.substring( 0, builder.lastIndexOf( ',' ) );
            }
          } );
          builder += ']},';
        }
        if ( index1 === level1.length - 1 && builder.lastIndexOf( ',' ) === builder.length - 1 ) {
          builder = builder.substring( 0, builder.lastIndexOf( ',' ) );
        }
      } );
      builder += ']},';
      if ( index0 === level0.length - 1 && builder.lastIndexOf( ',' ) === builder.length - 1 ) {
        builder = builder.substring( 0, builder.lastIndexOf( ',' ) );
      }
    } );
    builder += ']';
    return builder;
  }


  private personal() {
    let sub = this.tokenSer.sub;
    let principal = JSON.stringify( { type: sub.type, username: sub.username } );
    this.http.get<Response>( API.uri.commons.permit.personal + '/' + principal + '/' + sub.id + '/' + sub.type ).subscribe( res => {
      if ( res.it ) {
        this.personal();
      } else if ( res.ok ) {
        let menuString = this.sort( res.result );
        let menuCrypto = this.cryptoSer.aesEncrypt( menuString );
        if ( this.tokenSer.remember ) {
          this.localStorageSer.set( MENU_KEY, menuCrypto )
        } else {
          this.sessionStorageSer.set( MENU_KEY, menuCrypto );
        }
        this.resetMenu( JSON.parse( menuString ) );
      }
    } );
  }

  loadMenus() {
    if ( !this.tokenSer.sub ) {
      this.localStorageSer.del( MENU_KEY );
      this.sessionStorageSer.del( MENU_KEY );
      this.router.navigateByUrl( '/passport/sign-in' ).catch();
    }
    let menuCrypto = '';
    if ( this.tokenSer.remember ) {
      menuCrypto = this.localStorageSer.get( MENU_KEY )
    } else {
      menuCrypto = this.sessionStorageSer.get( MENU_KEY );
    }
    if ( menuCrypto ) {
      this.resetMenu( JSON.parse( this.cryptoSer.aesDecrypt( menuCrypto ) ) );
      return;
    }
    this.personal();
  }

  deletedMenus() {
    this.localStorageSer.del( MENU_KEY );
    this.sessionStorageSer.del( MENU_KEY );
  }

  private resetMenu( menus: any[] ) {
    this.menuSer.add( menus );
    this.translateSer.get( 'uri' + ( this.router.url.replace( /\//g, '.' ) ) ).subscribe( title => {
      this.titleSer.setTitle( title );
    } );
    this.reuseTabSer.clear();
    this.menuSer.openedByUrl( this.router.url );
    this.menuSer.resume();
  }
}
