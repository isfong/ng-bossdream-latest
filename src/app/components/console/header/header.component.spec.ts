import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { HeaderComponent }                  from '@com/console/header/header.component';


describe( 'HeaderComponent', () => {
  let component: HeaderComponent;
  let fixture: ComponentFixture<HeaderComponent>;

  beforeEach( async( () => {
    TestBed.configureTestingModule( {
      declarations: [ HeaderComponent ]
    } )
      .compileComponents().catch();
  } ) );

  beforeEach( () => {
    fixture = TestBed.createComponent( HeaderComponent );
    component = fixture.componentInstance;
    fixture.detectChanges();
  } );

  it( 'should create', () => {
    expect( component ).toBeTruthy();
  } );
} );
