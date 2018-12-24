import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RolePermitsComponent } from './role-permits.component';

describe( 'RolePermitsComponent', () => {
  let component: RolePermitsComponent;
  let fixture: ComponentFixture<RolePermitsComponent>;

  beforeEach( async( () => {
    TestBed.configureTestingModule( {
      declarations: [ RolePermitsComponent ]
    } )
      .compileComponents().catch();
  } ) );

  beforeEach( () => {
    fixture = TestBed.createComponent( RolePermitsComponent );
    component = fixture.componentInstance;
    fixture.detectChanges();
  } );

  it( 'should create', () => {
    expect( component ).toBeTruthy();
  } );
} );
