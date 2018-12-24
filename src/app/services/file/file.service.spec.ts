import { TestBed }     from '@angular/core/testing';
import { FileService } from '@ser/file/file.service';

describe( 'FileService', () => {
  beforeEach( () => TestBed.configureTestingModule( {} ) );

  it( 'should be created', () => {
    const service: FileService = TestBed.get( FileService );
    // noinspection JSIgnoredPromiseFromCall
    expect( service ).toBeTruthy();
  } );
} );
