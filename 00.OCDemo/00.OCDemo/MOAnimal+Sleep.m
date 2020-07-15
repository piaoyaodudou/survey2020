//
//  MOAnimal+Sleep.m
//  00.OCDemo
//
//  Created by moxiaoyan on 2020/7/15.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import "MOAnimal+Sleep.h"
#import <objc/runtime.h>

static NSString *placeKey = @"place";
static NSString *sleepDlegateKey = @"sleepDelegate";

// 1. static char studentNameKey; // 固定地址
// 2. static const void *studentNameKey = &studentNameKey;
// 3. @selector(place) // 使用getter方法名作为key

@implementation MOAnimal (Sleep)

// 需要在.m文件 #import <objc/runtime.h>
// 然后用runtime实现set get 方法
- (void)setPlace:(NSString *)place {
  objc_setAssociatedObject(self, &placeKey, place, OBJC_ASSOCIATION_COPY);
}
- (NSString *)place {
  return objc_getAssociatedObject(self, &placeKey);
}

- (void)setSleepDelegate:(id<MOAnimalSleepDelegate>)sleepDelegate {
  objc_setAssociatedObject(self, &sleepDlegateKey, sleepDelegate, OBJC_ASSOCIATION_ASSIGN);
}
- (id<MOAnimalSleepDelegate>)sleepDelegate {
  return objc_getAssociatedObject(self, &sleepDlegateKey);
}

- (void)sleep {
  if (self.sleepDelegate && [self.sleepDelegate respondsToSelector:@selector(sleep:)]) {
    [self.sleepDelegate sleep:self.place];
  }
}

@end
