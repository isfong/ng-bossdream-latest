import { Component, Input, OnInit }     from '@angular/core';
import { RoleService }                  from "@ser/role/role.service";
import { UserRoleService }              from "@ser/user-role/user-role.service";
import { Role }                         from "@mod/role/role";
import { NzMessageService, NzModalRef } from "ng-zorro-antd";
import { ResponseUtils }                from "@mod/response/response";
import { API }                          from "@mod/api/api";
import { UserRole }                     from "@mod/user-role/user-role";

@Component( {
  selector: 'app-administrator-role',
  templateUrl: './administrator-role.component.html',
  styleUrls: [ './administrator-role.component.less' ]
} )
export class AdministratorRoleComponent implements OnInit {

  @Input()
  userRoleIds: number[];
  userRoleIdsBackup: string;
  @Input()
  id: number;
  userRoles: UserRole[] = [];
  roles: Role[];
  loading = false;
  oss = API.uri.oss_pre;

  constructor( private roleSer: RoleService,
               private userRoleSer: UserRoleService,
               private msg: NzMessageService,
               private modalRef: NzModalRef ) {
  }

  ngOnInit() {
    this.userRoleIdsBackup = JSON.stringify( this.userRoleIds );
    this.list();
  }

  list() {
    this.loading = true;
    this.roleSer.list().subscribe( res => {
      if ( res.ok ) {
        this.roles = res.result;
        this.loading = false;
      } else if ( res.it ) {
        this.list();
      } else {
        this.msg.error( ResponseUtils.errMsg( res ) );
        this.loading = false;
      }
    } );
  }

  ngModelChange( open, roleId ) {
    if ( open ) {
      this.userRoleIds.push( roleId )
    } else {
      this.userRoleIds.splice( this.userRoleIds.indexOf( roleId ), 1 );
    }
    this.userRoleIds.sort();
    console.log( this.userRoleIds );
  }

  submit() {
    if ( this.userRoleIdsBackup === JSON.stringify( this.userRoleIds ) ) {
      this.msg.error( '数据未修改' );
      return false;
    }
    this.loading = true;
    for ( const roleId of this.userRoleIds ) {
      this.userRoles.push( { id: null, roleId: roleId, userId: this.id, userType: 0 } )
    }
    this.update();
  }

  update() {
    this.userRoleSer.update( this.id, 0, this.userRoles ).subscribe( res => {
      if ( res.ok ) {
        this.cancel( 'success-call' );
      } else if ( res.it ) {
        this.update();
      } else {
        this.msg.error( ResponseUtils.errMsg( res ) );
      }
    } )
  }

  cancel( typ ) {
    this.modalRef.destroy( typ );
  }

}
