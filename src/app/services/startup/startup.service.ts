import { Inject, Injectable }                                           from '@angular/core';
import { HttpClient }                                                   from '@angular/common/http';
import { ALAIN_I18N_TOKEN, MenuService, SettingsService, TitleService } from '@delon/theme';
import { TranslateService }                                             from '@ngx-translate/core';
import { I18nService }                                                  from '@ser/i18n/i18n.service';
import { catchError }                                                   from 'rxjs/operators';
import { zip }                                                          from 'rxjs';
import { ACLService }                                                   from '@delon/acl';

@Injectable( {
  providedIn: 'root'
} )
export class StartupService {

  constructor(
    private menuService: MenuService,
    private translate: TranslateService,
    @Inject( ALAIN_I18N_TOKEN ) private i18n: I18nService,
    private settingService: SettingsService,
    private aclService: ACLService,
    private titleService: TitleService,
    private httpClient: HttpClient
  ) {
  }

  load(): Promise<any> {
    // only works with promises
    // https://github.com/angular/angular/issues/15088
    return new Promise( ( resolve ) => {
      zip(
        this.httpClient.get( `/assets/tmp/i18n/${this.i18n.defaultLang}.json` ),
        this.httpClient.get( '/assets/tmp/app-data.json' ),
      )
        .pipe(
          // 接收其他拦截器后产生的异常消息
          catchError( ( [ langData, appData ] ) => {
            resolve( null );
            return [ langData, appData ];
          } ),
        )
        .subscribe(
          ( [ langData, appData ] ) => {
            // setting language data
            this.translate.setTranslation( this.i18n.defaultLang, langData );
            this.translate.setDefaultLang( this.i18n.defaultLang );

            // application data
            const res: any = appData;
            // 应用信息：包括站点名、描述、年份
            this.settingService.setApp( res.app );
            // 用户信息：包括姓名、头像、邮箱地址
            this.settingService.setUser( res.user );
            // ACL：设置权限为全量
            this.aclService.setFull( true );
            // 初始化菜单
            //this.menuService.add( res.menu );
            // 设置页面标题的后缀
            switch ( this.i18n.currentLang ) {
              case "en":
                this.titleService.suffix = res.app.name.split( "&" )[ 0 ];
                break;
              default:
                this.titleService.suffix = res.app.name.split( "&" )[ 1 ];
                break;
            }

          },
          () => {
          },
          () => {
            resolve( null );
          },
        );
    } );
  }
}
