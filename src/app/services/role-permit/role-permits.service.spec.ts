import { TestBed }            from '@angular/core/testing';
import { RolePermitsService } from "@ser/role-permit/role-permits.service";


describe( 'RolePermitsService', () => {
  beforeEach( () => TestBed.configureTestingModule( {} ) );

  it( 'should be created', () => {
    const service: RolePermitsService = TestBed.get( RolePermitsService );
    // noinspection JSIgnoredPromiseFromCall
    expect( service ).toBeTruthy();
  } );
} );
