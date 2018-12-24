import { Component, OnDestroy, OnInit }                    from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from "@angular/forms";
import { Router }                                          from "@angular/router";

@Component( {
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: [ './sign-up.component.less' ]
} )
export class SignUpComponent implements OnInit, OnDestroy {
  form: FormGroup;
  error = '';
  type = 0;
  loading = false;
  visible = false;
  status = 'pool';
  progress = 0;
  passwordProgressMap = {
    ok: 'success',
    pass: 'normal',
    pool: 'exception',
  };
  count = 0;
  interval$: any;

  constructor(
    fb: FormBuilder,
    private router: Router,
  ) {
    this.form = fb.group( {
      userType: [
        '1',
        [
          Validators.required,
        ],
      ],
      mobilePrefix: [ '+86' ],
      mobile: [ null, [ Validators.required, Validators.pattern( /^1\d{10}$/ ) ] ],
      captcha: [ null, [ Validators.required ] ],
      password: [
        null,
        [
          Validators.required,
          Validators.minLength( 6 ),
          SignUpComponent.checkPassword.bind( this ),
        ],
      ],
      confirm: [
        null,
        [
          Validators.required,
          Validators.minLength( 6 ),
          SignUpComponent.passwordEquar,
        ],
      ],
      userGender: [
        '1',
        [
          Validators.required,
        ],
      ],
      mail: [ null, [ Validators.email ] ],
      referrer: [ null, [ Validators.pattern( /^1\d{10}$/ ) ] ],
    } );
  }

  ngOnInit() {
  }

  ngOnDestroy(): void {
    if ( this.interval$ ) clearInterval( this.interval$ );
  }


  static checkPassword( control: FormControl ) {
    if ( !control ) return null;
    const self: any = this;
    self.visible = !!control.value;
    if ( control.value && control.value.length > 9 ) self.status = 'ok';
    else if ( control.value && control.value.length > 5 ) self.status = 'pass';
    else self.status = 'pool';

    if ( self.visible )
      self.progress =
        control.value.length * 10 > 100 ? 100 : control.value.length * 10;
  }

  static passwordEquar( control: FormControl ) {
    if ( !control || !control.parent ) return null;
    if ( control.value !== control.parent.get( 'password' ).value ) {
      return { equar: true };
    }
    return null;
  }

  // region: fields
  get userType() {
    return this.form.controls.userType;
  }

  get mobile() {
    return this.form.controls.mobile;
  }

  get captcha() {
    return this.form.controls.captcha;
  }

  get password() {
    return this.form.controls.password;
  }

  get confirm() {
    return this.form.controls.confirm;
  }

  get userGender() {
    return this.form.controls.userGender;
  }

  get mail() {
    return this.form.controls.mail;
  }

  get referrer() {
    return this.form.controls.referrer;
  }

  getCaptcha() {
    this.count = 59;
    this.interval$ = setInterval( () => {
      this.count -= 1;
      if ( this.count <= 0 ) clearInterval( this.interval$ );
    }, 1000 );
  }

  // endregion

  submit() {
    this.error = '';
    for ( const i in this.form.controls ) {
      this.form.controls[ i ].markAsDirty();
      this.form.controls[ i ].updateValueAndValidity();
    }
    if ( this.form.invalid ) return;
    // mock http
    this.loading = true;
    setTimeout( () => {
      this.loading = false;
      this.router.navigate( [ '/passport/register-result' ] ).catch( err => {
        console.log( err );
      } );
    }, 1000 );
  }
}
