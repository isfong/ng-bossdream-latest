import { Component, Input, OnInit }           from '@angular/core';
import { FormBuilder, FormGroup, Validators } from "@angular/forms";
import { Permit }                             from "@mod/permit/permit";
import { PermitsService }                     from "@ser/permit/permits.service";
import { NzMessageService, NzModalRef }       from "ng-zorro-antd";

@Component( {
  selector: 'app-console-admin-authorize-permit-edit',
  templateUrl: './permit-edit.component.html',
  styleUrls: [ './permit-edit.component.less' ]
} )
export class PermitEditComponent implements OnInit {
  @Input() pText: string; // 父name
  @Input() pre: string;
  @Input() originPermit: Permit;
  originPermitBackup: string;
  permit: Permit;
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
    this.originPermitBackup = JSON.stringify( this.originPermit );
    this.permit = JSON.parse( this.originPermitBackup );
    // init form
    this.validateForm = this.fb.group( {
      pText: [ this.pText, [ Validators.required ] ],
      pid: [ this.permit.pid, [ Validators.required ] ],
      id: [ this.permit.id, [ Validators.required ] ],
      text: [ this.permit.text, [ Validators.required ] ],
      link: [ this.permit.link, [ Validators.required ] ],
      i18n: [ this.permit.i18n, [ Validators.required ] ],
      icon: [ this.permit.icon, [ Validators.required ] ]
    } );
  }

  ctl( name ) {
    return this.validateForm.controls[ name ];
  }

  iconChange() {
    let inputIcon = this.ctl( 'icon' ).value;
    let start = 'type="';
    if ( inputIcon.startsWith( '<' ) && inputIcon.indexOf( start ) != -1 && inputIcon.endsWith( '>' ) ) {
      let temp = inputIcon.substring( inputIcon.indexOf( start ) + start.length );
      let iconVal = temp.substring( 0, temp.indexOf( '"' ) );
      this.ctl( 'icon' ).setValue( 'anticon anticon-' + iconVal );
    }
    if ( !inputIcon.startsWith( '<' ) && !inputIcon.startsWith( 'anticon' ) && !inputIcon.endsWith( '>' ) ) {
      this.ctl( 'icon' ).setValue( 'anticon anticon-' + inputIcon );
    }
  }

  i18nChange() {
    console.log( this.ctl( 'i18n' ).value )
  }

  /**
   * 提交表单
   * @private
   */
  submit() {
    for ( const i in this.validateForm.controls ) {
      this.validateForm.controls[ i ].markAsDirty();
      this.validateForm.controls[ i ].updateValueAndValidity();
    }
    this.permit.text = this.ctl( 'text' ).value;
    this.permit.link = this.ctl( 'link' ).value;
    this.permit.i18n = this.ctl( 'link' ).value.replace( /\//, 'uri.' ).replace( /\//g, '.' );
    this.permit.icon = this.ctl( 'icon' ).value;

    if ( this.originPermitBackup === JSON.stringify( this.permit ) ) {
      this.msgSer.warning( '数据未修改！' );
      return false;
    }

    if ( this.validateForm.valid ) {
      console.log( "全部校验通过 => ", this.permit );
      this.btnLoading = true;
      this.cancel_btn = '请稍后...';
      this.submit_btn = '提交中...';
      this.update();
    }

  }

  update() {
    return this.permitSer.update( this.permit ).subscribe( res => {
      if ( res.ok ) {
        this.btnLoading = false;
        this.cancel_btn = '取消';
        this.submit_btn = '提交';
        this.msgSer.success( res.sub_msg );
        this.cancel( 'success-call' );
        this.cancel( 'onCancel' );
      } else if ( res.it ) {
        this.update();
      } else {
        this.msgSer.error( res.sub_msg );
      }
    } );
  }

  /*-----------------------------------------------------------------------------------------------*/

  /**
   * close modal
   */
  cancel( type: string ) {
    this.modalRef.destroy( type );
  }
}
