//
//  MOTestInitView.m
//  01.OCTest
//
//  Created by moxiaoyan on 2020/5/14.
//  Copyright © 2020 moxiaoyan. All rights reserved.
//

#import "MOTestInitView.h"

@implementation MOTestInitView

#pragma mark - override super Designated Initializer !!!!!
- (instancetype)initWithFrame:(CGRect)frame {
  return [self initWithFrame:frame andName:@""];
}

#pragma mark - Designated Initializer
- (instancetype)initWithFrame:(CGRect)frame andName:(NSString *)name {
  self = [super initWithFrame:frame];
  if (self) {
    [self someInit];
    self.name = name;
  }
  return self;
}

#pragma mark - Secondary initializer
- (instancetype)initWithName:(NSString *)name {
//  self = [super initWithFrame:CGRectZero]; 不能调用父类的DI，得调用自己的DI
//  if (self) {
//    [self someInit];
//    self.name = name;
//  }
  return [self initWithFrame:CGRectZero andName:name];
}

// 没有归档需求可以不写
#pragma mark - Designated Initializer
- (instancetype)initWithCoder:(NSCoder *)coder {
  self = [super initWithCoder:coder];
  if (self) {
    self.name = [coder decodeObjectForKey:@"name"];
  }
  return self;
}
- (void)encodeWithCoder:(NSCoder *)coder {
  [super encodeWithCoder:coder];
  [coder encodeObject:self.name forKey:@"name"];
}

- (void)awakeFromNib {
  [super awakeFromNib];
  [self someInit];
}

- (void)someInit {
  self.name = @"";
}

@end
