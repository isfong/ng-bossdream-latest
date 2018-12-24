import { Component, OnInit }                from '@angular/core';
import { API }                              from "@mod/api/api";
import { Administrator }                    from "@mod/administrator/administrator";
import { AdministratorService }             from "@ser/administrator/administrator.service";
import { NzMessageService, NzModalService } from "ng-zorro-antd";
import { AdministratorAddComponent }        from "@com/console/admin/authorize/user/administrator/administrator-add/administrator-add.component";
import { UserRoleService }                  from "@ser/user-role/user-role.service";
import { ResponseUtils }                    from "@mod/response/response";
import { AdministratorRoleComponent }       from "@com/console/admin/authorize/user/administrator/administrator-role/administrator-role.component";
import { SimpleTableColumn }                from "@delon/abc";

@Component( {
  selector: 'app-console-admin-authorize-user-administrator',
  templateUrl: './administrator.component.html',
  styleUrls: [ './administrator.component.less' ]
} )
export class AdministratorComponent implements OnInit {
  pre = API.uri.oss_pre;
  num: number = 1;
  size: number = 6;
  total: number = 0;
  administrators: Administrator[] = [];
  loading: boolean = false;
  options: any;

  dataSet = [];

  columns: SimpleTableColumn[] = [
    { title: "编号", index: "id" },
    { title: "头像", type: "img", width: "50px", index: "avatar" },
    { title: "邮箱", index: "email" },
    { title: "电话", index: "phone" },

  ];

  /*q: any = {
    status: 'all',
  };*/

  constructor(
    private msg: NzMessageService,
    private modal: NzModalService,
    private userRoleSer: UserRoleService,
    private adminSer: AdministratorService
  ) {
  }

  ngOnInit() {
    this.list();

    for ( let i = 0; i < 100; i++ ) {
      this.dataSet.push( {
        name: `Edward Kinghahhahahh发的胡搜阿富汗的搜卡哈佛大手 ${i}`,
        age: 32,
        address: `London, Park Lane no. 规划分局对工会经费的很干净${i}`
      } );
    }
  }

  /**
   * 列表
   */
  list() {
    this.loading = true;
    this.adminSer.list( this.num, this.size ).subscribe( res => {
        if ( res.ok ) {
          this.administrators = res.result.list;
          this.total = res.result.total;
          console.log( res.result );
          this.loading = false;
        } else if ( res.it ) {
          this.list();
        } else {
          this.msg.error( res.sub_msg );
          this.loading = false;
        }
      }
    )
  }

  /**
   * 去添加
   */
  add() {
    this.options = {
      nzWrapClassName: 'modal-lg',
      nzContent: AdministratorAddComponent,
      nzFooter: null,
      nzClosable: false,
      nzMaskClosable: false,
      nzShowConfirmLoading: true
    };
    this.modal.create( this.options ).afterClose.subscribe( status => {
      // 订阅关闭回调
      if ( status.toString() === 'success-call' ) {
        this.list();
        this.msg.success( '添加成功' );
      }
    } );
  }

  role( admin: Administrator ) {
    this.userRoleSer.list( admin.id, 0 ).subscribe( res => {
      if ( res.it ) {
        this.role( admin );
      } else if ( res.ok ) {
        let userRoleIds = [];
        for ( const e of res.result ) userRoleIds.push( e.roleId );
        this.options = {
          nzWrapClassName: '',
          // nzWidth: 300,
          nzContent: AdministratorRoleComponent,
          nzFooter: null,
          nzClosable: false,
          nzMaskClosable: false,
          nzShowConfirmLoading: true,
          nzComponentParams: {
            userRoleIds: userRoleIds.sort(),
            id: admin.id
          }
        };
        this.modal.create( this.options ).afterClose.subscribe( status => {
          // 订阅关闭回调
          if ( status.toString() === 'success-call' ) {
            this.msg.success( '操作成功' );
          }
        } )
      } else
        this.msg.error( ResponseUtils.errMsg( res ) );
    } );
  }

  /**、
   * 翻页按钮处理
   * @param num 页码
   */
  pageIndexChange( num ) {
    this.num = num;
    this.list();
  }

}
