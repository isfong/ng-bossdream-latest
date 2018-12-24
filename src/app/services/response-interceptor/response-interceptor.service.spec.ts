import { TestBed }                    from '@angular/core/testing';
import { ResponseInterceptorService } from "@ser/response-interceptor/response-interceptor.service";


describe( 'ResponseInterceptorService', () => {
  beforeEach( () => TestBed.configureTestingModule( {} ) );

  it( 'should be created', () => {
    const service: ResponseInterceptorService = TestBed.get( ResponseInterceptorService );
    // noinspection JSIgnoredPromiseFromCall
    expect( service ).toBeTruthy();
  } );
} );
