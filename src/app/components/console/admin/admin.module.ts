import { NgModule }           from '@angular/core';
import { SharedModule }       from "@sha/shared.module";
import { AdminRoutingModule } from "@com/console/admin/admin-routing/admin-routing.module";

@NgModule( {
  imports: [ SharedModule, AdminRoutingModule ],
  declarations: []
} )
export class AdminModule {
}
