import { Component, OnInit } from '@angular/core';

@Component( {
  selector: 'app-console-header-application',
  templateUrl: './application.component.html',
  styleUrls: [ './application.component.less' ]
} )
export class ApplicationComponent implements OnInit {

  loading = true;

  constructor() {
  }

  ngOnInit() {
  }

  change() {
    setTimeout( () => ( this.loading = false ), 500 );
  }
}
