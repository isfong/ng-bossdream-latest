import { NgModule }                     from '@angular/core';
import { RouterModule, Routes }         from "@angular/router";
import { OrdinaryRepairOrderComponent } from "@com/console/admin/order/ordinary-repair-order/ordinary-repair-order.component";

const order_routes: Routes = [
  { path: 'ordinary-repair-order', component: OrdinaryRepairOrderComponent }
];

@NgModule( {
  imports: [ RouterModule.forChild( order_routes ) ],
  exports: [ RouterModule ]
} )
export class OrderRoutingModule {
}
