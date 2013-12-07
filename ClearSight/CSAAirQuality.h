//
//  CSAAirQuality.h
//  ClearSight
//
//  Created by Zuyang Kou on 12/5/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSAAirQuality : NSObject

@property (nonatomic, strong) NSNumber *aqi;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
