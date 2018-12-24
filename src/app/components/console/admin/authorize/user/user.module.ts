import { NgModule }                   from '@angular/core';
import { SharedModule }               from "@sha/shared.module";
import { UserRoutingModule }          from "@com/console/admin/authorize/user/user-routing/user-routing.module";
import { AdministratorComponent }     from '@com/console/admin/authorize/user/administrator/administrator.component';
import { AdministratorAddComponent }  from '@com/console/admin/authorize/user/administrator/administrator-add/administrator-add.component';
import { AdministratorRoleComponent } from '@com/console/admin/authorize/user/administrator/administrator-role/administrator-role.component';

@NgModule( {
  imports: [ SharedModule, UserRoutingModule ],
  declarations: [ AdministratorComponent, AdministratorAddComponent, AdministratorRoleComponent ],
  entryComponents: [ AdministratorAddComponent, AdministratorRoleComponent ]
} )
export class UserModule {
}
