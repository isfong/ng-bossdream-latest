import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { UserComponent }                    from '@com/console/header/user/user.component';

describe( 'UserComponent', () => {
  let component: UserComponent;
  let fixture: ComponentFixture<UserComponent>;

  beforeEach( async( () => {
    TestBed.configureTestingModule( {
      declarations: [ UserComponent ]
    } )
      .compileComponents().catch();
  } ) );

  beforeEach( () => {
    fixture = TestBed.createComponent( UserComponent );
    component = fixture.componentInstance;
    fixture.detectChanges();
  } );

  it( 'should create', () => {
    // noinspection JSIgnoredPromiseFromCall
    expect( component ).toBeTruthy();
  } );
} );
