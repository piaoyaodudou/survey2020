//
//  NSTimer+MOBlock.m
//  00.OCDemo
//
//  Created by 莫晓卉 on 2020/7/11.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import "NSTimer+MOBlock.h"

@implementation NSTimer (MOBlock)

+ (NSTimer *)mo_scheduledTimerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)yesOrNo block:(void(^)(NSTimer *timer))block {
  return [self scheduledTimerWithTimeInterval:ti target:self selector:@selector(blockInvoke:) userInfo:[block copy] repeats:yesOrNo];
}


+ (void)blockInvoke:(NSTimer *)timer {
  void(^block)(NSTimer *timer) = timer.userInfo;
  if (block) {
    block(timer);
  }
}

@end
