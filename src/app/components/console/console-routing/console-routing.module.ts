import { NgModule }             from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent }        from '@com/console/home/home.component';
import { ConsoleComponent }     from '@com/console/console.component';

const consoleRoutes: Routes = [
  {
    path: '', component: ConsoleComponent, children: [
      { path: 'home', component: HomeComponent, data: { titleI18n: 'uri.console.home' } },
      { path: 'admin', loadChildren: '../admin/admin.module#AdminModule' }
    ]
  },

];

@NgModule( {
  imports: [ RouterModule.forChild( consoleRoutes ) ],
  exports: [ RouterModule ]
} )
export class ConsoleRoutingModule {
}
