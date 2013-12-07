//
//  CSAAirQualityService.h
//  AQIMonitor
//
//  Created by Zuyang Kou on 12/5/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACSignal;

@interface CSAAirQualityService : NSObject

@property (nonatomic, strong) RACSignal *airQualitySignal;

@end
