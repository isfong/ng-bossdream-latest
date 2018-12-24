import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { Error404Component }                from '@com/error/error404/error404.component';


describe( 'Error404Component', () => {
  let component: Error404Component;
  let fixture: ComponentFixture<Error404Component>;

  beforeEach( async( () => {
    TestBed.configureTestingModule( {
      declarations: [ Error404Component ]
    } )
      .compileComponents().catch();
  } ) );

  beforeEach( () => {
    fixture = TestBed.createComponent( Error404Component );
    component = fixture.componentInstance;
    fixture.detectChanges();
  } );

  it( 'should create', () => {
    expect( component ).toBeTruthy();
  } );
} );
