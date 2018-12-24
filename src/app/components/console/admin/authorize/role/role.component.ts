import { Component, OnInit }                from '@angular/core';
import { API }                              from "@mod/api/api";
import { Role }                             from "@mod/role/role";
import { NzMessageService, NzModalService } from "ng-zorro-antd";
import { RoleService }                      from "@ser/role/role.service";
import { Response, ResponseUtils }          from "@mod/response/response";
import { RoleAddComponent }                 from "@com/console/admin/authorize/role/role-add/role-add.component";
import { RoleEditComponent }                from "@com/console/admin/authorize/role/role-edit/role-edit.component";
import { RolePermitsComponent }             from "@com/console/admin/authorize/role/role-permits/role-permits.component";
import { RolePermitsService }               from "@ser/role-permit/role-permits.service";

@Component( {
  selector: 'app-console-admin-authorize-role',
  templateUrl: './role.component.html',
  styleUrls: [ './role.component.less' ]
} )
export class RoleComponent implements OnInit {

  prefix: string = API.uri.oss_pre;

  options = {};
  roles: Role[] = [];
  loading = true;
  keywords: string;

  constructor( public msg: NzMessageService,
               private modal: NzModalService,
               private roleSer: RoleService,
               private rolePermitsSer: RolePermitsService ) {
  }

  ngOnInit() {
    this.loading = true;
    this.list();
  }


  list() {
    this.roleSer.list().subscribe( ( res: Response ) => {
        if ( res.ok ) {
          this.roles = res.result;
        } else if ( ResponseUtils.it( res ) ) {
          this.list();
        } else {
          this.msg.error( res.sub_msg );
        }
        this.loading = false;
      }
    );
  }

  add() {
    this.options = {
      nzWrapClassName: 'modal-lg',
      nzContent: RoleAddComponent,
      nzFooter: null,
      nzClosable: false,
      nzMaskClosable: false,
      nzShowConfirmLoading: true
    };
    this.modal.create( this.options ).afterClose.subscribe( status => {
      if ( status.toString() === 'success-call' ) {
        this.list();
      }
    } );
  }

  edit( role: Role ) {
    this.options = {
      nzWrapClassName: 'modal-lg',
      nzContent: RoleEditComponent,
      nzFooter: null,
      nzClosable: false,
      nzMaskClosable: false,
      nzShowConfirmLoading: true,
      nzComponentParams: {
        source: role
      }
    };
    this.modal.create( this.options ).afterClose.subscribe( status => {
      if ( status.toString() === 'success-call' ) {
        this.list();
      }
    } );
  }

  delete( role: Role ) {
    this.modal.confirm( {
      nzTitle: '删除提醒',
      nzContent: '你确定删除角色 "' + role.name + '" 吗？',
      nzOnOk: () => {
        this.loading = true;
        this.roleSer.delete( role.id ).subscribe( res => {
          if ( res.code === 200 ) {
            this.msg.success( res.sub_msg );
            this.list();
          } else if ( ResponseUtils.it( res ) ) {
            this.delete( role );
          } else {
            this.msg.error( res.sub_msg );
          }
          this.loading = false;
        } );
      }
    } );
  }

  permits( role: Role ) {
    this.loading = true;
    this.rolePermitsSer.list( role.id ).subscribe( res => {
      if ( res.ok ) {
        this.options = {
          nzWrapClassName: '',
          nzWidth: 300,
          nzContent: RolePermitsComponent,
          nzFooter: null,
          nzClosable: false,
          nzMaskClosable: false,
          nzShowConfirmLoading: true,
          nzComponentParams: {
            rolePermits: res.result,
            roleId: role.id
          }
        };
        this.modal.create( this.options ).afterClose.subscribe( res => {
          if ( res === 'success-call' ) this.list();
        } );
        this.loading = false;
      } else if ( res.it ) {
        this.permits( role );
      } else {
        this.msg.error( ResponseUtils.errMsg( res ) );
        this.loading = false;
      }
    } );

  }

  search() {
    if ( this.keywords ) this.msg.success( this.keywords + "......" );
    else this.msg.error( '请输入角色名称/角色代码' );
  }

}
