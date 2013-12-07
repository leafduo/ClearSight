//
//  CSAHTTPClient.m
//  AQIMonitor
//
//  Created by Zuyang Kou on 12/5/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import "CSAHTTPClient.h"
#import "CSAAirQuality.h"

@implementation CSAHTTPClient

static NSString * const AQIBaseURLString = @"http://www.pm25.in/api/";

+ (instancetype)sharedClient {
    static CSAHTTPClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[CSAHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:AQIBaseURLString]];
       [_sharedClient setSecurityPolicy:[AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey]];
        [_sharedClient.requestSerializer setValue:@"_aqi_query_session=BAh7CUkiD3Nlc3Npb25faWQGOgZFRkkiJWZiZTYwYTk2NWQwN2E1MzMyYzkwYWY1M2Q4YTUwNmU3BjsAVEkiDGNhcHRjaGEGOwBGIi1kZTk1YzRlYTg1MzM0YzI5ZmU2OTU1YzdlYTcyYjZiNGYyYjY4YmE3SSIQX2NzcmZfdG9rZW4GOwBGSSIxWDVjbVRPaHZERHY1M05LTm9IdDdmaG9HUWZxb1NXcVRveUN2dGNhV0M3OD0GOwBGSSIdd2FyZGVuLnVzZXIuYXBpX3VzZXIua2V5BjsAVFsHWwZpAkIDSSIiJDJhJDEwJFhGQzRsazhwOFdOOFZUWHVQaXl3R08GOwBU--5c2aa99b1c4c5d07c72d4603e9873b25833cf332"
                               forHTTPHeaderField:@"Cookie"];
    });
    
    return _sharedClient;
}

- (void)getCurrentAQIWithCompletion:(void (^)(CSAAirQuality *airQuality, NSError *error))completion {
    NSDictionary *params = @{@"city": @"beijing",/* @"token": @"5j1znBVAsnSf5xQyNQyq",*/ @"stations": @"no"};
    [[CSAHTTPClient sharedClient] GET:@"querys/pm2_5.json" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        CSAAirQuality *airQuality = [[CSAAirQuality alloc] initWithDictionary:[responseObject lastObject]];
        completion(airQuality, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}

@end
