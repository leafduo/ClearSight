//
//  CSAAirQualityServiceSpec.m
//  ClearSight
//
//  Created by Zuyang Kou on 12/8/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import <Specta.h>
#define EXP_SHORTHAND
#import <Expecta.h>
#import "CSAAirQualityService.h"
#import "CSAAirQuality.h"

SpecBegin(CSAAirQualityService)

describe(@"CSAAirQualityService", ^{
    __block CSAAirQualityService *_airQualityService;
    
    beforeEach(^{
        _airQualityService = [[CSAAirQualityService alloc] init];
    });
    
    it(@"should get a CSAAirQuality", ^AsyncBlock {
        [_airQualityService.currentAirQuality subscribeNext:^(CSAAirQuality *airQuality) {
            expect(airQuality).to.beKindOf([CSAAirQuality class]);
            expect(airQuality.aqi).to.beGreaterThan(0);
            done();
        } error:^(NSError *error) {
            XCTAssert(NO, @"This shouldn't raise an error");
        }];
    });
});

SpecEnd
