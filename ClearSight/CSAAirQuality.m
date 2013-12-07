//
//  CSAAirQuality.m
//  ClearSight
//
//  Created by Zuyang Kou on 12/5/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import "CSAAirQuality.h"

@implementation CSAAirQuality

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        [self setValuesWithDictionary:dictionary];
    }
    return self;
}

- (instancetype)init {
    return [self initWithDictionary:nil];
}

- (void)setValuesWithDictionary:(NSDictionary *)dictionary {
    self.aqi = dictionary[@"aqi"];
}

@end
