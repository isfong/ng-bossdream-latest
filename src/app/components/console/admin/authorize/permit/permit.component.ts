import { Component, OnInit }                            from '@angular/core';
import { NzMessageService, NzModalService, NzTreeNode } from "ng-zorro-antd";
import { Permit }                                       from "@mod/permit/permit";
import { PermitsService }                               from "@ser/permit/permits.service";
import { PermitEditComponent }                          from "@com/console/admin/authorize/permit/permit-edit/permit-edit.component";
import { PermitAddComponent }                           from "@com/console/admin/authorize/permit/permit-add/permit-add.component";
import { Response, ResponseUtils }                      from "@mod/response/response";

@Component( {
  selector: 'app-console-admin-authorize-permit',
  templateUrl: './permit.component.html',
  styleUrls: [ './permit.component.less' ]
} )
export class PermitComponent implements OnInit {
  nodes: any[];
  options = {};
  pText: string;
  id: string;
  title: string;
  pre: string;
  permit: Permit;
  selected = {
    id: '',
    badge: 0,
    i18n: '',
    icon: '',
    link: '',
    level: 0,
    pid: '',
    text: '',
  };
  node: NzTreeNode;
  spinning: boolean = true;
  visible = false;

  constructor( private permitSer: PermitsService,
               private msgSer: NzMessageService,
               private modalSer: NzModalService ) {
  }

  ngOnInit() {
    this.list();
  }

  open(): void {
    this.visible = true;
  }

  close(): void {
    this.visible = false;
  }

  list() {
    this.spinning = true;
    this.permitSer.list().subscribe( ( res: Response ) => {
        if ( res.code === 200 ) {
          this.nodes = this.permitSer.nzTree( res.result, [] );
          console.log( this.nodes );
          this.spinning = false;
        } else if ( ResponseUtils.it( res ) ) {
          this.list();
        } else {
          this.modalSer.warning( {
            nzTitle: '警告', nzContent: ResponseUtils.errMsg( res )
          } );
          this.spinning = false;
        }
      }
    );
  }

  clearSelected() {
    this.selected = {
      id: '',
      badge: 0,
      i18n: '',
      icon: '',
      link: '',
      level: 0,
      pid: '',
      text: '',
    };
  }

  nzClick( ev: any ) {
    if ( ev.node.isSelected ) {
      this.node = ev.node;
      console.log( ev );
      this.selected = this.node.origin.origin;
      console.log( this.selected );
      this.open();
    } else {
      this.clearSelected();
      this.close();
    }
  }

