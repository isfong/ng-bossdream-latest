import { TestBed }        from '@angular/core/testing';
import { PermitsService } from "@ser/permit/permits.service";


describe( 'PermitsService', () => {
  beforeEach( () => TestBed.configureTestingModule( {} ) );

  it( 'should be created', () => {
    const service: PermitsService = TestBed.get( PermitsService );
    // noinspection JSIgnoredPromiseFromCall
    expect( service ).toBeTruthy();
  } );
} );
