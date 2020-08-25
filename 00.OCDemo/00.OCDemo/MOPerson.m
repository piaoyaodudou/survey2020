//
//  MOPerson.m
//  00.OCDemo
//
//  Created by 莫晓卉 on 2020/8/25.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import "MOPerson.h"

@implementation MOPerson {
  NSString* _name;
  NSString* _isName;
  NSString* name;
  NSString* isName;
}

//- (void)setName:(NSString *)name {
//  NSLog(@"%s", __func__);
//}

//+ (BOOL)accessInstanceVariablesDirectly {
//  return YES;
//}

//- (void)_setName:(NSString *)name {
//  NSLog(@"%s", __func__);
//}

//- (void)setIsName:(NSString *)name {
//  NSLog(@"%s", __func__);
//}

//- (NSString *)getName {
//  NSLog(@"%s", __func__);
//  return _name;
//}

//- (NSString *)name {
//  NSLog(@"%s", __func__);
//  return _name;
//}

//- (NSString *)isName {
//  NSLog(@"%s", __func__);
//  return _name;
//}
//
//- (NSString *)_name {
//  NSLog(@"%s", __func__);
//  return _name;
//}

- (NSArray *)countOfName {
  NSLog(@"%s", __func__);
  return [NSArray array];
}

+ (instancetype)personWithName:(NSString *)name number:(NSNumber *)number {
  return [[[self class] alloc] initWithName:name number:number];
}
- (instancetype)initWithName:(NSString *)name number:(NSNumber *)number {
  self = [super init];
  if (self) {
    self.name = name;
    self.number = number;
  }
  return self;
}


@end
