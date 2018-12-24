import { Component, OnInit } from '@angular/core';
import { SettingsService }   from '@delon/theme';

@Component( {
  selector: 'app-console-header',
  templateUrl: './header.component.html',
  styleUrls: [ './header.component.less' ]
} )
export class HeaderComponent implements OnInit {
  searchToggleStatus: boolean;
  constructor( public settings: SettingsService ) {
  }

  ngOnInit() {
  }

  toggleCollapsedSidebar() {
    this.settings.setLayout( 'collapsed', !this.settings.layout.collapsed );
  }

  searchToggleChange() {
    this.searchToggleStatus = !this.searchToggleStatus;
  }
}
