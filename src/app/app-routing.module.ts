import { NgModule }                 from '@angular/core';
import { Routes, RouterModule }     from '@angular/router';
import { RouterInterceptorService } from "@ser/router-interceptor/router-interceptor.service";


const pre_redirect_routes = [
  { path: '', redirectTo: '/', pathMatch: 'full' },
  { path: 'passport', redirectTo: 'error/404', pathMatch: 'full' },
  { path: 'console', redirectTo: 'console/home', pathMatch: 'full' },
  { path: 'console/admin', redirectTo: 'console/home', pathMatch: 'full' },
  { path: 'console/admin/authorize', redirectTo: 'console/admin/authorize/permit', pathMatch: 'full' },
  { path: 'error', redirectTo: 'error/404', pathMatch: 'full' }
];

const routes: Routes = [
  ...pre_redirect_routes,

  { path: '', loadChildren: './components/public/public.module#PublicModule' },
  { path: 'redirect', loadChildren: './components/redirect/redirect.module#RedirectModule' },
  { path: 'passport', loadChildren: './components/passport/passport.module#PassportModule' },
  {
    path: 'console',
    loadChildren: './components/console/console.module#ConsoleModule',
    canActivate: [ RouterInterceptorService ]
  },
  { path: 'error', loadChildren: './components/error/error.module#ErrorModule' },
  { path: '**', redirectTo: 'error/404' }
];

@NgModule( {
  imports: [ RouterModule.forRoot( routes ) ],
  exports: [ RouterModule ]
} )
export class AppRoutingModule {
}
