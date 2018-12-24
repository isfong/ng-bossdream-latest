import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { FullscreenComponent }              from '@com/console/header/fullscreen/fullscreen.component';


describe( 'FullscreenComponent', () => {
  let component: FullscreenComponent;
  let fixture: ComponentFixture<FullscreenComponent>;

  beforeEach( async( () => {
    TestBed.configureTestingModule( {
      declarations: [ FullscreenComponent ]
    } )
      .compileComponents().catch();
  } ) );

  beforeEach( () => {
    fixture = TestBed.createComponent( FullscreenComponent );
    component = fixture.componentInstance;
    fixture.detectChanges();
  } );

  it( 'should create', () => {
    expect( component ).toBeTruthy();
  } );
} );
