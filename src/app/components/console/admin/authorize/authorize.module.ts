import { NgModule }               from '@angular/core';
import { SharedModule }           from "@sha/shared.module";
import { RoleComponent }          from "@com/console/admin/authorize/role/role.component";
import { PermitComponent }        from "@com/console/admin/authorize/permit/permit.component";
import { RoleAddComponent }       from '@com/console/admin/authorize/role/role-add/role-add.component';
import { RoleEditComponent }      from '@com/console/admin/authorize/role/role-edit/role-edit.component';
import { RolePermitsComponent }   from '@com/console/admin/authorize/role/role-permits/role-permits.component';
import { PermitAddComponent }     from "@com/console/admin/authorize/permit/permit-add/permit-add.component";
import { PermitEditComponent }    from "@com/console/admin/authorize/permit/permit-edit/permit-edit.component";
import { AuthorizeRoutingModule } from "@com/console/admin/authorize/authorize-routing/authorize-routing.module";

@NgModule( {
  imports: [ SharedModule, AuthorizeRoutingModule ],
  declarations: [ PermitComponent, RoleComponent, PermitAddComponent, PermitEditComponent, RoleEditComponent, RoleAddComponent, RolePermitsComponent ],
  entryComponents: [ PermitAddComponent, PermitEditComponent, RoleEditComponent, RoleAddComponent, RolePermitsComponent ]
} )
export class AuthorizeModule {
}
