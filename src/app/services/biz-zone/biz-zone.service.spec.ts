import { TestBed }        from '@angular/core/testing';
import { BizZoneService } from "@ser/biz-zone/biz-zone.service";

describe('BizZoneService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: BizZoneService = TestBed.get(BizZoneService);
    expect(service).toBeTruthy();
  });
});
