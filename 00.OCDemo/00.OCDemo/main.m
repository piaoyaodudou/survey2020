//
//  main.m
//  00.OCDemo
//
//  Created by moxiaoyan on 2020/6/18.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
  NSString * appDelegateClassName;
  @autoreleasepool {
      // Setup code that might create autoreleased objects goes here.
      appDelegateClassName = NSStringFromClass([AppDelegate class]);
//    
//    __block NSString *str = @"123";
//    NSLog(@"%p", str); // 如: 0x7ffeeeba2cc0
//    void(^block)(void) = ^{
//      NSLog(@"%p", str); // 如: 0x7ffeeeba2cc0
//    };
//  //    str = @"345";
//    NSLog(@"%p", str); // 如: 0x7ffeeeba2cc0
//    block();
  }
  return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}





