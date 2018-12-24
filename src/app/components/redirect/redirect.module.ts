import { NgModule }              from '@angular/core';
import { RedirectComponent }     from '@com/redirect/redirect.component';
import { RedirectRoutingModule } from "@com/redirect/redirect-routing/redirect-routing.module";

@NgModule( {
  imports: [
    RedirectRoutingModule
  ],
  declarations: [ RedirectComponent ]
} )
export class RedirectModule {
}
