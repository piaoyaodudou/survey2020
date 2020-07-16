//
//  MOAnimal.m
//  00.OCDemo
//
//  Created by moxiaoyan on 2020/7/15.
//  Copyright © 2020 moxiaohui. All rights reserved.
//



#import "MOAnimal.h"

@interface MOAnimal() {
  NSString *_address;
}
@property (nonatomic, assign) NSInteger length;
// 一个属性可以 在.h文件声明为只读的, 在.m文件声明为可写的
@property (nonatomic, readwrite, copy) NSString *indentify;
- (void)run;
@end

@implementation MOAnimal

- (instancetype)init {
  self = [super init];
  if (self) {
    _key = @"1234";
  }
  return self;
}

// set 和 get 方法都重写时，会屏蔽自动生成
// 此时需要手动加上: @synthesize name = _name;
@synthesize name = _name;
- (void)setName:(NSString *)name {
  _name = name;
}

- (NSString *)name {
  return _name;
}

// 重写了只读属性的get时，会屏蔽自动生成
// 此时需要手动加上: @synthesize indentify = _indentify;
@synthesize indentify = _indentify;
- (NSString *)indentify {
  return _indentify;
}

@dynamic age;
// @dynamic 则表示：不需要自动生成 ivar + setter + getter
// 但是没有手动实现时，使用到会报错


- (void)run {
  NSLog(@"run %ld", (long)_length);
}



@end
