import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { TaskComponent }                    from '@com/console/header/task/task.component';

describe( 'TaskComponent', () => {
  let component: TaskComponent;
  let fixture: ComponentFixture<TaskComponent>;

  beforeEach( async( () => {
    TestBed.configureTestingModule( {
      declarations: [ TaskComponent ]
    } )
      .compileComponents().catch();
  } ) );

  beforeEach( () => {
    fixture = TestBed.createComponent( TaskComponent );
    component = fixture.componentInstance;
    fixture.detectChanges();
  } );

  it( 'should create', () => {
    expect( component ).toBeTruthy();
  } );
} );
