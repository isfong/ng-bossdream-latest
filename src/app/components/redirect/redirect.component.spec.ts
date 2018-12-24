import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { RedirectComponent }                from '@com/redirect/redirect.component';

describe( 'RedirectComponent', () => {
  let component: RedirectComponent;
  let fixture: ComponentFixture<RedirectComponent>;

  beforeEach( async( () => {
    TestBed.configureTestingModule( {
      declarations: [ RedirectComponent ]
    } )
      .compileComponents().catch();
  } ) );

  beforeEach( () => {
    fixture = TestBed.createComponent( RedirectComponent );
    component = fixture.componentInstance;
    fixture.detectChanges();
  } );

  it( 'should create', () => {
    // noinspection JSIgnoredPromiseFromCall
    expect( component ).toBeTruthy();
  } );
} );
