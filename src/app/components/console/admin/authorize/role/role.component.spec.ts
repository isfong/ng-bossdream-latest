import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { RoleComponent }                    from "@com/console/admin/authorize/role/role.component";


describe( 'RoleComponent', () => {
  let component: RoleComponent;
  let fixture: ComponentFixture<RoleComponent>;

  beforeEach( async( () => {
    TestBed.configureTestingModule( {
      declarations: [ RoleComponent ]
    } )
      .compileComponents().catch();
  } ) );

  beforeEach( () => {
    fixture = TestBed.createComponent( RoleComponent );
    component = fixture.componentInstance;
    fixture.detectChanges();
  } );

  it( 'should create', () => {
    expect( component ).toBeTruthy();
  } );
} );
