import { Component, OnInit } from '@angular/core';
import { I18nService }       from "@ser/i18n/i18n.service";

@Component( {
  selector: 'app-passport',
  templateUrl: './passport.component.html',
  styleUrls: [ './passport.component.less' ]
} )
export class PassportComponent implements OnInit {
  protected links: any[] = [];

  constructor( private i18n: I18nService ) {
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
  }

}
