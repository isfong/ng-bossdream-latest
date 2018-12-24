import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { ApplicationComponent }             from '@com/console/header/application/application.component';


describe( 'ApplicationComponent', () => {
  let component: ApplicationComponent;
  let fixture: ComponentFixture<ApplicationComponent>;

  beforeEach( async( () => {
    TestBed.configureTestingModule( {
      declarations: [ ApplicationComponent ]
    } )
      .compileComponents().catch();
  } ) );

  beforeEach( () => {
    fixture = TestBed.createComponent( ApplicationComponent );
    component = fixture.componentInstance;
    fixture.detectChanges();
  } );

  it( 'should create', () => {
    expect( component ).toBeTruthy();
  } );
} );
