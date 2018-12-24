import { Component, Inject, OnInit }         from '@angular/core';
import { DOCUMENT }                          from '@angular/common';
import { ALAIN_I18N_TOKEN, SettingsService } from '@delon/theme';
import { I18nService }                       from '@ser/i18n/i18n.service';

@Component( {
  selector: 'app-console-header-i18n',
  templateUrl: './i18n.component.html',
  styleUrls: [ './i18n.component.less' ]
} )
export class I18nComponent implements OnInit {
  languages: any[];

  constructor(
    public settings: SettingsService,
    @Inject( ALAIN_I18N_TOKEN ) private i18n: I18nService,
    @Inject( DOCUMENT ) private doc: any
  ) {
    this.languages = this.i18n.languages;
  }

  ngOnInit() {
  }

  change( lang: string ) {
    const spinEl = this.doc.createElement( 'div' );
    spinEl.setAttribute( 'class', `page-loading ant-spin ant-spin-lg ant-spin-spinning` );
    spinEl.innerHTML = `<span class="ant-spin-dot ant-spin-dot-spin"><i></i><i></i><i></i><i></i></span>`;
    this.doc.body.appendChild( spinEl );
    this.i18n.use( lang );
    this.settings.setLayout( 'lang', lang );
    setTimeout( () => this.doc.location.reload() );
  }
}
