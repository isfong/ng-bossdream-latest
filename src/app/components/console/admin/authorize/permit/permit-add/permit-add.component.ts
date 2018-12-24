import { Component, Input, OnInit }           from '@angular/core';
import { FormBuilder, FormGroup, Validators } from "@angular/forms";
import { NzMessageService, NzModalRef }       from "ng-zorro-antd";
import { Permit }                             from "@mod/permit/permit";
import { PermitsService }                     from "@ser/permit/permits.service";

@Component( {
  selector: 'app-console-admin-authorize-permit-add',
  templateUrl: './permit-add.component.html',
  styleUrls: [ './permit-add.component.less' ]
} )
export class PermitAddComponent implements OnInit {
  @Input() pText: string; // 父name
  @Input() pre: string;
  @Input() permit: Permit;
  validateForm: FormGroup;
  btnLoading = false;
  cancel_btn = '取消';
  submit_btn = '提交';

  constructor( private msgSer: NzMessageService,
               private modalRef: NzModalRef,
               private fb: FormBuilder,
               private permitSer: PermitsService ) {
  }

  ngOnInit() {
    // init form
    this.validateForm = this.fb.group( {
      pText: [ this.pText, [ Validators.required ] ],
      pid: [ this.permit.pid, [ Validators.required ] ],
      id: [ this.permit.id, [ Validators.required ] ],
      text: [ this.permit.text, [ Validators.required ] ],
      link: [ this.permit.link, [ Validators.required ] ],
      i18n: [ this.permit.link, [ Validators.required ] ],
      icon: [ this.permit.icon, [ Validators.required ] ]
    } );
  }

  control( name ) {
    return this.validateForm.controls[ name ];
  }

  iconChange() {
    let inputIcon = this.control( 'icon' ).value;
    let start = 'type="';
    if ( inputIcon.indexOf( start ) != -1 ) {
      let temp = inputIcon.substring( inputIcon.indexOf( start ) + start.length );
      let iconVal = temp.substring( 0, temp.indexOf( '"' ) );
      this.control( 'icon' ).setValue( 'anticon anticon-'+iconVal );
    }
  }

  /**
   * 提交表单
   * @private
   */
  submit() {
    this.control( 'i18n' ).setValue( this.control( 'link' ).value );
    for ( const i in this.validateForm.controls ) {
      this.validateForm.controls[ i ].markAsDirty();
      this.validateForm.controls[ i ].updateValueAndValidity();
    }
    if ( this.validateForm.valid ) {
      this.permit.text = this.control( 'text' ).value;
      this.permit.link = this.control( 'link' ).value;
      this.permit.i18n = this.control( 'i18n' ).value.toString().replace( /\//, 'uri.' ).replace( /\//g, '.' );
      this.permit.icon = this.control( 'icon' ).value;
      console.log( "全部校验通过 => ", this.permit );
      this.btnLoading = true;
      this.cancel_btn = '请稍后...';
      this.submit_btn = '提交中...';
      this.add();
    }
  }

  add() {
    this.permitSer.add( this.permit ).subscribe( res => {
      if ( res.ok ) {
        this.msgSer.success( res.sub_msg );
        this.cancel( 'success-call' );
      } else if ( res.it ) {
        this.add();
      } else {
        this.msgSer.error( res.sub_msg );
        this.cancel_btn = '取消';
        this.submit_btn = '提交';
        this.btnLoading = false;
      }
    } );
  }

  /**
   * close modal
   */
  cancel( type: string ) {
    this.modalRef.destroy( type );
  }
}
