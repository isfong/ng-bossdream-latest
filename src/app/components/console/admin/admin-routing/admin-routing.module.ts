import { NgModule }             from '@angular/core';
import { RouterModule, Routes } from "@angular/router";

const admin_routes: Routes = [
  { path: 'authorize', loadChildren: '../authorize/authorize.module#AuthorizeModule' },
  { path: 'orders', loadChildren: '../order/order.module#OrderModule' }
];

@NgModule( {
  declarations: [],
  imports: [
    RouterModule.forChild( admin_routes )
  ],
  exports: [ RouterModule ]
} )
export class AdminRoutingModule {
}
