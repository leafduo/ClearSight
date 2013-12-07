//
//  CSAViewController.m
//  ClearSight
//
//  Created by Zuyang Kou on 12/8/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import "CSAViewController.h"
#import "CSAAirQualityService.h"
#import "CSAAirQuality.h"

@interface CSAViewController ()

@property (nonatomic, strong) IBOutlet UILabel *AQILabel;

@end

@implementation CSAViewController {
    CSAAirQualityService *_airQualityService;
}

- (void)awakeFromNib {
    _airQualityService = [[CSAAirQualityService alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    RAC(self.AQILabel, text) = [_airQualityService.currentAirQuality map:^NSString *(CSAAirQuality *airQuality) {
        return [airQuality.aqi stringValue];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
