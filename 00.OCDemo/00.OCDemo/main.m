//
//  main.m
//  00.OCDemo
//
//  Created by moxiaoyan on 2020/6/18.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AppDelegate.h"

static NSString *name = @"momo";

int main(int argc, char * argv[]) {
  NSString * appDelegateClassName;
  @autoreleasepool {
      // Setup code that might create autoreleased objects goes here.
      appDelegateClassName = NSStringFromClass([AppDelegate class]);
//    int a = 1;
//    NSObject *obj = [[NSObject alloc] init];
//    static NSString *indentify = @"mo";
//    __block int a = 1;
    NSMutableString *str = [NSMutableString stringWithString:@"mo"];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:@[@1, @2]];
    void(^aBlock)(void) = ^{
//      NSLog(@"Hello world"); // 1. 未捕获变量
//      NSLog(@"%d", a);  // 2. 基本数据类型
//      NSLog(@"%@", obj); // 3. alloc对象
//      NSLog(@"%@", indentify); // 4. 静态局部变量
//      NSLog(@"%d", ++a); // 5. __block对象
      str.string = @"moxiaoyan";
//      str = [NSMutableString stringWithString:@"moxiaoyan"];
      [arr addObject:@3];
//      arr = [NSMutableArray arrayWithArray:@[@1, @2, @3]];
    };
//    a++;
    aBlock();
  }
  return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}





