import { NgModule }           from '@angular/core';
import { SharedModule }       from "@sha/shared.module";
import { ErrorRoutingModule } from "@com/error/error-routing/error-routing.module";
import { ErrorComponent }     from '@com/error/error.component';
import { Error403Component }  from '@com/error/error403/error403.component';
import { Error404Component }  from '@com/error/error404/error404.component';
import { Error500Component }  from '@com/error/error500/error500.component';

@NgModule( {
  imports: [
    SharedModule, ErrorRoutingModule
  ],
  declarations: [ ErrorComponent, Error403Component, Error404Component, Error500Component ]
} )
export class ErrorModule {
}
