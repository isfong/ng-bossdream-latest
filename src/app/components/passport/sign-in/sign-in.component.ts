import { Component, Inject, OnDestroy, OnInit, Optional } from '@angular/core';
import { FormBuilder, FormGroup, Validators }             from "@angular/forms";
import { Router }                                         from "@angular/router";
import { NzMessageService, NzModalService }               from "ng-zorro-antd";
import { ReuseTabService }                                from "@delon/abc";
import { AuthService }                                    from "@ser/auth/auth.service";
import { TokenService }                                   from "@ser/token/token.service";
import { ResponseUtils }                                  from "@mod/response/response";

@Component( {
  selector: 'app-passport-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: [ './sign-in.component.less' ]
} )
export class SignInComponent implements OnInit, OnDestroy {

  form: FormGroup;
  error = '';
  loading = false;
  interval$: any;

  constructor( fb: FormBuilder,
               private router: Router,
               public msgSer: NzMessageService,
               private modalSrv: NzModalService,
               @Optional()
               @Inject( ReuseTabService )
               private reuseTabSer: ReuseTabService,
               private tokenSer: TokenService,
               private authSer: AuthService,
  ) {
    this.form = fb.group( {
      username: [ null, [ Validators.required, Validators.minLength( 4 ) ] ],
      password: [ null, Validators.required ],
      remember: [ false ],
    } );
    modalSrv.closeAll();
  }

  ngOnInit(): void {
    this.tokenSer.del();
  }

  ngOnDestroy(): void {
    if ( this.interval$ ) clearInterval( this.interval$ );
  }

  // region: fields

  get username() {
    return this.form.controls.username;
  }

  get password() {
    return this.form.controls.password;
  }

  get remember() {
    return this.form.controls.remember;
  }

  get type() {
    if ( new RegExp( /^1\d{10}$/ ).test( this.username.value ) ) {
      return 2;
    } else {
      return 0;
    }
  }

  switch( e: any ) {
    console.log( e );
    console.log( this.error );
  }

  // endregion

  submit() {
    console.log( "记住我? ", this.remember.value );
    this.error = '';
    this.username.markAsDirty();
    this.username.updateValueAndValidity();
    this.password.markAsDirty();
    this.password.updateValueAndValidity();
    if ( this.username.invalid || this.password.invalid ) return;
    this.loading = true;
    this.authSer.oauth_token( this.username.value, this.password.value, this.type ).subscribe(
      next => {
        console.log( next );
        if ( next.ok ) {
          let token = next.result;
          this.tokenSer.set( token, this.remember.value );
          // 清空路由复用信息
          this.reuseTabSer.clear();
          this.router.navigate( [ '/console' ] ).catch();
        } else {
          this.msgSer.error( ResponseUtils.errMsg( next ) );
        }
        this.loading = false;
      } );
  }

}
