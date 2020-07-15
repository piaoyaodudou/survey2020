//
//  MOCat.m
//  00.OCDemo
//
//  Created by moxiaoyan on 2020/7/15.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import "MOCat.h"

@implementation MOCat

@synthesize name = _name;

- (void)eat {
  if (self.delegate && [self.delegate respondsToSelector:@selector(eat)]) {
    self.delegate.food = @"喵粮";
    [self.delegate eat];
  }
}

@end
