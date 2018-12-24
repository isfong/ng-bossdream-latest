import { NgModule }             from '@angular/core';
import { RouterModule, Routes } from "@angular/router";
import { RedirectComponent }    from "@com/redirect/redirect.component";

const routes: Routes = [
  { path: '', component: RedirectComponent, data: { title: 'loading' } }
];

@NgModule( {
  imports: [ RouterModule.forChild( routes ) ],
  exports: [ RouterModule ]
} )
export class RedirectRoutingModule {
}
