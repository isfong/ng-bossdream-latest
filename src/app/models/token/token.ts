export class OAuth2Token {
  access_token: string;
  refresh_token: string;
  token_type: string;
  expires_in: number;
  scope: string;
  sub: any;
  jti: string;
}

export enum TokenEnum {
  Access = 1, Refresh = 2
}
