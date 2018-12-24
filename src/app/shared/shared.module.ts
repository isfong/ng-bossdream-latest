import { NgModule }                         from '@angular/core';
import { CommonModule }                     from '@angular/common';
import { DelonABCModule }                   from '@delon/abc';
import { AlainThemeModule }                 from '@delon/theme';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RouterModule }                     from '@angular/router';
import { NgZorroAntdModule }                from 'ng-zorro-antd';
import { DelonACLModule }                   from '@delon/acl';
import { TranslateModule }                  from '@ngx-translate/core';

@NgModule( {
  imports: [
    CommonModule,
    FormsModule,
    RouterModule,
    ReactiveFormsModule,
    NgZorroAntdModule,
    AlainThemeModule.forChild(),
    DelonABCModule,
    DelonACLModule
  ],
  declarations: [],
  exports: [
    CommonModule,
    FormsModule,
    RouterModule,
    ReactiveFormsModule,
    NgZorroAntdModule,
    AlainThemeModule,
    DelonABCModule,
    DelonACLModule,
    // i18n
    TranslateModule
  ]
} )
export class SharedModule {
}
