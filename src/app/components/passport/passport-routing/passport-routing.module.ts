import { NgModule }             from '@angular/core';
import { RouterModule, Routes } from "@angular/router";
import { PassportComponent }    from "@com/passport/passport.component";
import { SignInComponent }      from "@com/passport/sign-in/sign-in.component";
import { SignUpComponent }      from "@com/passport/sign-up/sign-up.component";

const routes: Routes = [
  {
    path: '',
    component: PassportComponent,
    children: [
      { path: 'sign-in', component: SignInComponent, data: { titleI18n: 'uri.passport.sign-in' } },
      { path: 'sign-up', component: SignUpComponent, data: { titleI18n: 'uri.passport.sign-up' } }
    ]
  }
];

@NgModule( {
  imports: [ RouterModule.forChild( routes ) ],
  exports: [ RouterModule ]
} )
export class PassportRoutingModule {
}
