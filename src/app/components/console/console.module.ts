import { NgModule }             from '@angular/core';
import { SharedModule }         from '@app/shared/shared.module';
import { ConsoleRoutingModule } from '@com/console/console-routing/console-routing.module';
import { ConsoleComponent }     from '@com/console/console.component';
import { HomeComponent }        from '@com/console/home/home.component';
import { HeaderComponent }      from '@com/console/header/header.component';
import { SidebarComponent }     from '@com/console/sidebar/sidebar.component';
import { ApplicationComponent } from '@com/console/header/application/application.component';
import { FullscreenComponent }  from '@com/console/header/fullscreen/fullscreen.component';
import { I18nComponent }        from '@com/console/header//i18n/i18n.component';
import { NotifyComponent }      from '@com/console/header/notify/notify.component';
import { SearchComponent }      from '@com/console/header/search/search.component';
import { StorageComponent }     from '@com/console/header/storage/storage.component';
import { TaskComponent }        from '@com/console/header/task/task.component';
import { UserComponent }        from '@com/console/header/user/user.component';

@NgModule( {
  imports: [
    SharedModule, ConsoleRoutingModule
  ],
  declarations: [ ConsoleComponent, HomeComponent, HeaderComponent, SidebarComponent, ApplicationComponent, FullscreenComponent, I18nComponent, NotifyComponent, SearchComponent, StorageComponent, TaskComponent, UserComponent ],
} )
export class ConsoleModule {
}
