import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { PassportComponent }                from '@com/passport/passport.component';

describe( 'PassportComponent', () => {
  let component: PassportComponent;
  let fixture: ComponentFixture<PassportComponent>;

  beforeEach( async( () => {
    TestBed.configureTestingModule( {
      declarations: [ PassportComponent ]
    } )
      .compileComponents().catch();
  } ) );

  beforeEach( () => {
    fixture = TestBed.createComponent( PassportComponent );
    component = fixture.componentInstance;
    fixture.detectChanges();
  } );

  it( 'should create', () => {
    // noinspection JSIgnoredPromiseFromCall
    expect( component ).toBeTruthy();
  } );
} );
