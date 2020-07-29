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

- (void)drawRect:(CGRect)rect {
  [super drawRect:rect];
  NSLog(@"drawRect");
}

- (void)layoutSubviews {
  [super layoutSubviews];
  NSLog(@"layoutSubviews");
}


@end
