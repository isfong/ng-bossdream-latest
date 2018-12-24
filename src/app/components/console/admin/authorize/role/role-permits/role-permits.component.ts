import { Component, Input, OnInit }     from '@angular/core';
import { PermitsService }               from "@ser/permit/permits.service";
import { NzMessageService, NzModalRef } from "ng-zorro-antd";
import { RolePermitsService }           from "@ser/role-permit/role-permits.service";

@Component( {
  selector: 'app-console-admin-authorize-role-permits',
  templateUrl: './role-permits.component.html',
  styleUrls: [ './role-permits.component.less' ]
} )
export class RolePermitsComponent implements OnInit {
  loading = false;
  cancel_btn = '取消';
  submit_btn = '提交';
  nodes = [];
  selectedKeys: string[] = [];
  selectedKeysBackup: string[] = [];
  @Input()
  rolePermits: any[];
  @Input()
  roleId: number;

  constructor( private permitSer: PermitsService,
               private rolePermitsSer: RolePermitsService,
               private msg: NzMessageService,
               private modalRef: NzModalRef ) {
  }

  ngOnInit() {
    for ( const e of this.rolePermits ) {
      this.selectedKeys.push( e.permitId );
      this.selectedKeys.sort();
      this.selectedKeysBackup = JSON.parse( JSON.stringify( this.selectedKeys ) );
    }

    this.list();

  }

  list() {
    this.permitSer.list().subscribe( res => {
      if ( res.ok ) {
        this.nodes = this.permitSer.nzTree( res.result, this.selectedKeys );
        this.loading = false;
      } else if ( res.it ) {
        this.list();
      } else {
        this.msg.error( res.sub_msg );
        this.loading = false;
      }
    } );
  }

  click( $event ) {
    let node = $event.node;
    if ( node.isSelected ) {
      switch ( node.level ) {
        case 1:
          node.parentNode.isSelected = true;
          if ( $event.keys.indexOf( node.parentNode.key ) == -1 ) {
            $event.keys.push( node.parentNode.key );
            $event.keys.sort();
          }
          break;
        case 2:
          node.parentNode.isSelected = true;
          if ( $event.keys.indexOf( node.parentNode.key ) == -1 ) {
            $event.keys.push( node.parentNode.key );
            $event.keys.sort();
          }
          node.parentNode.parentNode.isSelected = true;
          if ( $event.keys.indexOf( node.parentNode.parentNode.key ) == -1 ) {
            $event.keys.push( node.parentNode.parentNode.key );
            $event.keys.sort();
          }
          break;
        case 3:
          node.parentNode.isSelected = true;
          if ( $event.keys.indexOf( node.parentNode.key ) == -1 ) {
            $event.keys.push( node.parentNode.key );
            $event.keys.sort();
          }
          node.parentNode.parentNode.isSelected = true;
          if ( $event.keys.indexOf( node.parentNode.parentNode.key ) == -1 ) {
            $event.keys.push( node.parentNode.parentNode.key );
            $event.keys.sort();
          }
          node.parentNode.parentNode.parentNode.isSelected = true;
          if ( $event.keys.indexOf( node.parentNode.parentNode.parentNode.key ) == -1 ) {
            $event.keys.push( node.parentNode.parentNode.parentNode.key );
            $event.keys.sort();
          }
          break;
      }
    } else {
      // node.isSelected = false;
      // let index = $event.keys.indexOf( node.key );
      // if ( index != -1 ) {
      //   $event.keys.splice( index );
      //   $event.keys.sort();
      // }
      switch ( node.level ) {
        case 0:
          node.children.forEach( c1 => {
            c1.children.forEach( c2 => {
              c2.children.forEach( c3 => {
                c3.isSelected = false;
                let index = $event.keys.indexOf( c3.key );
                if ( index != -1 ) {
                  $event.keys.splice( index );
                  $event.keys.sort();
                }
              } );
              c2.isSelected = false;
              let index = $event.keys.indexOf( c2.key );
              if ( index != -1 ) {
                $event.keys.splice( index );
                $event.keys.sort();
              }
            } );
            c1.isSelected = false;
            let index = $event.keys.indexOf( c1.key );
            if ( index != -1 ) {
              $event.keys.splice( index );
              $event.keys.sort();
            }
          } );
          break;
        case 1:
          node.children.forEach( c2 => {
            c2.children.forEach( c3 => {
              c3.isSelected = false;
              let index = $event.keys.indexOf( c3.key );
              if ( index != -1 ) {
                $event.keys.splice( index );
                $event.keys.sort();
              }
            } );
            c2.isSelected = false;
            let index = $event.keys.indexOf( c2.key );
            if ( index != -1 ) {
              $event.keys.splice( index );
              $event.keys.sort();
            }
          } );
          break;
        case 2:
          node.children.forEach( c3 => {
            c3.isSelected = false;
            let index = $event.keys.indexOf( c3.key );
            if ( index != -1 ) {
              $event.keys.splice( index );
              $event.keys.sort();
            }
          } );
          break;
      }
    }
    this.selectedKeys = $event.keys;
    console.log( 'this.selectedKeys->', this.selectedKeys );
  }

  submit() {
    console.log( this.selectedKeys.length );
    if ( this.selectedKeys.length < 1 ) {
      this.msg.error( '尚未选择任何权限' );
      return false;
    }
    if ( JSON.stringify( this.selectedKeys ) === JSON.stringify( this.selectedKeysBackup ) ) {
      this.msg.error( '权限未变更' );
      return false;
    }
    this.loading = true;
    this.update();
  }

  update() {
    this.rolePermitsSer.update( this.roleId, this.selectedKeys ).subscribe( res => {
      if ( res.ok ) {
        this.msg.success( res.sub_msg );
        this.loading = false;
        this.cancel( 'success-call' );
      } else if ( res.it ) {
        this.update();
      } else {
        this.msg.error( res.sub_msg );
        this.loading = false;
      }
    } );
  }


  cancel( type: string ) {
    this.modalRef.destroy( type );
  }
}
