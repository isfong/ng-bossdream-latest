import { NgModule }             from '@angular/core';
import { RouterModule, Routes } from "@angular/router";
import { PublicComponent }      from "@com/public/public.component";
import { IndexComponent }       from "@com/public/index/index.component";
import { CaseComponent }        from "@com/public/case/case.component";
import { NewsComponent }        from "@com/public/news/news.component";
import { AboutComponent }       from "@com/public/about/about.component";

const routes: Routes = [
  {
    path: '',
    component: PublicComponent,
    children: [
      { path: '', component: IndexComponent, data: { titleI18n: 'uri.index' } },
      { path: 'index', component: IndexComponent, data: { titleI18n: 'uri.index' } },
      { path: 'cases', component: CaseComponent, data: { titleI18n: 'uri.cases' } },
      { path: 'news', component: NewsComponent, data: { titleI18n: 'uri.news' } },
      { path: 'about', component: AboutComponent, data: { titleI18n: 'uri.about' } }
    ]
  },

];

@NgModule( {
  imports: [ RouterModule.forChild( routes ) ],
  exports: [ RouterModule ]
} )
export class PublicRoutingModule {
}
