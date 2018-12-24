import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { PermitEditComponent }              from "@com/console/admin/authorize/permit/permit-edit/permit-edit.component";


describe( 'PermitEditComponent', () => {
  let component: PermitEditComponent;
  let fixture: ComponentFixture<PermitEditComponent>;

  beforeEach( async( () => {
    TestBed.configureTestingModule( {
      declarations: [ PermitEditComponent ]
    } )
      .compileComponents().catch();
  } ) );

  beforeEach( () => {
    fixture = TestBed.createComponent( PermitEditComponent );
    component = fixture.componentInstance;
    fixture.detectChanges();
  } );

  it( 'should create', () => {
    expect( component ).toBeTruthy();
  } );
} );
