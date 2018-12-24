import { NgModule }                     from '@angular/core';
import { SharedModule }                 from "@sha/shared.module";
import { OrderRoutingModule }           from "@com/console/admin/order/order-routing/order-routing.module";
import { OrdinaryRepairOrderComponent } from '@com/console/admin/order/ordinary-repair-order/ordinary-repair-order.component';

@NgModule( {
  imports: [ SharedModule, OrderRoutingModule ],
  declarations: [ OrdinaryRepairOrderComponent ]
} )
export class OrderModule {
}
