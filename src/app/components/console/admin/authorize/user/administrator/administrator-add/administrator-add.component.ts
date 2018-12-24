import { Component, OnInit }                        from '@angular/core';
import {
  AbstractControl,
  AsyncValidatorFn,
  FormControl,
  FormGroup,
  ValidationErrors,
  Validators
}                                                   from "@angular/forms";
import { forkJoin, Observable }                     from "rxjs";
import { FileService }                              from "@ser/file/file.service";
import { map }                                      from "rxjs/operators";
import { AdministratorService }                     from "@ser/administrator/administrator.service";
import { ResponseUtils }                            from "@mod/response/response";
import { NzMessageService, NzModalRef, UploadFile } from "ng-zorro-antd";
import { AreaService }                              from "@ser/area/area.service";
import { DecorBrandService }                        from "@ser/decor-brand/decor-brand.service";
import { BizZoneService }                           from "@ser/biz-zone/biz-zone.service";
import { SupplierService }                          from "@ser/supplier/supplier.service";
import { WarehouseService }                         from "@ser/warehouse/warehouse.service";
import { Administrator }                            from "@mod/administrator/administrator";

// /**
//  * 自定义两次密码一致性校验规则
//  * @param {AbstractControl} control
//  * @returns boolean
//  */
// export const unequal = ( control: AbstractControl ): { [ key: string ]: boolean } => {
//   const password = control.get( 'password' );
//   const confirm_password = control.get( 'confirm_password' );
//   if ( !password || !confirm_password ) {
//     return null;
//   }
//   return password.value === confirm_password.value ? null : { unequal: true };
// };

// export function existUsernameValidator( service: AdministratorService, msg: NzMessageService ): AsyncValidatorFn {
//   return ( control: AbstractControl ): Promise<ValidationErrors | null> | Observable<ValidationErrors | null> => {
//     return service.exist( control.value ).pipe( map( res => {
//       if ( res.ok ) {
//         return ( res.result && res.result === true ) ? { exist: true } : null;
//       } else if ( res.it ) {
//         msg.warning( '用户名校验网络延迟,请改变输入值重试' );
//       } else {
//         msg.error( ResponseUtils.errMsg( res ) );
//         return null;
//       }
//     } ) );
//   };
// }

@Component( {
  selector: 'app-console-admin-authorize-user-administrator-add',
  templateUrl: './administrator-add.component.html',
  styleUrls: [ './administrator-add.component.less' ]
} )
export class AdministratorAddComponent implements OnInit {

  loading = false;
  formGroup: FormGroup;
  passwordVisible = false;
  file: File;
  uploadFileList = [];
  previewImage = '';
  previewVisible = false;
  administrator: Administrator = new Administrator();


  constructor( private modalRef: NzModalRef,
               private fileSer: FileService,
               private administratorSer: AdministratorService,
               private msg: NzMessageService,
               private areaSer: AreaService,
               private decorBrandSer: DecorBrandService,
               private bizZoneSer: BizZoneService,
               private supplierSer: SupplierService,
               private warehouseSer: WarehouseService ) {
  }

  ngOnInit() {

    this.formGroup = new FormGroup( {
      username: new FormControl(
        null,
        [ Validators.required, Validators.pattern( /^[\u4e00-\u9fa5_a-zA-Z0-9]+$/ ), Validators.minLength( 4 ), Validators.maxLength( 12 ) ],
        [ this.usernameValidator() ]
      ),
      password: new FormControl( null, [ Validators.required, Validators.minLength( 2 ) ] ),
      name: new FormControl( null, [ Validators.required, Validators.maxLength( 12 ) ] ),
      nickname: new FormControl( null, Validators.maxLength( 12 ) ),
      phone: new FormControl( null, Validators.pattern( /^1\d{10}$/ ) ),
      email: new FormControl( null, Validators.email ),
      gender: new FormControl( 0 ),
      available: new FormControl( 0 ),
      avatar: new FormControl( null, Validators.required ),
      areaSwitch: new FormControl( false ),
      provinceList: new FormControl( null ),
      province: new FormControl( null ),
      cityList: new FormControl( null ),
      city: new FormControl( null ),
      areaList: new FormControl( null ),
      area: new FormControl( null ),
      brandSwitch: new FormControl( false ),
      brandList: new FormControl( null ),
      brand: new FormControl( null ),
      bizZoneSwitch: new FormControl( false ),
      bizZoneList: new FormControl( null ),
      bizZone: new FormControl( null ),
      supplierSwitch: new FormControl( false ),
      supplierList: new FormControl( null ),
      supplier: new FormControl( null ),
      warehouseSwitch: new FormControl( false ),
      warehouseList: new FormControl( null ),
      warehouse: new FormControl( null )
    } );
  }

  usernameValidator(): AsyncValidatorFn {
    return ( control: AbstractControl ): Promise<ValidationErrors | null> | Observable<ValidationErrors | null> => {
      return this.administratorSer.exist( control.value ).pipe( map( res => {
        if ( res.ok ) {
          return ( res.result && res.result === true ) ? { exist: true } : null;
        } else if ( res.it ) {
          this.usernameValidator()
        } else {
          this.msg.error( ResponseUtils.errMsg( res ) );
          return null;
        }
      } ) );
    };
  }

