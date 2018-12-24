import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { AdministratorAddComponent }        from "@com/console/admin/authorize/user/administrator/administrator-add/administrator-add.component";


describe( 'AdministratorAddComponent', () => {
  let component: AdministratorAddComponent;
  let fixture: ComponentFixture<AdministratorAddComponent>;

  beforeEach( async( () => {
    TestBed.configureTestingModule( {
      declarations: [ AdministratorAddComponent ]
    } )
      .compileComponents().catch();
  } ) );

  beforeEach( () => {
    fixture = TestBed.createComponent( AdministratorAddComponent );
    component = fixture.componentInstance;
    fixture.detectChanges();
  } );

  it( 'should create', () => {
    expect( component ).toBeTruthy();
  } );
} );
