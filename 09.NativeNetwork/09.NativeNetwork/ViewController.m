//
//  ViewController.m
//  09.NativeNetwork
//
//  Created by moxiaoyan on 2020/6/24.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // NSURLConnection iOS9被宣布弃用
  
  
  // 1. 通过NSURLSession创建task
  // 2. 所有类型的task都要调用resume方法才会开始进行请求.

  // NSURLSessionTask 抽象类
  // NSURLSessionDataTask
  // NSURLSessionUploadTask
  // NSURLSessionDownloadTask

//  [self get];
  [self post];
}

- (void)get {
  NSURLSession *session = [NSURLSession sharedSession];
  NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
  NSURLSessionTask *task = [session dataTaskWithURL:url
                                  completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (error != nil) {
      NSLog(@"error:%@", error);
    } else {
      NSLog(@"data:%@ \nresponse:%@", data, response);
    }
  }];
  [task resume];
}

- (void)post {
  NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
  // 比Get多了request
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
  request.HTTPMethod = @"POST";
  request.HTTPBody = [@"username=miki&pwd=123" dataUsingEncoding:NSUTF8StringEncoding];
  
  NSURLSession *session = [NSURLSession sharedSession];
  NSURLSessionTask *task = [session dataTaskWithRequest:request
                                      completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (error != nil) {
      NSLog(@"error:%@", error);
    } else {
      NSLog(@"data:%@ \nresponse:%@", data, response);
    }
  }];
  [task resume];
}




@end
