//
//  MOTimerViewController.m
//  00.OCDemo
//
//  Created by 莫晓卉 on 2020/7/11.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import "MOTimerViewController.h"
#import "NSTimer+MOBlock.h"
#import "YYWeakProxy.h"

@interface MOTimerViewController ()
@property (nonatomic, strong) NSTimer *timer1; // 持有只是为了在dealloc中释放
@property (nonatomic, strong) NSTimer *timer2;
@property (nonatomic, strong) NSTimer *timer3;
@property (nonatomic, strong) NSTimer *timer4;
@property (nonatomic, strong) NSTimer *timer5;
@property (nonatomic, strong) NSTimer *timer6;

@property (nonatomic, strong) NSTimer *timer7;
@property (nonatomic, strong) NSInvocation *invocation7;
@property (nonatomic, strong) NSTimer *timer8;
@property (nonatomic, strong) NSInvocation *invocation8;

@property (nonatomic, strong) dispatch_source_t gcdTimer;

@property (nonatomic, strong) NSTimer *timerFirst;
@property (nonatomic, strong) NSTimer *timerSecond;
@end

@implementation MOTimerViewController

- (void)dealloc {
  NSLog(@"MOViewController dealloc");
//  [self.timer1 invalidate];
//  [self.timer2 invalidate];
//  [self.timer3 invalidate];
//  [self.timer4 invalidate];
//  [self.timer5 invalidate];
//  [self.timer6 invalidate];
//  [self.timer7 invalidate];
//  [self.timer8 invalidate];
  [self.timerFirst invalidate];
  [self.timerSecond invalidate];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // http://xttxqjfg.cn/2019/02/25/NSTimer%E4%BD%BF%E7%94%A8%E8%A7%A3%E6%9E%90/
  // http://www.cocoachina.com/articles/24725
  // 所有的Timer都需要在dealloc里 invalidate 掉 (因为RunLoop强引用Timer的关系)
  // invalidate方法：会将Timer从RunLopp中移除；并释放Timer持有的资源(target、userInfo、Block)
  // invalidate方法调用必须在timer添加到的runloop所在的线程
  
  // 除了iOS10新出的3个代Block的方法，其他的都会造成内存泄露，导致持有者的dealloc不会执行
  // timer强引用了target, target又强引用了self，从而导致当前VC释放不了。

  // 虽说这里有个强引用环，但造成泄露的主要原因是：
  // RunLoop对Timer的强引用，导致Timer需要我们手动释放，释放最适宜的时机又是self的dealloc方法。
  // 所以我们必须要保证self的正常释放，因而最关键的强引用是target对self的这条！！！

  // scheduled 开头的都是默认register到当前RunLoop下的
  // timer 开头的需要自己指定RunLoop
  
//  [self.timer1 setFireDate:[NSDate distantFuture]]; // 暂停
//  [self.timer1 setFireDate:[NSDate date]]; // 恢复
  
//  self.timer1 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerOne) userInfo:nil repeats:YES];
//  self.timer2 = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//    NSLog(@"timer 2");
//  }]; // iOS 10
//
//  self.timer3 = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerThree) userInfo:nil repeats:YES];
//  self.timer4 = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//    NSLog(@"timer 4");
//  }]; // iOS 10
//  [[NSRunLoop currentRunLoop] addTimer:self.timer4 forMode:NSRunLoopCommonModes];
//
//  self.timer5 = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:2] interval:1 target:self selector:@selector(timerFive) userInfo:nil repeats:YES];
//  [[NSRunLoop currentRunLoop] addTimer:self.timer5 forMode:NSRunLoopCommonModes];
//
//  self.timer6 = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:2] interval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//    NSLog(@"timer 6");
//  }]; // iOS 10
//  [[NSRunLoop currentRunLoop] addTimer:self.timer6 forMode:NSRunLoopCommonModes];
//
//  NSMethodSignature *signature7 = [self methodSignatureForSelector:@selector(timerSeven:)];
//  self.invocation7 = [NSInvocation invocationWithMethodSignature:signature7]; // 必须持有
//  [self.invocation7 setSelector:@selector(timerSeven:)];
//  [self.invocation7 setTarget:self];
//  NSString *name7 = @"moxiaoyan7";
//  [self.invocation7 setArgument:&name7 atIndex:2]; // 前面有两个隐藏参数
//  self.timer7 = [NSTimer scheduledTimerWithTimeInterval:1 invocation:self.invocation7 repeats:YES];
//
//  NSMethodSignature *signature8 = [self methodSignatureForSelector:@selector(timerEight:)];
//  self.invocation8 = [NSInvocation invocationWithMethodSignature:signature8];
//  [self.invocation8 setSelector:@selector(timerEight:)];
//  [self.invocation8 setTarget:self];
//  NSString *name8 = @"moxiaoyan8";
//  [self.invocation8 setArgument:&name8 atIndex:2];
//  self.timer8 = [NSTimer timerWithTimeInterval:1 invocation:self.invocation8 repeats:YES];
//  [[NSRunLoop currentRunLoop] addTimer:self.timer8 forMode:NSRunLoopCommonModes];
  
  // GCD 定时器(不会被RunLoop强引用)
  // GCD 一次性定时器
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
    NSLog(@"GCD 一次性计时器");
//    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
//    [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
//    [runLoop run]; 还是不work
//    [self performSelector:@selector(timerThree) withObject:nil afterDelay:2];
    // 用onMainThread代替
    [self performSelectorOnMainThread:@selector(timerThree) withObject:nil waitUntilDone:2];
  });
    
  // GCD 重复性定时器
  self.gcdTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
  dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)2 * NSEC_PER_SEC);
  uint64_t duration = (uint64_t)(2.0 * NSEC_PER_SEC);
  // 参数：sourceTimer 开始时间 循环间隔 精确度(这里写的0.1s)
  dispatch_source_set_timer(self.gcdTimer, start, duration, 0.1 * NSEC_PER_SEC);
  __weak typeof(self) weakSelf = self;
  dispatch_source_set_event_handler(self.gcdTimer, ^{
    NSLog(@"GCD 重复性计时器");
    dispatch_suspend(weakSelf.gcdTimer); // 暂停
    sleep(1);
    dispatch_resume(weakSelf.gcdTimer); // 恢复
  });
  dispatch_resume(self.gcdTimer);
  // cancel 销毁，不可再使用
  //  dispatch_source_cancel(self.gcdTimer);
  
  // 解决方案：
  // 1、block方式添加Target-Action
  self.timerFirst = [NSTimer mo_scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
    NSLog(@"优化后的 first timer %@", timer.userInfo);
  }];
  
  // 2、代理类弱引用self + 消息转发
  YYWeakProxy *weakObj = [YYWeakProxy proxyWithTarget:self];
  self.timerSecond = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:weakObj
                                                    selector:@selector(timerSecond:)
                                                    userInfo:@{@"name": @"cool"}
                                                     repeats:YES];
}

- (void)timerOne {
  NSLog(@"timer 1 %@", [NSThread currentThread]);
}
- (void)timerThree {
  NSLog(@"timer 3 %@", [NSThread currentThread]);
}
- (void)timerFive {
  NSLog(@"timer 5");
}

- (void)timerSeven:(NSString *)name {
  NSLog(@"timer 7 %@", name);
}
- (void)timerEight:(NSString *)name {
  NSLog(@"timer 8 %@", name);
}

- (void)timerSecond:(NSDictionary *)userInfo {
  NSLog(@"timer second %@", userInfo);
}

@end
