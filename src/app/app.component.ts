import { Component, ElementRef, HostBinding, OnInit, Renderer2 } from '@angular/core';
import { SettingsService, TitleService }                         from '@delon/theme';
import { NavigationEnd, Router }                                 from '@angular/router';
import { VERSION as VERSION_ALAIN }                              from '@delon/theme';
import { VERSION as VERSION_ZORRO }                              from 'ng-zorro-antd';
import { filter }                                                from 'rxjs/operators';

@Component( {
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: [ './app.component.less' ]
} )
export class AppComponent implements OnInit {
  @HostBinding( 'class.layout-fixed' )
  get isFixed() {
    return this.settings.layout.fixed;
  }

  @HostBinding( 'class.layout-boxed' )
  get isBoxed() {
    return this.settings.layout.boxed;
  }

  @HostBinding( 'class.aside-collapsed' )
  get isCollapsed() {
    return this.settings.layout.collapsed;
  }

  constructor(
    el: ElementRef,
    renderer: Renderer2,
    private settings: SettingsService,
    private router: Router,
    private titleSrv: TitleService,
  ) {
    renderer.setAttribute(
      el.nativeElement,
      'ng-alain-version',
      VERSION_ALAIN.full,
    );
    renderer.setAttribute(
      el.nativeElement,
      'ng-zorro-version',
      VERSION_ZORRO.full,
    );
  }

  ngOnInit() {
    console.log( 'app ----------------', this.router.url );
    this.router.events
      .pipe( filter( evt => evt instanceof NavigationEnd ) )
      .subscribe( () => this.titleSrv.setTitle() );
  }
}
