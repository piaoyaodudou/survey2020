//
//  main.m
//  02.多线程
//
//  Created by mobvoi on 2020/1/15.
//  Copyright © 2020 moxiaoyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
  NSString * appDelegateClassName;
  @autoreleasepool {
      // Setup code that might create autoreleased objects goes here.
      appDelegateClassName = NSStringFromClass([AppDelegate class]);
  }
  return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
