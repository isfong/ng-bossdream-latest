import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { ErrorComponent }                   from "@com/error/error.component";


describe( 'ErrorComponent', () => {
  let component: ErrorComponent;
  let fixture: ComponentFixture<ErrorComponent>;

  beforeEach( async( () => {
    TestBed.configureTestingModule( {
      declarations: [ ErrorComponent ]
    } )
      .compileComponents().catch();
  } ) );

  beforeEach( () => {
    fixture = TestBed.createComponent( ErrorComponent );
    component = fixture.componentInstance;
    fixture.detectChanges();
  } );

  it( 'should create', () => {
    // noinspection JSIgnoredPromiseFromCall
    expect( component ).toBeTruthy();
  } );
} );