  areaSwitchChange() {
    if ( this.control( 'areaSwitch' ).value ) {
      this.loading = true;
      this.provinceList();
    } else {
      this.control( 'provinceList' ).setValue( null );
      this.control( 'province' ).setValue( null );
      this.control( 'cityList' ).setValue( null );
      this.control( 'city' ).setValue( null );
      this.control( 'areaList' ).setValue( null );
      this.control( 'area' ).setValue( null );
    }
  }

  provinceList() {
    this.areaSer.list( 1 ).subscribe( res => {
      if ( res.ok ) {
        console.log( res.result );
        this.control( 'provinceList' ).setValue( res.result );
        this.control( 'province' ).setValue( res.result[ 0 ] );
        this.areaChange( this.control( 'province' ).value );
        this.loading = false;
      } else if ( res.it ) {
        this.provinceList()
      } else {
        this.msg.error( ResponseUtils.errMsg( res ) );
        this.loading = false;
      }
    } );
  }

  areaChange( e ) {
    if ( e && e.level < 3 ) {
      this.loading = true;
      this.areaChildren( e.id, e.level );
    }
    if ( !e ) {
      if ( !this.control( 'area' ).value && this.control( 'areaList' ).value ) {
        this.control( 'areaList' ).setValue( null );
      }
      if ( !this.control( 'city' ).value && this.control( 'cityList' ).value ) {
        this.control( 'cityList' ).setValue( null );
        this.control( 'area' ).setValue( null );
      }
      if ( !this.control( 'province' ).value && this.control( 'provinceList' ).value ) {
        this.control( 'provinceList' ).setValue( null );
        this.control( 'areaSwitch' ).setValue( false );
        this.control( 'city' ).setValue( null );
        this.control( 'area' ).setValue( null );
      }
    }
  }

  areaChildren( id: number, level: number ) {
    this.areaSer.children( id ).subscribe( res => {
      if ( res.ok ) {
        if ( level === 1 ) {
          this.control( 'cityList' ).setValue( res.result.children );
          this.control( 'city' ).setValue( res.result.children[ 0 ] );
          // 如果是第一次 继续请求区 否则 城市change后自动触发请求区事件
          if ( !this.control( 'areaList' ).value )
            this.areaChange( this.control( 'city' ).value )
        }
        if ( level === 2 ) {
          this.control( 'areaList' ).setValue( res.result.children );
          this.control( 'area' ).setValue( res.result.children[ 0 ] );
        }
        this.loading = false;
      } else if ( res.it ) {
        this.areaChildren( id, level );
      } else {
        this.msg.error( ResponseUtils.errMsg( res ) );
        this.loading = false;
      }
    } );
  }

  brandSwitchChange() {
    if ( this.control( 'brandSwitch' ).value ) {
      this.loading = true;
      this.brandList();
    } else {
      this.control( 'brand' ).setValue( null );
      this.control( 'brandList' ).setValue( null );
    }
  }

  brandList() {
    this.decorBrandSer.list().subscribe( res => {
      if ( res.ok ) {
        this.control( 'brandList' ).setValue( res.result );
        this.control( 'brand' ).setValue( res.result[ 0 ] );
        this.loading = false;
      } else if ( res.it ) {
        this.brandList();
      } else {
        this.msg.error( ResponseUtils.errMsg( res ) );
        this.loading = false;
      }
    } );
  }

  brandChange( e ) {
    if ( !e && !this.control( 'brand' ).value ) {
      this.control( 'brandList' ).setValue( null );
      this.control( 'brandSwitch' ).setValue( false );
    }
  }

  bizZoneSwitchChange() {
    if ( this.control( 'bizZoneSwitch' ).value ) {
      this.loading = true;
      this.bizZoneList();
    } else {
      this.control( 'bizZone' ).setValue( null );
      this.control( 'bizZoneList' ).setValue( null );
    }
  }

  bizZoneList() {
    this.bizZoneSer.list().subscribe( res => {
      if ( res.ok ) {
        this.control( 'bizZoneList' ).setValue( res.result );
        this.control( 'bizZone' ).setValue( res.result[ 0 ] );
        this.loading = false;
      } else if ( res.it ) {
        this.bizZoneList();
      } else {
        this.msg.error( ResponseUtils.errMsg( res ) );
        this.loading = false;
      }
    } );
  }

  bizZoneChange( e ) {
    if ( !e && !this.control( 'bizZone' ).value ) {
      this.control( 'bizZoneList' ).setValue( null );
      this.control( 'bizZoneSwitch' ).setValue( false );
    }
  }

  supplierSwitchChange() {
    if ( this.control( 'supplierSwitch' ).value ) {
      this.loading = true;
      this.supplierList();
    } else {
      this.control( 'supplier' ).setValue( null );
      this.control( 'supplierList' ).setValue( null );
    }
  }

