//
//  MONSThread.m
//  02.多线程
//
//  Created by moxiaoyan on 2020/1/16.
//  Copyright © 2020 moxiaoyan. All rights reserved.
//

#import "MONSThread.h"

@interface MONSThread()
@property (nonatomic, assign) NSInteger totalTicketCount;
@end

@implementation MONSThread {
  NSThread *_thread1;
  NSThread *_thread2;
  NSThread *_thread3;
}

+ (instancetype)shareInstance {
  static MONSThread *instance = nil;
  static dispatch_once_t oneToken;
  dispatch_once(&oneToken, ^{
    instance = [[MONSThread alloc] init];
  });
  return instance;
}
- (instancetype)init {
  self = [super init];
  if (self) {
    // 说明
//    [self explain];
    
    // 使用
    // 例子：
//    [self MultiWindowTicket]; // 多窗口买票
    
    // afterDelay在子线程中未执行
    [self afterDelayNowork];
  }
  return self;
}

#pragma mark - 多窗口买票
- (void)MultiWindowTicket {
  self.totalTicketCount = 8;
  _thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
  _thread1.name = @"窗口1";
  _thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
  _thread2.name = @"窗口2";
  _thread3 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
  _thread3.name = @"窗口3";
  [_thread1 start];
  [_thread2 start];
  [_thread3 start];
}

- (void)saleTicket {
  while (YES) { // 模拟还有票会持续`-1`的操作
//    @synchronized (self) { // 互斥锁：swift 用 objc_sync_enter(self) 和 objc_sync_exit(self)
      if (self.totalTicketCount > 0) {
        self.totalTicketCount--;
        NSLog(@"买了一张，还剩：%ld %@", (long)self.totalTicketCount, [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.5];
      } else {
        NSLog(@"票买完了 %@", [NSThread currentThread]);
        break;
      }
//    }
  }
}


- (void)explain {
  // NSThread 是iOS中轻量级得多线程，一个NSThread对象对应一条线程

  // 一些类方法：
//  [NSThread mainThread]; // 获取主线程
//  [NSThread currentThread]; // 获取当前线程
  // 阻塞当前线程，设置休眠时间，两种方式实现：
//  [NSThread sleepForTimeInterval:3];
//  [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];
//  [NSThread exit]; // 立即终止主线程之外的所有线程(包括正在执行任务的)
  // 注意：需要在掌控所有线程状态的情况下调用此方法，否则可能会导致内存问题。
  // threadPriority相关的都已禁用，改用qualityOfService(枚举)代替
//  [NSThread threadPriority]; // 获取当前线程优先级
//  [NSThread setThreadPriority:0.5]; // 设置优先级：0.0~1.0；1.0优先级最高
  
  // 创建方式
  // 方法1：alloc init创建，但是需要手动开启
  NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(network:) object:@{@"name":@"moxiaohui"}];
  [thread start];

  [thread setName:@"moxiaoyan"]; // 线程名称
  thread.qualityOfService = NSQualityOfServiceUserInteractive;
  //  NSQualityOfServiceUserInteractive = 0x21, // 最高优先级, 用于处理 UI 相关的任务
  //  NSQualityOfServiceUserInitiated = 0x19, // 次高优先级, 用于执行需要立即返回的任务
  //  NSQualityOfServiceUtility = 0x11, // 普通优先级，主要用于不需要立即返回的任务
  //  NSQualityOfServiceBackground = 0x09, // 后台优先级，用于处理一些用户不会感知的任务
  //  NSQualityOfServiceDefault = -1 // 默认优先级，当没有设置优先级的时候，线程默认优先级
  thread.stackSize = 8192; // 更改堆栈的大小: 必须 是4KB(1024)的倍数 && 启动线程之前设置 (创建线程是会有开销的)
  NSUInteger size = thread.stackSize / 1024; // 所占内存大小
  [thread cancel]; // 不会马上退出，做了需要退出的标记
  [thread isMainThread];  // 是否是主线程
  [thread isFinished];  // 是否已经完成
  [thread isCancelled]; // 是否已经取消
  [thread isExecuting]; // 是否正在执行中
  
  // 方法2：初始化一个子线程，特点：自动开启，是类方法
//  @autoreleasepool {
//    [NSThread detachNewThreadSelector:@selector(network:) toTarget:self withObject:@{@"name":@"moxiaohui"}];
//  }
  // 方法3：隐式创建
  // 子线程中执行：(耗时操作)
  [self performSelectorInBackground:@selector(network:) withObject:@{@"name":@"moxiaohui"}];
  // 主线程中执行：(执行更新UI之类得操作)
//  [self performSelectorOnMainThread:@selector(complete) withObject:nil waitUntilDone:YES];
  // 指定线程中执行
//  [self performSelector:@selector(network:) onThread:[NSThread mainThread] withObject:@{@"name":@"moxiaohui"} waitUntilDone:YES];

  
  // 当前线程中执行
//  [self performSelector:@selector(network:) withObject:@{@"name":@"moxiaohui"}];
//  [self performSelector:@selector(network:) withObject:@{@"name":@"moxiaoyan"} withObject:@{@"name":@"moxiaohui"}];
//  [self performSelector:@selector(afterDelay:) withObject:@{@"name":@"moxiaoyan"} afterDelay:5]; // 5s后执行
  // cancel 某一个方法
//  [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(afterDelay:) object:@{@"name":@"moxiaoyan"}];
  // cancel 当前对象所有perform方法
//  [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

- (void)afterDelay:(NSDictionary *)info {
  NSLog(@"afterDelay info:%@", info);
}

- (void)network:(NSDictionary *)info {
  NSLog(@"执行 %@", [NSThread currentThread]);
  NSLog(@"info: %@", info);
  sleep(2);
  NSLog(@"完成");
}

- (void)afterDelayNowork {
  NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
  [thread start];
}
- (void)run {
  [self performSelector:@selector(complete) withObject:nil afterDelay:2];
  // 子线程不会自动创建RunLoop，导致定时器没有工作
  // 在子线程里启动runloop
  NSRunLoop *runLoop = [NSRunLoop currentRunLoop]; // 捕获取就不会主动创建
  [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
  [runLoop run];
}
- (void)complete {
  NSLog(@"Update UI");
}

@end
