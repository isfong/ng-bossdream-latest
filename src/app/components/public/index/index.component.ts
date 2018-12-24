import { Component, OnInit } from '@angular/core';

@Component( {
  selector: 'app-public-index',
  templateUrl: './index.component.html',
  styleUrls: [ './index.component.less' ]
} )
export class IndexComponent implements OnInit {
  array = [];
  urls = [
    './assets/images/client-quanjia.png',
    './assets/images/client-youqi.png',
    './assets/images/client-yuelaiyuexi.png',
    './assets/images/client-ministop.png',
    './assets/images/client-meiyijia.png',
    './assets/images/client-7-11.png',
    './assets/images/client-tianfu.png',
    './assets/images/client-tianhong.png',
    './assets/images/client-zhengdayouxian.png',
    './assets/images/client-huarunwangjia.png',
    './assets/images/client-xishiduo.png',
    './assets/images/client-meiyitian.png',
    './assets/images/client-quanshi.png',
    './assets/images/client-youmenlu.png',
    './assets/images/client-kexi.png'
  ];

  constructor() {
  }

  ngOnInit() {
    setTimeout( () => {
      this.array = [ './assets/images/banner.png', './assets/images/banner.png', './assets/images/banner.png', './assets/images/banner.png' ];
    }, 500 );
  }

}
