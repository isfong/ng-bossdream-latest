import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { RoleAddComponent }                 from '@com/console/admin/authorize/role/role-add/role-add.component';

describe( 'RoleAddComponent', () => {
  let component: RoleAddComponent;
  let fixture: ComponentFixture<RoleAddComponent>;

  beforeEach( async( () => {
    TestBed.configureTestingModule( {
      declarations: [ RoleAddComponent ]
    } )
      .compileComponents().catch();
  } ) );

  beforeEach( () => {
    fixture = TestBed.createComponent( RoleAddComponent );
    component = fixture.componentInstance;
    fixture.detectChanges();
  } );

  it( 'should create', () => {
    expect( component ).toBeTruthy();
  } );
} );
