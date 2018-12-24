import { TestBed }         from '@angular/core/testing';
import { SupplierService } from "@ser/supplier/supplier.service";

describe( 'SupplierService', () => {
  beforeEach( () => TestBed.configureTestingModule( {} ) );

  it( 'should be created', () => {
    const service: SupplierService = TestBed.get( SupplierService );
    expect( service ).toBeTruthy();
  } );
} );
