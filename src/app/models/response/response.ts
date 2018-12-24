export class Response {
  code: number;
  msg: string;
  sub_code: string;
  sub_msg: string;
  result: any;
  ok: boolean;
  it: boolean;

}

export class ResponseUtils {
  static ok( res: Response ): boolean {
    return res.code === ResponseEnum.code200 && res.sub_code === ResponseEnum.request_success;
  }

  static it( res: Response ): boolean {
    return res.code === ResponseEnum.code400 && res.sub_code === ResponseEnum.invalid_token;
  }

  static ex( res: Response ): boolean {
    return res.code === ResponseEnum.code500;
  }

  static errMsg( res: Response ): string {
    return res.msg + ', ' + res.sub_msg;
  }
}

export enum ResponseEnum {
  code200 = 200, code400 = 400, code500 = 500, request_success = 'request_success', invalid_grant = 'invalid_grant', invalid_token = 'invalid_token'
}
