const commons = '/commons';
const business = '/business';

export class API {
  public static uri: any = {
    // oss
    oss_pre: 'https://bossdream-test.oss-cn-shanghai.aliyuncs.com/',

    // business
    business: {
      decor_bran: {
        list: business + '/decor-brand/list'
      }
    },
    // commons
    commons: {
      oauth: {
        // 登录
        token: commons + '/oauth/token'
      },
      file: {
        upload: commons + '/file/upload'
      },
      area: {
        list: commons + '/area/list',
        children: commons + '/area/children'
      },
      permit: {
        list: commons + '/permit/list',
        add: commons + '/permit/add',
        delete: commons + '/permit/delete',
        update: commons + '/permit/update',
        personal: commons + '/permit/personal'
      },
      role: {
        list: commons + '/role/list',
        add: commons + '/role/add',
        delete: commons + '/role/delete',
        update: commons + '/role/update',
        permits: commons + '/role/permits',
        role_permits: commons + '/role/role-permits',
      },
      role_permit: {
        list: commons + '/role-permit/list',
        update: commons + '/role-permit/update'
      },
      user_role: {
        list: commons + '/user-role/list',
        update: commons + '/user-role/update',
      },
      administrator: {
        list: commons + '/admin/list',
        exist: commons + '/admin/exist',
        add: commons + '/admin/add'
      },
      warehouse: {
        list: commons + '/warehouse/list'
      },
      biz_zone: {
        list: commons + '/biz-zone/list'
      },
      supplier: {
        list: commons + '/supplier/list'
      }
    },
  };

  static paramsWithUrl( url: string, paramsObject: any ): string {
    url += '?';
    let names = [];
    for ( let name in paramsObject ) if ( paramsObject.hasOwnProperty( name ) ) names.push( name );
    names.sort();
    for ( const name of names ) {
      let value = paramsObject[ name ];
      if ( !value ) continue;
      url += ( ( name + '=' + value ).replace( /&/g, '%26' ) + '&' );
    }
    return url.substring( 0, url.length - 1 );
  }
}
