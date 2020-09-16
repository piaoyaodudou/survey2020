//
//  ViewController.m
//  02.多线程
//
//  Created by mobvoi on 2020/1/15.
//  Copyright © 2020 moxiaoyan. All rights reserved.
//

#import "ViewController.h"
#import "MOGCD.h"
#import "MOOperationQueue.h"
#import "MONSThread.h"
#import <pthread.h>

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *devices;
@end

@implementation ViewController {
  dispatch_queue_t _queue;
  pthread_rwlock_t _rwLock;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // GCD：C，生命周期：自动管理
  // 优点：线程安全；跟block结合，代码简洁；更接近底层，高效；
  // 缺点：基于C实现
  
  // NSOperation：OC，生命周期：自动管理
  // 优点：线程安全；比GCD多了一些简单实用得功能(比如：优先顺序、结合queue使用可随时取消已经设定要执行得任务); 提高了代码的复用度
  // 缺点：基于GCD封装，更高级，抽象；更加面向对象；
  
  // NSThread：OC，生命周期：程序猿管理
  // 优点：比前两种更轻量级；可以睡眠和唤醒；简单易用可直接操作线程对象
  // 缺点：非线程安全，需要加锁，性能低；需要管理生命周期；
  // 底层是Pthread，基于C实现
  
  [MOGCD shareInstance];
//  [MOOperationQueue shareInstance];
//  [MONSThread shareInstance];

}
@end
