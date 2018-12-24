import { Component, Inject, OnInit }         from '@angular/core';
import { Router }                            from "@angular/router";
import { I18nService }                       from "@ser/i18n/i18n.service";
import { ALAIN_I18N_TOKEN, SettingsService } from "@delon/theme";
import { DOCUMENT }                          from "@angular/common";

@Component( {
  selector: 'app-public',
  templateUrl: './public.component.html',
  styleUrls: [ './public.component.less' ]
} )
export class PublicComponent implements OnInit {
  languages: any[];

  protected navigationList = [
    {
      title: 'uri.index',
      href: '/',
      icon: 'home',
      active: false
    },
    {
      title: 'uri.cases',
      href: '/cases',
      icon: 'flag',
      active: false
    },
    {
      title: 'uri.news',
      href: '/news',
      icon: 'dribbble-square',
      active: false
    },
    {
      title: 'uri.about',
      href: '/about',
      icon: 'smile',
      active: false
    },
    {
      title: 'uri.console',
      href: '/console/home',
      icon: 'code',
      active: false
    }
  ];

  protected links: any[] = [];

  /* 导航active */
  tabSelectedNum = -1;

  constructor( private router: Router,
               private i18n: I18nService,
               public settings: SettingsService,
               @Inject( ALAIN_I18N_TOKEN ) private i18nInject: I18nService,
               @Inject( DOCUMENT ) private doc: any ) {
    this.languages = this.i18n.languages;

    switch ( this.i18n.currentLang ) {
      case 'en':
        this.links = [
          {
            title: 'Help',
            href: '',
          },
          {
            title: 'Privacy',
            href: '',
          },
          {
            title: 'Agreement',
            href: '',
          },
        ];
        break;
      default:
        this.links = [
          {
            title: '帮助',
            href: '',
          },
          {
            title: '隐私',
            href: '',
          },
          {
            title: '协议',
            href: '',
          },
        ];
        break;
    }
  }

  ngOnInit() {
    for ( let i = 0; i < this.navigationList.length; i++ ) {
      if ( this.router.url.endsWith( this.navigationList[ i ].href ) ) {
        this.tabSelectedNum = i;
        break;
      }
    }
  }

  tabClick( navigation ) {
    this.router.navigate( [ navigation.href ] ).catch();
  }

  languageChange( lang: string ) {
    const spinEl = this.doc.createElement( 'div' );
    spinEl.setAttribute( 'class', `page-loading ant-spin ant-spin-lg ant-spin-spinning` );
    spinEl.innerHTML = `<span class="ant-spin-dot ant-spin-dot-spin"><i></i><i></i><i></i><i></i></span>`;
    this.doc.body.appendChild( spinEl );
    this.i18n.use( lang );
    this.settings.setLayout( 'lang', lang );
    setTimeout( () => this.doc.location.reload() );
  }
}
