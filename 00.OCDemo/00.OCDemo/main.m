//
//  main.m
//  00.OCDemo
//
//  Created by moxiaoyan on 2020/6/18.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface MyClass : NSObject

@end
@implementation MyClass
+ (id)myClass {
  return [[MyClass alloc] init];
}
@end

int main(int argc, char * argv[]) {
  NSString * appDelegateClassName;
  @autoreleasepool {
      // Setup code that might create autoreleased objects goes here.
//      appDelegateClassName = NSStringFromClass([AppDelegate class]);
//    id __strong obj = [MyClass myClass];
    __block NSMutableArray *arr = [NSMutableArray array];
      void (^MyBlock)(void) = ^{
        [arr addObject:@"1"];
      };
      MyBlock();
  }
  return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}





