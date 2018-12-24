import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { OrdinaryRepairOrderComponent }     from "@com/console/admin/order/ordinary-repair-order/ordinary-repair-order.component";

describe( 'OrdinaryRepairOrderComponent', () => {
  let component: OrdinaryRepairOrderComponent;
  let fixture: ComponentFixture<OrdinaryRepairOrderComponent>;

  beforeEach( async( () => {
    TestBed.configureTestingModule( {
      declarations: [ OrdinaryRepairOrderComponent ]
    } )
      .compileComponents().catch();
  } ) );

  beforeEach( () => {
    fixture = TestBed.createComponent( OrdinaryRepairOrderComponent );
    component = fixture.componentInstance;
    fixture.detectChanges();
  } );

  it( 'should create', () => {
    expect( component ).toBeTruthy();
  } );
} );
