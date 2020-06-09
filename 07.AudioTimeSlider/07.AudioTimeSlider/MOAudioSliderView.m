//
//  MOAudioSliderView.m
//  07.AudioTimeSlider
//
//  Created by moxiaoyan on 2020/6/3.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import "MOAudioSliderView.h"
#import <AVFoundation/AVFoundation.h>
#import "MOTimeTableView.h"
#import "MOWaveTableView.h"
#define kLeftSpacing ([UIScreen mainScreen].bounds.size.width/2 - 60)
NSInteger const cellHeight = 120;

@interface MOAudioSliderView()<MOTableViewDelegate>
@property (nonatomic, strong) NSArray *points;
@property (nonatomic, strong) NSURL *playURL;
@property (nonatomic, strong) UIButton *playBtn;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) MOTimeTableView *timeView;
@property (nonatomic, strong) MOWaveTableView *waveView;
@property (nonatomic, strong) UIImageView *pointerImgV;
@property (nonatomic, strong) NSMutableArray *pointArrays;
@end

@implementation MOAudioSliderView

- (instancetype)initWithFrame:(CGRect)frame playUrl:(NSURL *)playUrl points:(NSArray *)points {
  self = [super initWithFrame:frame];
  if (self) {
    [self setupView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didPlayToEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    self.playURL = playUrl;
    self.points = points;
  }
  return self;
}

- (void)setupView {
  self.timeView = [[MOTimeTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
  self.timeView.frame = CGRectMake(0, 0, self.frame.size.width, 20);
  [self addSubview:self.timeView];
  
  self.waveView = [[MOWaveTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
  self.waveView.frame = CGRectMake(0, 20, self.frame.size.width, self.frame.size.height - 20);
  self.waveView.scrollDelegate = self;
  [self addSubview:self.waveView];
    
  self.playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
  [self.playBtn setImage:[UIImage imageNamed:@"transcript_play"] forState:UIControlStateNormal];
  [self.playBtn setImage:[UIImage imageNamed:@"transcript_pause"] forState:UIControlStateSelected];
  [self.playBtn addTarget:self action:@selector(playBtnAction) forControlEvents:UIControlEventTouchUpInside];
  self.playBtn.frame = CGRectMake(10, 30, 44, 44);
  [self addSubview:self.playBtn];
  
  self.pointerImgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"transcript_pointer"]];
  self.pointerImgV.frame = CGRectMake(kLeftSpacing+34, 10, 16, self.frame.size.height-10);
  [self addSubview:self.pointerImgV];
  CGFloat rightSpace = self.frame.size.width - CGRectGetMidX(self.pointerImgV.frame);
  self.timeView.rightSpace = rightSpace;
  self.waveView.rightSpace = rightSpace;
}

- (void)setPoints:(NSArray *)points {
  _points = points;
  NSMutableArray *tempArray = [NSMutableArray arrayWithArray:_points];
  self.pointArrays = [[NSMutableArray alloc] init];
  NSInteger index = 0;
  while (tempArray.count > 0) {
    if (index == 0) {
      if (tempArray.count >= 20) {
        [self.pointArrays addObject:[tempArray subarrayWithRange:NSMakeRange(0, 20)]];
        [tempArray removeObjectsInRange:NSMakeRange(0, 20)];
      }
    } else {
      if (tempArray.count >= 30) {
        [self.pointArrays addObject:[tempArray subarrayWithRange:NSMakeRange(0, 30)]];
        [tempArray removeObjectsInRange:NSMakeRange(0, 30)];
      } else {
        [self.pointArrays addObject:[tempArray copy]];
        [tempArray removeAllObjects];
      }
    }
    index++;
  }
  self.timeView.points = self.pointArrays;
  self.waveView.points = self.pointArrays;
}

- (void)playBtnAction {
  self.playBtn.selected = !self.playBtn.isSelected;
  if (self.playBtn.isSelected) {
    [self.player play];
  } else {
    [self.player pause];
  }
}

- (AVPlayer *)player {
  if (!_player) {
    _player = [[AVPlayer alloc] initWithURL:self.playURL];
    __weak typeof(self) weakSelf = self;
    [_player addPeriodicTimeObserverForInterval:CMTimeMake(1.0, 1.0) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
      float currentTime = weakSelf.player.currentTime.value / weakSelf.player.currentTime.timescale;
      [weakSelf.waveView setContentOffset:CGPointMake(0, currentTime * 4)];
    }];
  }
  return _player;
}

- (void)didPlayToEnd {
  self.playBtn.selected = NO;
}

#pragma mark - MOTableViewDelegate
- (void)contentOffsetY:(CGFloat)y {
  [self.timeView setContentOffset:CGPointMake(0, y) animated:NO];
}

- (void)willBeginDragging {
  [self.player pause];
}

- (void)didEndDraggingY:(CGFloat)y {
  CGFloat second = y/4;
  [self.player seekToTime:CMTimeMakeWithSeconds(second, NSEC_PER_SEC)];
  if (self.playBtn.selected) {
    [self.player play];
  }
}

@end
