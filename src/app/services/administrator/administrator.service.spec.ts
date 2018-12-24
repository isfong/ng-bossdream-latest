import { TestBed }              from '@angular/core/testing';
import { AdministratorService } from '@ser/administrator/administrator.service';

describe( 'AdministratorService', () => {
  beforeEach( () => TestBed.configureTestingModule( {} ) );

  it( 'should be created', () => {
    const service: AdministratorService = TestBed.get( AdministratorService );
    // noinspection JSIgnoredPromiseFromCall
    expect( service ).toBeTruthy();
  } );
} );
