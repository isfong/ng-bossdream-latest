import { NgModule }             from '@angular/core';
import { RouterModule, Routes } from "@angular/router";
import { PermitComponent }      from "@com/console/admin/authorize/permit/permit.component";
import { RoleComponent }        from "@com/console/admin/authorize/role/role.component";

const authorize_routes: Routes = [
  { path: 'permit', component: PermitComponent },
  { path: 'role', component: RoleComponent },
  { path: 'user', loadChildren: '../user/user.module#UserModule' }
];

@NgModule( {
  imports: [
    RouterModule.forChild( authorize_routes )
  ],
  exports: [ RouterModule ]
} )
export class AuthorizeRoutingModule {
}
