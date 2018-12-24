import { TestBed }         from '@angular/core/testing';
import { UserRoleService } from "@ser/user-role/user-role.service";

describe( 'UserRoleService', () => {
  beforeEach( () => TestBed.configureTestingModule( {} ) );

  it( 'should be created', () => {
    const service: UserRoleService = TestBed.get( UserRoleService );
    // noinspection JSIgnoredPromiseFromCall
    expect( service ).toBeTruthy();
  } );
} );
