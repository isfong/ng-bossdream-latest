import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { PermitComponent }                  from "@com/console/admin/authorize/permit/permit.component";


describe( 'PermitComponent', () => {
  let component: PermitComponent;
  let fixture: ComponentFixture<PermitComponent>;

  beforeEach( async( () => {
    TestBed.configureTestingModule( {
      declarations: [ PermitComponent ]
    } )
      .compileComponents().catch();
  } ) );

  beforeEach( () => {
    fixture = TestBed.createComponent( PermitComponent );
    component = fixture.componentInstance;
    fixture.detectChanges();
  } );

  it( 'should create', () => {
    // noinspection JSIgnoredPromiseFromCall
    expect( component ).toBeTruthy();
  } );
} );
