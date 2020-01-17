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

@implementation MONSThread

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
    [self MultiWindowTicket]; // 多窗口买票
    
    
  }
  return self;
}

#pragma mark - 多窗口买票
- (void)MultiWindowTicket {
  self.totalTicketCount = 20;
  NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
  thread1.name = @"窗口1";
  NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
  thread2.name = @"窗口2";
  NSThread *thread3 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
  thread3.name = @"窗口3";

  [thread1 start];
  [thread2 start];
  [thread3 start];
}

- (void)saleTicket {
  while (YES) {
    // swift 用 objc_sync_enter(self) 和 objc_sync_exit(self)
//    @synchronized (self) {
      NSInteger currentCount = self.totalTicketCount;
      if (self.totalTicketCount > 0) {
        self.totalTicketCount = currentCount - 1;
        NSLog(@"买了一张，还剩：%ld %@", (long)self.totalTicketCount, [NSThread currentThread]);
      } else {
        NSLog(@"票买完了");
        break;
      }
//    }
  }
}


- (void)explain {
  // NSThread 是iOS中轻量级得多线程，一个NSThread对象对应一条线程
  // 优点：操作简单
  // 缺点：性能低，效率不高
  
  // 创建方式
  // 方法1：alloc init创建，但是需要手动开启
  NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(network:) object:@{@"name":@"moxiaohui"}];
  [thread setName:@"moxiaoyan"]; // 线程名称
//    thread.threadPriority = 1; // 线程优先级：0.1~1.0之间，默认0.5
  // 实际上threadPriority已经过时了，需要使用qualityOfService替代。
  thread.qualityOfService = NSQualityOfServiceUserInteractive;
  thread.stackSize = 4096; // 更改堆栈的大小: 必须 是4KB的倍数 && 启动线程之前设置 (创建线程是会有开销的)
  [thread start];
  
  // 方法2：初始化一个子线程，特点：自动开启，是类方法
  @autoreleasepool {
    [NSThread detachNewThreadSelector:@selector(network:) toTarget:self withObject:@{@"name":@"moxiaohui"}];
  }
}

- (void)network:(NSDictionary *)info {
  NSLog(@"%@", [NSThread currentThread]);
  NSLog(@"info: %@", info);
  sleep(2); // 模拟耗时操作
  [[NSThread currentThread] cancel];
}

@end
