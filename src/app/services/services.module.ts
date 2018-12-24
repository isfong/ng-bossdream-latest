import { NgModule }              from '@angular/core';
import { I18nService }           from '@ser/i18n/i18n.service';
import { AuthService }           from "@ser/auth/auth.service";
import { RoleService }           from "@ser/role/role.service";
import { FileService }           from "@ser/file/file.service";
import { AreaService }           from "@ser/area/area.service";
import { TokenService }          from "@ser/token/token.service";
import { CryptoService }         from "@ser/crypto/crypto.service";
import { PermitsService }        from "@ser/permit/permits.service";
import { StartupService }        from '@ser/startup/startup.service';
import { BizZoneService }        from "@ser/biz-zone/biz-zone.service";
import { SupplierService }       from "@ser/supplier/supplier.service";
import { WarehouseService }      from "@ser/warehouse/warehouse.service";
import { UserRoleService }       from "@ser/user-role/user-role.service";
import { DecorBrandService }     from "@ser/decor-brand/decor-brand.service";
import { RolePermitsService }    from "@ser/role-permit/role-permits.service";
import { LocalStorageService }   from "@ser/local-storage/local-storage.service";
import { AdministratorService }  from "@ser/administrator/administrator.service";
import { SessionStorageService } from "@ser/session-storage/session-storage.service";

const locals = [
  I18nService,
  TokenService,
  CryptoService,
  StartupService,
  LocalStorageService,
  SessionStorageService
];
const api_business = [
  DecorBrandService
];
const api_commons = [
  AuthService,
  FileService,
  AreaService,
  RoleService,
  BizZoneService,
  PermitsService,
  SupplierService,
  UserRoleService,
  WarehouseService,
  RolePermitsService,
  AdministratorService
];

@NgModule( {
  providers: [
    ...locals,
    ...api_business,
    ...api_commons
  ]
} )
export class ServicesModule {
}
