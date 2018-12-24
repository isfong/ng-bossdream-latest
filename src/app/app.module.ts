import { BrowserModule }                                   from '@angular/platform-browser';
import { APP_INITIALIZER, LOCALE_ID, NgModule }            from '@angular/core';
import { registerLocaleData }                              from '@angular/common';
import localeZh                                            from '@angular/common/locales/zh';
import { AppRoutingModule }                                from '@app/app-routing.module';
import { AppComponent }                                    from '@app/app.component';
import { HTTP_INTERCEPTORS, HttpClient, HttpClientModule } from '@angular/common/http';
import { TranslateHttpLoader }                             from '@ngx-translate/http-loader';
import { StartupService }                                  from '@ser/startup/startup.service';
import { ServicesModule }                                  from '@ser/services.module';
import { ALAIN_I18N_TOKEN, AlainThemeModule }              from '@delon/theme';
import { I18nService }                                     from '@ser/i18n/i18n.service';
import { TranslateLoader, TranslateModule }                from '@ngx-translate/core';
import { BrowserAnimationsModule }                         from '@angular/platform-browser/animations';
import { SharedModule }                                    from '@app/shared/shared.module';
import { DelonUtilModule }                                 from '@delon/util';
import { DelonACLModule }                                  from '@delon/acl';
import { DelonAuthModule }                                 from '@delon/auth';
import { DelonABCModule }                                  from '@delon/abc';
import { NgZorroAntdModule }                               from 'ng-zorro-antd';
import { DelonCacheModule }                                from '@delon/cache';
import { RequestInterceptorService }                       from "@ser/request-interceptor/request-interceptor.service";
import { ResponseInterceptorService }                      from "@ser/response-interceptor/response-interceptor.service";

registerLocaleData( localeZh );

export function TranslateHttpLoaderFactory( http: HttpClient ) {
  return new TranslateHttpLoader( http, `/assets/tmp/i18n/`, '.json' );
}

export function StartupServiceFactory(
  startupService: StartupService,
): Function {
  return () => startupService.load();
}

@NgModule( {
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    HttpClientModule,
    SharedModule,
    AppRoutingModule,
    ServicesModule,
    NgZorroAntdModule,
    AlainThemeModule.forRoot(),
    DelonABCModule.forRoot(),
    DelonAuthModule.forRoot(),
    DelonACLModule.forRoot(),
    DelonCacheModule.forRoot(),
    DelonUtilModule.forRoot(),
    TranslateModule.forRoot( {
      loader: {
        provide: TranslateLoader,
        useFactory: TranslateHttpLoaderFactory,
        deps: [ HttpClient ],
      }
    } )
  ],
  providers: [
    I18nService,
    { provide: LOCALE_ID, useValue: 'zh-Hans' },
    { provide: HTTP_INTERCEPTORS, useClass: RequestInterceptorService, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: ResponseInterceptorService, multi: true },
    { provide: ALAIN_I18N_TOKEN, useClass: I18nService, multi: false },
    { provide: APP_INITIALIZER, useFactory: StartupServiceFactory, deps: [ StartupService ], multi: true }
  ],
  bootstrap: [ AppComponent ]
} )
export class AppModule {
}
