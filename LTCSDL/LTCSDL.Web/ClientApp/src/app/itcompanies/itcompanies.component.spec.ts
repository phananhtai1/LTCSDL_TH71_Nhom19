import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ITCompaniesComponent } from './itcompanies.component';

describe('ITCompaniesComponent', () => {
  let component: ITCompaniesComponent;
  let fixture: ComponentFixture<ITCompaniesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ITCompaniesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ITCompaniesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
