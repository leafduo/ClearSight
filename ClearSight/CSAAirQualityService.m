//
//  CSAAirQualityService.m
//  AQIMonitor
//
//  Created by Zuyang Kou on 12/5/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import "CSAAirQualityService.h"
#import <ReactiveCocoa.h>
#import "CSAHTTPClient.h"

@implementation CSAAirQualityService

- (RACSignal *)currentAirQuality {
    if (!_currentAirQuality) {
        _currentAirQuality = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [[CSAHTTPClient sharedClient] getCurrentAQIWithCompletion:^(CSAAirQuality *airQuality, NSError *error) {
                if (error) {
                    [subscriber sendError:error];
                    return;
                }
                [subscriber sendNext:airQuality];
            }];
            return nil;
        }];
    }
    return _currentAirQuality;
}

@end