  /**
   * 详情处按钮处理
   * @param {string} type
   * @param {string} btn
   * @returns {boolean}
   */
  handle( type: string, btn: string ) {
    if ( !this.selected.id && !btn ) {
      this.msgSer.error( '请点击选择一个要操作目标权限' );
      return false;
    }
    switch ( type ) {
      /*--------------------add-----------------------------*/
      case 'add':
        if ( btn === 'root' ) {
          this.pText = '系统';
          this.pre = "导航";
          if ( this.nodes.length > 0 ) {
            let last_root_node = this.nodes[ this.nodes.length - 1 ].origin;
            let last_char_num = last_root_node.id.substring( last_root_node.id.lastIndexOf( '-' ) + 1, last_root_node.id.length ).charCodeAt( null );
            if ( last_char_num === 90 ) {
              this.msgSer.error( '根导航已满26个，不能再加了' );
              break;
            }
            this.id = last_root_node.pid + '-' + String.fromCharCode( last_char_num + 1 );
          } else {
            this.id = 'A-A';
          }
          this.permit = {
            id: this.id,
            pid: 'A',
            badge: 0,
            level: 0,
            text: '',
            link: '',
            icon: '',
            i18n: ''
          };
        } else {
          this.pText = this.selected.text;
          this.pre = "权限";
          if ( this.node.children.length > 0 ) {
            let lastChildId = this.node.children[ this.node.children.length - 1 ].origin.origin.id;
            console.log( this.node.children[ this.node.children.length - 1 ] );
            let num = lastChildId.substring( lastChildId.lastIndexOf( '-' ) + 1, lastChildId.length ).charCodeAt( null );
            if ( num >= 90 ) {
              this.msgSer.error( '栏目已满不能再加了' );
              break;
            }
            this.id = this.selected.id + '-' + String.fromCharCode( num + 1 );
          } else {
            this.id = this.selected.id + '-A';
          }
          if ( this.selected.level === 3 ) {
            this.msgSer.warning( '容不下更多了，总衍生层级不能多余四级' );
            break;
          }
          this.permit = {
            id: this.id,
            pid: this.selected.id,
            level: this.selected.level + 1,
            badge: 0,
            text: '',
            link: '',
            icon: '',
            i18n: ''
          };
        }
        this.add( 'lg' );
        break;
      /*--------------------add-----------------------------*/

      /*--------------------edit-----------------------------*/
      case 'edit':
        if ( this.selected.level === 0 ) {
          this.pText = '系统';
          this.pre = '导航';
        } else {
          this.pText = this.node.parentNode.origin.origin.text;
          this.pre = '权限';
        }
        this.permit = this.selected;
        this.edit( 'lg' );
        break;
      /*--------------------edit-----------------------------*/

      /*--------------------delete-----------------------------*/
      case 'del':
        let target = '导航';
        if ( this.selected.level !== 0 ) {
          target = '权限';
        }
        if ( this.selected.text === '主页' && this.selected.link === '/console/home' ) {
          this.msgSer.error( '主页不允许删除!' );
          break;
        }
        if ( this.node.children.length !== 0 ) {
          this.msgSer.error( target + ' "' + this.selected.text + '" 包含子集, 请先删除其所有子集元素', { nzDuration: 2000 } );
          break;
        }
        this.modalSer.confirm(
          {
            nzTitle: '删除提醒',
            nzContent: '你确定删除' + target + ' "' + this.selected.text + '" 吗？',
            nzOnOk: () => {
              this.delete( this.selected.id );
            }
          }
        );
        break;
      /*--------------------delete-----------------------------*/
    }
  }

  delete( id ) {
    this.permitSer.delete( id ).subscribe( res => {
        if ( res.ok ) {
          this.list();
          this.close();
          this.clearSelected();
          this.modalSer.success( { nzTitle: res.sub_msg } );
          //this.msgSer.success( res.sub_msg );
        } else if ( res.it ) {
          this.delete( id );
        } else {
          this.modalSer.warning( { nzTitle: '警告', nzContent: ResponseUtils.errMsg( res ) } );
        }
      }
    );
  }

  contact() {
    this.msgSer.warning( '请找欧阳锋' );
  }

  /**
   * 显示新增组件
   * @param {"" | "lg" | "sm"} size
   */
  add( size: '' | 'lg' | 'sm' = '' ) {
    this.options = {
      nzWrapClassName: size ? 'modal-' + size : '',
      nzContent: PermitAddComponent,
      nzFooter: null,
      nzClosable: false,
      nzMaskClosable: false,
      nzComponentParams: {
        pText: this.pText,
        pre: this.pre,
        permit: this.permit
      }
    };
    this.modalSer.create( this.options ).afterClose.subscribe( res => {
      if ( res.toString() === 'success-call' ) {
        this.close();
        this.list();
        this.clearSelected();
      }
    } );
  }

  /**
   * 显示更新组件
   * @param {"" | "lg" | "sm"} size
   */

  edit( size: '' | 'lg' | 'sm' = '' ) {
    this.options = {
      nzWrapClassName: size ? 'modal-' + size : '',
      nzContent: PermitEditComponent,
      nzFooter: null,
      nzClosable: false,
      nzMaskClosable: false,
      nzComponentParams: {
        pText: this.pText,
        pre: this.pre,
        originPermit: this.permit
      }
    };
    this.modalSer.create( this.options ).afterClose.subscribe( status => {
      if ( status.toString() === 'success-call' ) {
        this.close();
        this.list();
        this.clearSelected();
      }
    } );
  }
}
