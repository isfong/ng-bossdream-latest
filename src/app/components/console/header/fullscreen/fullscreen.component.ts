import { Component, HostListener, OnInit } from '@angular/core';
import * as screenfull                     from 'screenfull';
import { TranslateService }                from '@ngx-translate/core';

@Component( {
  selector: 'app-console-header-fullscreen',
  templateUrl: './fullscreen.component.html',
  styleUrls: [ './fullscreen.component.less' ],
  host: {
    '[class.d-block]': 'true',
  }
} )
export class FullscreenComponent implements OnInit {
  status = false;

  constructor( private translate: TranslateService ) {
  }

  ngOnInit() {
  }

  @HostListener( 'window:resize' )
  _resize() {
    this.status = screenfull.isFullscreen;
  }

  @HostListener( 'click' )
  _click() {
    if ( screenfull.enabled ) {
      screenfull.toggle();
    }
  }
}
