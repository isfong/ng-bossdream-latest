# NgBossdream

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 7.0.3.

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `--prod` flag for a production build.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI README](https://github.com/angular/angular-cli/blob/master/README.md).

/////////
###### node_modules/@delon/abc/esm5/abc.js
###### 设置子菜单图标显示
`
SidebarNavComponent.decorators = [
        { type: Component, args: [{
                    selector: 'sidebar-nav',
                    template: "<ul class=\"ad-nav\"> <ng-container *ngFor=\"let group of list\"> <ng-template [ngIf]=\"group._hidden !== true\"> <li class=\"ad-nav__item ad-nav__group-title\" *ngIf=\"group.group\"> <span>{{ group.text }}</span> </li> <ng-container *ngFor=\"let child1 of group.children\"> <li *ngIf=\"child1._hidden !== true\" routerLinkActive=\"ad-nav__selected\" [routerLinkActiveOptions]=\"{exact: child1.linkExact}\" class=\"ad-nav__item\" [class.ad-nav__open]=\"child1._open\"> <!-- link --> <a *ngIf=\"child1._type === 1\" (click)=\"onSelect(child1)\" [routerLink]=\"child1.link\" [target]=\"child1.target\"> <i *ngIf=\"!settings.layout.collapsed\" nz-icon class=\"{{ child1.icon }}\"></i> <nz-tooltip *ngIf=\"settings.layout.collapsed\" nzPlacement=\"right\" [nzTitle]=\"child1.text\"> <span nz-tooltip> <i nz-icon class=\"{{ child1.icon }}\"></i> </span> </nz-tooltip> <span>{{ child1.text }}</span> </a> <!-- external link --> <a *ngIf=\"child1._type === 2\" href=\"{{ child1.externalLink }}\" target=\"{{child1.target}}\" data-type=\"external\"> <i *ngIf=\"!settings.layout.collapsed\" nz-icon class=\"{{ child1.icon }}\"></i> <nz-tooltip *ngIf=\"settings.layout.collapsed\" nzPlacement=\"right\" [nzTitle]=\"child1.text\"> <span nz-tooltip> <i nz-icon class=\"{{ child1.icon }}\"></i> </span> </nz-tooltip> <span>{{ child1.text }}</span> </a> <!-- has children link --> <a *ngIf=\"child1._type === 3\" class=\"ad-nav__sub-title\" (click)=\"toggleOpen(child1)\" (mouseenter)=\"showSubMenu($event, child1)\"> <i nz-icon class=\"{{ child1.icon }}\"></i> <span>{{ child1.text }}</span> <span class=\"ad-nav__sub-arrow\"></span> </a> <!-- badge --> <div *ngIf=\"child1.badge\" title=\"{{child1.badge}}\" class=\"badge badge-{{child1.badge_status}}\" [class.badge-dot]=\"child1.badge_dot\"> <em>{{child1.badge}}</em> </div> <!-- Level 2 --> <ul *ngIf=\"child1._type === 3\" class=\"ad-nav ad-nav__sub ad-nav__depth{{child1._depth}}\"> <ng-container *ngFor=\"let child2 of child1.children\"> <li *ngIf=\"child2._hidden !== true\" routerLinkActive=\"ad-nav__selected\" [routerLinkActiveOptions]=\"{exact: child2.linkExact}\" class=\"ad-nav__item\" [class.ad-nav__open]=\"child2._open\"> <!-- link --> <a *ngIf=\"child2._type === 1\" (click)=\"onSelect(child2)\" [routerLink]=\"child2.link\" [target]=\"child2.target\"><i nz-icon class=\"{{ child2.icon }}\"></i>{{ child2.text }}</a> <!-- external link --> <a *ngIf=\"child2._type === 2\" href=\"{{ child2.externalLink }}\" target=\"{{ child2.target }}\" data-type=\"external\"><i nz-icon class=\"{{ child2.icon }}\"></i>{{ child2.text }}</a> <!-- has children link --> <a *ngIf=\"child2._type === 3\" class=\"ad-nav__sub-title\" (click)=\"toggleOpen(child2)\"><i nz-icon class=\"{{ child2.icon }}\"></i> {{ child2.text }} <span class=\"ad-nav__sub-arrow\"></span> </a> <!-- badge --> <div *ngIf=\"child2.badge\" title=\"{{child2.badge}}\" class=\"badge badge-{{child2.badge_status}}\" [class.badge-dot]=\"child2.badge_dot\"> <em>{{child2.badge}}</em> </div> <!-- Level 3 --> <ul *ngIf=\"child2._type === 3\" class=\"ad-nav ad-nav__sub ad-nav__depth{{child2._depth}}\"> <ng-container *ngFor=\"let child3 of child2.children\"> <li *ngIf=\"child3._hidden !== true\" routerLinkActive=\"ad-nav__selected\" [routerLinkActiveOptions]=\"{exact: child3.linkExact}\" class=\"ad-nav__item\" [class.ad-nav__open]=\"child3._open\"> <!-- link --> <a *ngIf=\"child3._type === 1\" (click)=\"onSelect(child3)\" [routerLink]=\"child3.link\" [target]=\"child3.target\"><i nz-icon class=\"{{ child3.icon }}\"></i> {{ child3.text }} </a> <!-- external link --> <a *ngIf=\"child3._type === 2\" href=\"{{ child3.externalLink }}\" target=\"{{ child3.target }}\" data-type=\"external\"><i nz-icon class=\"{{ child3.icon }}\"></i> {{ child3.text }} </a> <!-- badge --> <div *ngIf=\"child3.badge\" title=\"{{child3.badge}}\" class=\"badge badge-{{child3.badge_status}}\" [class.badge-dot]=\"child3.badge_dot\"> <em>{{child3.badge}}</em> </div> </li> </ng-container> </ul> </li> </ng-container> </ul> </li> </ng-container> </ng-template> </ng-container> </ul> ",
                    changeDetection: ChangeDetectionStrategy.OnPush,
                    preserveWhitespaces: false,
                },] },
];
`
###### node_modules/@delon/abc/esm5/abc.js
###### 设置父节点菜单不可点
`
 SidebarNavComponent.prototype.floatingAreaClickHandle =
    ..............>
        /** @type {?} */
        var baseHerf = this.locationStrategy.getBaseHref();
        if (baseHerf) {
            url = url.slice(baseHerf.length);
        }
        
        修改为：
        
        /** @type {?} */
        var baseHerf = this.locationStrategy.getBaseHref();
        if (baseHerf) {
            if(!url) return false;
            url = url.slice(baseHerf.length);
        }
        
`


##### 强制刷新后自动展开3级当前菜单
##### /node_modules/@delon/theme/esm5/theme.js
`
MenuService.prototype.openedByUrl = 
            /**
             * 根据URL设置菜单 `_open` 属性
             * @param url URL地址
             */
        function (url) {
            ......
            this.visit(function (item) {
               ........在方法末尾加入
              if (item && url.startsWith(item.link)) {
                item['_open'] = true;
              }
            });
            ...........
        };
`
