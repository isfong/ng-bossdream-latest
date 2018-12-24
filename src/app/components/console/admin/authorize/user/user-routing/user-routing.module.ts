import { NgModule }               from '@angular/core';
import { RouterModule, Routes }   from "@angular/router";
import { AdministratorComponent } from "../administrator/administrator.component";

const user_routes: Routes = [
  { path: 'administrator', component: AdministratorComponent }
];

@NgModule( {
  imports: [
    RouterModule.forChild( user_routes )
  ],
  exports: [ RouterModule ]
} )
export class UserRoutingModule {
}
