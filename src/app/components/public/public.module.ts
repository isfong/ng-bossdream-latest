import { NgModule }            from '@angular/core';
import { SharedModule }        from '@sha/shared.module';
import { PublicRoutingModule } from "@com/public/public-routing/public-routing.module";
import { PublicComponent }     from '@com/public/public.component';
import { IndexComponent }      from '@com/public/index/index.component';
import { CaseComponent }       from '@com/public/case/case.component';
import { NewsComponent }       from '@com/public/news/news.component';
import { AboutComponent }      from "@com/public/about/about.component";

@NgModule( {
  imports: [
    SharedModule, PublicRoutingModule
  ],
  declarations: [ PublicComponent, IndexComponent, CaseComponent, NewsComponent, AboutComponent ]
} )
export class PublicModule {
}
