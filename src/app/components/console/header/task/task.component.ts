import { Component, OnInit } from '@angular/core';

@Component( {
  selector: 'app-console-header-task',
  templateUrl: './task.component.html',
  styleUrls: [ './task.component.less' ]
} )
export class TaskComponent implements OnInit {
  loading = true;

  constructor() {
  }

  ngOnInit() {
  }

  change() {
    setTimeout( () => ( this.loading = false ), 500 );
  }
}
