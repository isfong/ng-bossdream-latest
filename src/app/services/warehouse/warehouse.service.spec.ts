import { TestBed }          from '@angular/core/testing';
import { WarehouseService } from "@ser/warehouse/warehouse.service";

describe( 'WarehouseService', () => {
  beforeEach( () => TestBed.configureTestingModule( {} ) );

  it( 'should be created', () => {
    const service: WarehouseService = TestBed.get( WarehouseService );
    expect( service ).toBeTruthy();
  } );
} );
