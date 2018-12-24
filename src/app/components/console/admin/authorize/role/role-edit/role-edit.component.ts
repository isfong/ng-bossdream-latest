import { Component, Input, OnInit }                                 from '@angular/core';
import { Role }                                                     from "@mod/role/role";
import { FormControl, FormGroup, Validators }                       from "@angular/forms";
import { NzMessageService, NzModalRef, NzModalService, UploadFile } from "ng-zorro-antd";
import { RoleService }                                              from "@ser/role/role.service";
import { FileService }                                              from "@ser/file/file.service";
import { API }                                                      from "@mod/api/api";
import { forkJoin }                                                 from "rxjs";
import { ResponseUtils }                                            from "@mod/response/response";

@Component( {
  selector: 'app-console-admin-authorize-role-edit',
  templateUrl: './role-edit.component.html',
  styleUrls: [ './role-edit.component.less' ]
} )
export class RoleEditComponent implements OnInit {

  loading = false;
  @Input()
  source: Role;
  role: Role;
  formGroup: FormGroup;

  file: File;
  uploadFileList = [];
  uploadRes: string;
  previewImage = '';
  previewVisible = false;

  cancel_btn = '取消';
  submit_btn = '提交';

  constructor( private modalRef: NzModalRef,
               private modalSer: NzModalService,
               private msgSer: NzMessageService,
               private roleSer: RoleService,
               private fileSer: FileService ) {
  }

  ngOnInit() {
    this.role = JSON.parse( JSON.stringify( this.source ) );
    this.uploadFileList = [ {
      uid: -1,
      name: this.role.avatar,
      status: 'done',
      url: API.uri.oss_pre + this.role.avatar
    } ];
    this.formGroup = new FormGroup( {
      name: new FormControl( this.role.name, Validators.required ),
      code: new FormControl( this.role.code, Validators.required ),
      notes: new FormControl( this.role.notes, Validators.required ),
      avatar: new FormControl( this.role.avatar, Validators.required )
    } );
  }

  control( name ) {
    return this.formGroup.controls[ name ];
  }

  cancel( type: string ) {
    this.modalRef.destroy( type );
  }

  uploadCustomRequest = () => {
    return forkJoin( [] ).subscribe( () => {
    } );
  };

  uploadPreview = ( file: UploadFile ) => {
    this.previewImage = file.url || file.thumbUrl;
    this.previewVisible = true;
  };

  uploadChange( info: { file: UploadFile } ) {
    if ( info.file.status === 'uploading' ) {
      // 得到选择的File对象
      this.file = info.file.originFileObj;
      // 将avatar暂且赋一个临时值, 让校验通过
      this.fileSer.base64( info.file.originFileObj, ( img: any ) => {
        this.control( 'avatar' ).setValue( img );
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

  codeChange() {
    let code = this.control( 'code' ).value.toUpperCase();
    let prefix = 'ROLE_';
    if ( !code.startsWith( prefix ) ) code = prefix + code;
    this.control( 'code' ).setValue( code );
  }

  submit() {
    let modifies = this.modifies();
    if ( modifies.length === 0 ) {
      this.msgSer.error( '数据未修改' );
      return false;
    }
    for ( const i in this.formGroup.controls ) {
      this.formGroup.controls[ i ].markAsDirty();
      this.formGroup.controls[ i ].updateValueAndValidity();
    }
    if ( this.formGroup.valid ) {
      for ( const prototype of modifies ) this.role[ prototype ] = this.control( prototype ).value;
      this.uploadAndUpdate();
    }

  }

  uploadAndUpdate() {
    this.loading = true;
    if ( !this.uploadRes && this.file ) {
      this.upload().subscribe( res => {
        if ( ResponseUtils.ok( res ) ) {
          this.uploadRes = res.result[ 0 ];
          this.update().subscribe( res => {
            if ( ResponseUtils.ok( res ) ) {
              this.msgSer.success( res.sub_msg );
              this.cancel( 'success-call' );
              this.loading = false;
            } else if ( ResponseUtils.it( res ) ) {
              this.uploadAndUpdate();
            } else {
              this.msgSer.error( ResponseUtils.errMsg( res ) );
              this.loading = false;
            }
          } );
        } else if ( ResponseUtils.it( res ) ) {
          this.uploadAndUpdate();
        } else {
          this.msgSer.error( ResponseUtils.errMsg( res ) );
          this.loading = false;
        }
      } );
    } else {
      this.update().subscribe( res => {
        if ( ResponseUtils.ok( res ) ) {
          this.msgSer.success( res.sub_msg );
          this.cancel( 'success-call' );
          this.loading = false;
        } else if ( ResponseUtils.it( res ) ) {
          this.uploadAndUpdate();
        } else {
          this.msgSer.error( ResponseUtils.errMsg( res ) );
          this.loading = false;
        }
      } );
    }
  }

  upload() {
    return this.fileSer.upload( this.file, 'pic/roles/', false );
  }

  update() {
    if ( this.uploadRes )
      this.role.avatar = this.uploadRes;
    return this.roleSer.update( this.role );
  }

  modifies(): string[] {
    let modifies: string[] = [];
    let prototypes = [ 'avatar', 'code', 'name', 'notes' ];
    for ( const i in prototypes ) {
      const prototype = prototypes[ i ];
      if ( this.role[ prototype ] !== this.control( prototype ).value ) modifies.push( prototype );
    }
    return modifies;
  }

}
