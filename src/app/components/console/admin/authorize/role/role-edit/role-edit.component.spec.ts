import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { RoleEditComponent }                from "@com/console/admin/authorize/role/role-edit/role-edit.component";

describe( 'RoleEditComponent', () => {
  let component: RoleEditComponent;
  let fixture: ComponentFixture<RoleEditComponent>;

  beforeEach( async( () => {
    TestBed.configureTestingModule( {
      declarations: [ RoleEditComponent ]
    } )
      .compileComponents().catch();
  } ) );

  beforeEach( () => {
    fixture = TestBed.createComponent( RoleEditComponent );
    component = fixture.componentInstance;
    fixture.detectChanges();
  } );

  it( 'should create', () => {
    expect( component ).toBeTruthy();
  } );
} );
