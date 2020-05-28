//
//  AppDelegate.m
//  01.OCTest
//
//  Created by mobvoi on 2020/1/10.
//  Copyright © 2020 moxiaoyan. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
  NSLog(@"openURL:%@ %@", url, options);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  return YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}
- (void)applicationDidEnterBackground:(UIApplication *)application  {
}
- (void)applicationWillResignActive:(UIApplication *)application {
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
}
- (void)applicationDidFinishLaunching:(UIApplication *)application {
}
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
  NSLog(@"applicationDidReceiveMemoryWarning");
  // 收到内存警告时调用
}
- (void)applicationWillTerminate:(UIApplication *)application {
  NSLog(@"applicationWillTerminate");
  // 将要被完全终止并从内存中清除，大约5s的时间
  // 执行清理任务：释放共享资源、保存用户数据、使计时器无效...
  // iOS3之前/不支持后台执行 的程序，当用户退出应用时就会调用此方法
  // 支持后台的程序，在后台运行时被系统的终止会调用此方法
  // 在用此方法后，应用程序还会发布一个`willTerminateNotification`的通知，以便给感兴趣的对象一个响应转换的机会
}

#pragma mark - UISceneSession lifecycle
- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
  // Called when a new scene session is being created.
  // Use this method to select a configuration to create the new scene with.
  return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
  // Called when the user discards a scene session.
  // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
  // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
