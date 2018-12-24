import { Component, OnInit }                        from '@angular/core';
import { FormBuilder, FormGroup, Validators }       from "@angular/forms";
import { Role }                                     from "@mod/role/role";
import { NzMessageService, NzModalRef, UploadFile } from "ng-zorro-antd";
import { RoleService }                              from "@ser/role/role.service";
import { FileService }                              from "@ser/file/file.service";
import { forkJoin }                                 from "rxjs";
import { ResponseUtils }                            from "@mod/response/response";

@Component( {
  selector: 'app-console-admin-authorize-role-add',
  templateUrl: './role-add.component.html',
  styleUrls: [ './role-add.component.less' ]
} )
export class RoleAddComponent implements OnInit {
  validateForm: FormGroup;
  loading = false;
  cancel_btn = '取消';
  submit_btn = '提交';
  role: Role = {
    id: null,
    name: null,
    code: null,
    avatar: null,
    notes: null
  };

  file: File;
  uploadFileList = [];
  previewImage = '';
  previewVisible = false;

  constructor( private msg: NzMessageService,
               private modal: NzModalRef,
               private fb: FormBuilder,
               private roleSer: RoleService,
               private fileSer: FileService ) {
  }

  ngOnInit() {
    // init form
    this.validateForm = this.fb.group( {
      name: [ null, [ Validators.required ] ],
      code: [ null, [ Validators.required ] ],
      notes: [ null, [ Validators.required ] ],
      avatar: [ null, [ Validators.required ] ]
    } );
  }

  uploadCustomRequest = () => {
    return forkJoin( [] ).subscribe( () => {
    } );
  };

  /**
   * 图片区域发生改变处理
   * @param {{file: UploadFile}} info
   */
  uploadChange( info: { file: UploadFile } ) {
    console.log( info.file.status );
    if ( info.file.status === 'uploading' ) {
      console.log( info );
      // 得到选择的File对象
      this.file = info.file.originFileObj;
      // 将avatar暂且赋一个临时值, 让校验通过
      this.control( 'avatar' ).setValue( this.file.name );
      this.fileSer.base64( info.file.originFileObj, ( img: any ) => {
        this.uploadFileList = [ { uid: -1, name: this.file.name, status: 'done', url: img, } ];
      } );
      return;
    }
    if ( info.file.status === 'removed' ) {
      // 删除图片让显示校验信息
      this.file = null;
      this.control( 'avatar' ).setValue( null );
    }
  }

  /**
   * 预览处理
   * @param {UploadFile} file
   */
  uploadPreview = ( file: UploadFile ) => {
    console.log( 'handlePreview-> ', file );
    this.previewImage = file.url || file.thumbUrl;
    this.previewVisible = true;
  };

  codeChange() {
    let code = this.control( 'code' ).value.toUpperCase();
    let prefix = 'ROLE_';
    if ( !code.startsWith( prefix ) ) code = prefix + code;
    this.control( 'code' ).setValue( code );
  }

  control( name ) {
    return this.validateForm.controls[ name ];
  }


  /**
   * 提交表单
   * @private
   */
  submitForm() {
    for ( const i in this.validateForm.controls ) {
      this.validateForm.controls[ i ].markAsDirty();
      this.validateForm.controls[ i ].updateValueAndValidity();
    }
    if ( this.validateForm.valid ) {
      for ( const prototype in this.role ) {
        this.role[ prototype ] = this.control( prototype ) == undefined ? null : this.control( prototype ).value;
      }
      console.log( "全部校验通过 => ", this.role );
      this.loading = true;
      this.cancel_btn = '请稍后...';
      this.submit_btn = '提交中...';
      // 先上传图片
      this.upload();
    }

  }

  upload() {
    this.fileSer.upload( this.file, 'pic/roles/', false ).subscribe( res => {
      console.log( 'upload res => ', res );
      if ( res.code === 200 ) {
        this.role.avatar = res.result[ 0 ];
        this.add();
      } else if ( ResponseUtils.it( res ) ) {
        this.upload();
      } else {
        this.loading = false;
        this.cancel_btn = '取消';
        this.submit_btn = '提交';
        this.msg.error( res.sub_msg );
      }
    } );
  }

  add() {
    return this.roleSer.add( this.role ).subscribe( res => {
      if ( res.ok ) {
        this.cancel( 'success-call' );
        this.loading = false;
        this.cancel_btn = '取消';
        this.submit_btn = '提交';
        this.msg.success( res.sub_msg );
      } else if ( res.it ) {
        this.add();
      } else {
        this.loading = false;
        this.cancel_btn = '取消';
        this.submit_btn = '提交';
        this.msg.error( res.sub_msg );
      }
    } );
  }

  /*-----------------------------------------------------------------------------------------------*/

  /**
   * close modal
   */
  cancel( type: string ) {
    this.modal.destroy( type );
  }

}
