import { TestBed }                  from '@angular/core/testing';
import { RouterInterceptorService } from "@ser/router-interceptor/router-interceptor.service";


describe( 'RouterInterceptorService', () => {
  beforeEach( () => TestBed.configureTestingModule( {} ) );

  it( 'should be created', () => {
    const service: RouterInterceptorService = TestBed.get( RouterInterceptorService );
    expect( service ).toBeTruthy();
  } );
} );
