import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { NotifyComponent }                  from '@com/console/header/notify/notify.component';

describe( 'NotifyComponent', () => {
  let component: NotifyComponent;
  let fixture: ComponentFixture<NotifyComponent>;

  beforeEach( async( () => {
    TestBed.configureTestingModule( {
      declarations: [ NotifyComponent ]
    } )
      .compileComponents().catch();
  } ) );

  beforeEach( () => {
    fixture = TestBed.createComponent( NotifyComponent );
    component = fixture.componentInstance;
    fixture.detectChanges();
  } );

  it( 'should create', () => {
    expect( component ).toBeTruthy();
  } );
} );
