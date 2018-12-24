import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-public-news',
  templateUrl: './news.component.html',
  styleUrls: ['./news.component.less']
})
export class NewsComponent implements OnInit {
  data = [
    {
      title: 'News 1'
    },
    {
      title: 'News 2'
    },
    {
      title: 'News 3'
    },
    {
      title: 'News 4'
    },
    {
      title: 'News 5'
    },
    {
      title: 'News 6'
    },
    {
      title: 'News 7'
    },
    {
      title: 'News 8'
    },
    {
      title: 'News 9'
    },
    {
      title: 'News 10'
    },
    {
      title: 'News 11'
    }

  ];
  constructor() { }

  ngOnInit() {
  }

}
