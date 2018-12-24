import { NgModule }             from '@angular/core';
import { RouterModule, Routes } from "@angular/router";
import { ErrorComponent }       from "@com/error/error.component";
import { Error403Component }    from "@com/error/error403/error403.component";
import { Error404Component }    from "@com/error/error404/error404.component";
import { Error500Component }    from "@com/error/error500/error500.component";

const routes: Routes = [
  {
    path: '',
    component: ErrorComponent,
    children: [
      { path: '403', component: Error403Component, data: { titleI18n: 'uri.error.403' } },
      { path: '404', component: Error404Component, data: { titleI18n: 'uri.error.404' } },
      { path: '500', component: Error500Component, data: { titleI18n: 'uri.error.500' } }
    ]
  }
];

@NgModule( {
  imports: [ RouterModule.forChild( routes ) ],
  exports: [ RouterModule ]
} )
export class ErrorRoutingModule {
}
