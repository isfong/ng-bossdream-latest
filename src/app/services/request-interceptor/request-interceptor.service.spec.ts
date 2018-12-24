import { TestBed }                   from '@angular/core/testing';
import { RequestInterceptorService } from "@ser/request-interceptor/request-interceptor.service";


describe( 'RequestInterceptorService', () => {
  beforeEach( () => TestBed.configureTestingModule( {} ) );

  it( 'should be created', () => {
    const service: RequestInterceptorService = TestBed.get( RequestInterceptorService );
    expect( service ).toBeTruthy();
  } );
} );
