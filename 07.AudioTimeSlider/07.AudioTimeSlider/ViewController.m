//
//  ViewController.m
//  07.AudioTimeSlider
//
//  Created by moxiaoyan on 2020/6/3.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import "ViewController.h"
#import "MOAudioSliderView.h"

@interface ViewController ()

@end

@implementation ViewController {
  MOAudioSliderView *_sliderView;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  NSString *filePath = [[NSBundle mainBundle] pathForResource:@"samplePoints" ofType:@""];
  NSArray *points = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
  NSString *urlStr = @"https://mobvoi-backend-public.cn-bj.ufileos.com/mcloud/a837043b71a8bc7fbb06c24d5e1120e52229949425054810607.mp3";
  NSURL *playUrl = [NSURL URLWithString:urlStr];

  _sliderView = [[MOAudioSliderView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 85)
                                                 playUrl:playUrl
                                                  points:points];
  _sliderView.frame = CGRectMake(0, 100, self.view.frame.size.width, 85);
  [self.view addSubview:_sliderView];
}

@end
