//
//  MOPerson.m
//  00.OCDemo
//
//  Created by 莫晓卉 on 2020/8/25.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import "MOPerson.h"

@interface MOPerson()
@property (nonatomic, strong) NSArray *names;
@end

@implementation MOPerson {
//  NSString* _name;
//  NSString* _isName;
//  NSString* name;
//  NSString* isName;
}

#pragma mark - Getter
#pragma mark - 1. 简单访问器 (Simple accessor)
// 依次查找: getName、name、isName、_name
//- (NSString *)getName {
//  NSLog(@"%s", __func__);
//  return @"getName";
//}

//- (NSString *)name {
//  NSLog(@"%s", __func__);
//  return @"name";
//}

//- (NSString *)isName {
//  NSLog(@"%s", __func__);
//  return @"isName";
//}

//- (NSString *)_name {
//  NSLog(@"%s", __func__);
//  return @"_name";
//}

#pragma mark - 2. 数组访问器 (Array accessor)
// 创建一个Array，遍历 index: 0->countOfName，调用 objectInNameAtIndex:index, 并把结果存入Array中
//- (NSUInteger)countOfName { // 调用两次: why?
//  NSLog(@"%s", __func__);
//  return self.names.count;
//}

//- (id)objectInNameAtIndex:(NSUInteger)index {
//  NSLog(@"%s", __func__);
//  return self.names[index];
//}

#pragma mark - 3. 集合访问器 (Collection accessor)
//- (id)enumeratorOfName { // 返回的是一个 NSEnumerator 类型的对象
//  NSLog(@"%s", __func__);
//  return [self.names reverseObjectEnumerator];
//}
// set里的member方法是：在set里用 isEqual: 方法查找，euqal的对象返回set里的对象，否则返回nil
//- (id)memberOfName:(id)object {
//  NSLog(@"%s", __func__);
//  NSUInteger index = [self.names indexOfObject:object];
//  return index ? [self.names objectAtIndex:index] : nil;
//  // 因为这个方法的log没有输出，所以我感觉只要有这个方法就行，并不需要实现什么
//  // 所以我试了一下，这里直接 return nil 也可以
//  return nil;
//}

//+ (BOOL)accessInstanceVariablesDirectly {
//  return YES;
//}

#pragma mark - Setter
// 依次查找: setName、_setName、setIsName
//- (void)setName:(NSString *)name {
//  NSLog(@"%s", __func__);
//}

//- (void)_setName:(NSString *)name {
//  NSLog(@"%s", __func__);
//}

//- (void)setIsName:(NSString *)name {
//  NSLog(@"%s", __func__);
//}

- (instancetype)init {
  self = [super init];
  if (self) {
    self.names = @[@"mo1", @"mo2", @"mo3"];
//    _name = @"_name";
//    _isName = @"_isName";
//    name = @"name";
//    isName = @"isName";
  }
  return self;
}
+ (instancetype)personWithName:(NSString *)name {
  return [[[self class] alloc] initWithName:name];
}
- (instancetype)initWithName:(NSString *)name {
  self = [super init];
  if (self) {
//    self.name = name;
  }
  return self;
}

- (id)valueForUndefinedKey:(NSString *)key {
  NSLog(@"Error: valueForUndefinedKey: %@", key);
  return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
  NSLog(@"Error: setValue:%@ forUndefinedKey: %@", value, key);
}

//- (BOOL)validateName:(id *)name error:(NSError **)error {
//  NSLog(@"%s", __func__);
//  return YES;
//}

@end
