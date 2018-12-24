import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { CaseComponent }                    from '@com/public/case/case.component';

describe( 'CaseComponent', () => {
  let component: CaseComponent;
  let fixture: ComponentFixture<CaseComponent>;

  beforeEach( async( () => {
    TestBed.configureTestingModule( {
      declarations: [ CaseComponent ]
    } )
      .compileComponents().catch();
  } ) );

  beforeEach( () => {
    fixture = TestBed.createComponent( CaseComponent );
    component = fixture.componentInstance;
    fixture.detectChanges();
  } );

  it( 'should create', () => {
    expect( component ).toBeTruthy();
  } );
} );
