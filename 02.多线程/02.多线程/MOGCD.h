//
//  MOGCD.h
//  02.多线程
//
//  Created by mobvoi on 2020/1/15.
//  Copyright © 2020 moxiaoyan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 一、获取并发队列：Concurrent
// 1. GCD默认提供全局并发队列
// DISPATCH_QUEUE_PRIORITY_HIGH 2                高
// DISPATCH_QUEUE_PRIORITY_DEFAULT 0             默认
// DISPATCH_QUEUE_PRIORITY_LOW (-2)              低
// DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN  后台
//  dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0); // (扩展参数：暂时用不上)

// 2. 创建
//  dispatch_queue_t queue2 = dispatch_queue_create("moxiaoyan", DISPATCH_QUEUE_CONCURRENT);

// 二、获取串行队列：Serial
// 1. 主队列：会放到主线程中执行
//  dispatch_queue_t mainQueue = dispatch_get_main_queue();
// 2. 创建：
//  dispatch_queue_t queue1 = dispatch_queue_create("moxiaoyan", DISPATCH_QUEUE_SERIAL);

@interface MOGCD : NSObject
+ (instancetype)shareInstance;
@end

NS_ASSUME_NONNULL_END
