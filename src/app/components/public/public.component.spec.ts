import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { PublicComponent }                  from "@com/public/public.component";


describe( 'PublicComponent', () => {
  let component: PublicComponent;
  let fixture: ComponentFixture<PublicComponent>;

  beforeEach( async( () => {
    TestBed.configureTestingModule( {
      declarations: [ PublicComponent ]
    } )
      .compileComponents().catch();
  } ) );

  beforeEach( () => {
    fixture = TestBed.createComponent( PublicComponent );
    component = fixture.componentInstance;
    fixture.detectChanges();
  } );

  it( 'should create', () => {
    // noinspection JSIgnoredPromiseFromCall
    expect( component ).toBeTruthy();
  } );
} );
