import { Component, HostListener, OnInit }  from '@angular/core';
import { NzMessageService, NzModalService } from 'ng-zorro-antd';

@Component( {
  selector: 'app-console-header-storage',
  templateUrl: './storage.component.html',
  styleUrls: [ './storage.component.less' ],
  host: {
    '[class.d-block]': 'true'
  }
} )
export class StorageComponent implements OnInit {

  constructor(
    private modal: NzModalService,
    private msg: NzMessageService
  ) {
  }

  ngOnInit() {
  }

  @HostListener( 'click' )
  _click() {
    this.modal.confirm( {
      nzTitle: 'Make sure clear all local storage?',
      nzOnOk: () => {
        localStorage.clear();
        this.msg.success( 'Clear Finished!' );
      }
    } );
  }
}
