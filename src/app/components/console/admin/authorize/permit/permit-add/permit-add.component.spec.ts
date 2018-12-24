import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { PermitAddComponent }               from "@com/console/admin/authorize/permit/permit-add/permit-add.component";


describe( 'PermitAddComponent', () => {
  let component: PermitAddComponent;
  let fixture: ComponentFixture<PermitAddComponent>;

  beforeEach( async( () => {
    TestBed.configureTestingModule( {
      declarations: [ PermitAddComponent ]
    } )
      .compileComponents().catch();
  } ) );

  beforeEach( () => {
    fixture = TestBed.createComponent( PermitAddComponent );
    component = fixture.componentInstance;
    fixture.detectChanges();
  } );

  it( 'should create', () => {
    expect( component ).toBeTruthy();
  } );
} );