  supplierList() {
    this.supplierSer.list().subscribe( res => {
      if ( res.ok ) {
        this.control( 'supplierList' ).setValue( res.result );
        this.control( 'supplier' ).setValue( res.result[ 0 ] );
        this.loading = false;
      } else if ( res.it ) {
        this.supplierList();
      } else {
        this.msg.error( ResponseUtils.errMsg( res ) );
        this.loading = false;
      }
    } );
  }

  supplierChange( e ) {
    if ( !e && !this.control( 'supplier' ).value ) {
      this.control( 'supplierList' ).setValue( null );
      this.control( 'supplierSwitch' ).setValue( false );
    }
  }

  warehouseSwitchChange() {
    if ( this.control( 'warehouseSwitch' ).value ) {
      this.loading = true;
      this.warehouseList();
    } else {
      this.control( 'warehouse' ).setValue( null );
      this.control( 'warehouseList' ).setValue( null );
    }
  }

  warehouseList() {
    this.warehouseSer.list().subscribe( res => {
      if ( res.ok ) {
        this.control( 'warehouseList' ).setValue( res.result );
        this.control( 'warehouse' ).setValue( res.result[ 0 ] );
        this.loading = false;
      } else if ( res.it ) {
        this.warehouseList();
      } else {
        this.msg.error( ResponseUtils.errMsg( res ) );
        this.loading = false;
      }
    } );
  }

  warehouseChange( e ) {
    if ( !e && !this.control( 'warehouse' ).value ) {
      this.control( 'warehouseList' ).setValue( null );
      this.control( 'warehouseSwitch' ).setValue( false );
    }
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

  control( name ) {
    return this.formGroup.controls[ name ];
  }

  submit() {
    for ( const i in this.formGroup.controls ) {
      this.formGroup.controls[ i ].markAsDirty();
      this.formGroup.controls[ i ].updateValueAndValidity();
    }
    this.awaitAndSubmit();
  }

  // 等待异步校验username结果回来再提交
  awaitAndSubmit() {
    setTimeout( () => {
      console.log( 'awaiting.form.status.is', this.formGroup.status );
      if ( this.formGroup.pending ) {
        this.awaitAndSubmit();
      } else {
        console.log( 'awaiting.over.form.status.is', this.formGroup.status );
        if ( this.formGroup.valid ) {
          this.loading = true;
          console.log( 'form.valid.status.is', this.formGroup.status );
          let formValues = this.formGroup.value;
          // 基础表单文本域封装
          this.administrator.username = formValues.username;
          this.administrator.password = formValues.password;
          this.administrator.name = formValues.name;
          this.administrator.nickname = formValues.nickname;
          this.administrator.phone = formValues.phone;
          this.administrator.email = formValues.email;
          this.administrator.gender = formValues.gender;
          this.administrator.available = formValues.available;
          // 下拉选封装
          let province = this.control( 'province' ).value;
          if ( province ) {
            this.administrator.provinceId = province.id;
            this.administrator.province = province.name;
          }
          let city = this.control( 'city' ).value;
          if ( city ) {
            this.administrator.cityId = city.id;
            this.administrator.city = city.name;
          }
          let area = this.control( 'area' ).value;
          if ( area ) {
            this.administrator.areaId = area.id;
            this.administrator.area = area.name;
          }
          let brand = this.control( 'brand' ).value;
          if ( brand ) {
            this.administrator.brandId = brand.id;
            this.administrator.brandName = brand.brandName;
          }
          let bizZone = this.control( 'bizZone' ).value;
          if ( bizZone ) {
            this.administrator.bizZoneId = bizZone.id;
            this.administrator.bizZoneName = bizZone.name;
          }
          let supplier = this.control( 'supplier' ).value;
          if ( supplier ) {
            this.administrator.supplierId = supplier.id;
            this.administrator.supplierName = supplier.name;
          }
          let warehouse = this.control( 'warehouse' ).value;
          if ( warehouse ) {
            this.administrator.warehouseId = warehouse.id;
            this.administrator.warehouseName = warehouse.name;
          }
          console.log( this.administrator );
          this.upload();
        }
      }
    }, 1 );
  }

  upload() {
    this.fileSer.upload( this.file, 'pic/avatar/admin/', false ).subscribe( res => {
      if ( res.ok ) {
        this.administrator.avatar = res.result[ 0 ];
        this.add();
      } else if ( res.it ) {
        this.upload();
      } else {
        this.msg.error( ResponseUtils.errMsg( res ) );
        this.loading = false;
      }
    } );
  }

  add() {
    this.administratorSer.add( this.administrator ).subscribe( res => {
      if ( res.ok ) {
        this.cancel( 'success-call' );
      } else if ( res.it ) {
        this.add();
      } else {
        this.msg.error( ResponseUtils.errMsg( res ) );
        this.loading = false;
      }
    } )
  }

  cancel( type: string ) {
    this.modalRef.destroy( type );
  }

}
