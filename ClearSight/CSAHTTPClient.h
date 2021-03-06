//
//  CSAHTTPClient.h
//  ClearSight
//
//  Created by Zuyang Kou on 12/5/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@class CSAAirQuality;

@interface CSAHTTPClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

- (void)getCurrentAQIWithCompletion:(void (^)(CSAAirQuality *airQuality, NSError *error))completion;

@end
