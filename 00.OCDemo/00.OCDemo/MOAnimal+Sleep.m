//
//  MOAnimal+Sleep.m
//  00.OCDemo
//
//  Created by moxiaoyan on 2020/7/15.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import "MOAnimal+Sleep.h"
#import <objc/runtime.h>

@implementation MOAnimal (Sleep)

// 需要在.m文件 #import <objc/runtime.h>
// 然后用runtime实现set get 方法
- (void)setPlace:(NSString *)place {
  objc_setAssociatedObject(self, @"place", place, OBJC_ASSOCIATION_COPY);
}
- (NSString *)place {
  return objc_getAssociatedObject(self, @"place");
}

- (void)setSleepDelegate:(id<MOAnimalSleepDelegate>)sleepDelegate {
  objc_setAssociatedObject(self, @"sleepDelegate", sleepDelegate, OBJC_ASSOCIATION_ASSIGN);
}
- (id<MOAnimalSleepDelegate>)sleepDelegate {
  return objc_getAssociatedObject(self, @"sleepDelegate");
}

- (void)sleep {
  if (self.sleepDelegate && [self.sleepDelegate respondsToSelector:@selector(sleep:)]) {
    [self.sleepDelegate sleep:self.place];
  }
}

@end
