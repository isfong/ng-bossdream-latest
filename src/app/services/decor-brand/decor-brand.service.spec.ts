import { TestBed }           from '@angular/core/testing';
import { DecorBrandService } from "@ser/decor-brand/decor-brand.service";

describe( 'DecorBrandService', () => {
  beforeEach( () => TestBed.configureTestingModule( {} ) );

  it( 'should be created', () => {
    const service: DecorBrandService = TestBed.get( DecorBrandService );
    expect( service ).toBeTruthy();
  } );
} );
