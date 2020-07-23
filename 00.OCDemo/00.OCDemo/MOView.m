//
//  MOView.m
//  00.OCDemo
//
//  Created by moxiaoyan on 2020/7/23.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import "MOView.h"

@implementation MOView

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    NSLog(@"initWithFrame");
  }
  return self;
}


// init 默认调用一次, 不管有木有addSubview
// initWithFrame frame不为zero, 会调用两次(一次init, 一次frame)
// addSubview 每次都调用
// frame 改变 (同时也会触发父视图的)
// scrollView 滑动时会一直调用自己的
// screen旋转 触发父视图的
- (void)layoutSubviews {
  [super layoutSubviews];
  NSLog(@"layoutSubviews");
}


@end
