import { Component, OnInit }      from '@angular/core';
import { ActivatedRoute, Router } from "@angular/router";

@Component( {
  selector: 'app-redirect',
  templateUrl: './redirect.component.html',
  styleUrls: [ './redirect.component.less' ]
} )
export class RedirectComponent implements OnInit {

  /**
   * 本组件是一个路由手动重定向组件
   * @param activeRoute
   * @param route
   */
  constructor( private activeRoute: ActivatedRoute, private route: Router ) {
  }

  ngOnInit() {
    // 什么都不做，直接跳转
    let to = this.activeRoute.snapshot.queryParams[ 'to' ];
    console.log( to );
    if ( to ) {
      this.route.navigate( [ to ] ).catch();
    } else {
      this.route.navigate( [ '/error/404' ] ).catch();
    }
  }

}
