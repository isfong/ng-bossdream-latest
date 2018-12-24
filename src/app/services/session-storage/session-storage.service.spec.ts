import { TestBed }               from '@angular/core/testing';
import { SessionStorageService } from "@ser/session-storage/session-storage.service";

describe( 'SessionStorageService', () => {
  beforeEach( () => TestBed.configureTestingModule( {} ) );

  it( 'should be created', () => {
    const service: SessionStorageService = TestBed.get( SessionStorageService );
    expect( service ).toBeTruthy();
  } );
} );
