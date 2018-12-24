import { NgModule }              from '@angular/core';
import { SharedModule }          from "@sha/shared.module";
import { PassportRoutingModule } from "@com/passport/passport-routing/passport-routing.module";
import { PassportComponent }     from '@com/passport/passport.component';
import { SignInComponent }       from '@com/passport/sign-in/sign-in.component';
import { SignUpComponent }       from '@com/passport/sign-up/sign-up.component';

@NgModule( {
  imports: [
    SharedModule, PassportRoutingModule
  ],
  declarations: [ PassportComponent, SignInComponent, SignUpComponent ]
} )
export class PassportModule {
}
