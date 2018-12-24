import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { SidebarComponent }                 from '@com/console/sidebar/sidebar.component';


describe( 'SidebarComponent', () => {
  let component: SidebarComponent;
  let fixture: ComponentFixture<SidebarComponent>;

  beforeEach( async( () => {
    TestBed.configureTestingModule( {
      declarations: [ SidebarComponent ]
    } )
      .compileComponents().catch();
  } ) );

  beforeEach( () => {
    fixture = TestBed.createComponent( SidebarComponent );
    component = fixture.componentInstance;
    fixture.detectChanges();
  } );

  it( 'should create', () => {
    expect( component ).toBeTruthy();
  } );
} );
