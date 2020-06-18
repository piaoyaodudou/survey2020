//
//  ViewController.m
//  08.Locks
//
//  Created by moxiaoyan on 2020/6/18.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>
#import <os/lock.h>
#import <libkern/OSAtomic.h>

@interface ViewController ()

@property (nonatomic, strong) NSLock *lock;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, assign) pthread_mutex_t pthread;
@property (nonatomic, assign) os_unfair_lock_t unfairLock;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // 递归锁：同一个线程可以加锁N次锁, 不会引发死锁
  
//  [self synchronized];  // 1. @synchronized
//  [self NSLockDemo];    // 2. NSLock 互斥锁
  [self pthreadMutex];  // 3. pthread_mutex
//  [self osUnfairLock];    // 4. os_unfair_lock 互斥锁（OSSpinLock 已废弃）
//
//  [self deadLock];      // 死锁
//  [self recursiveLock]; // 5. NSRecursiveLock 递归锁
//  [self pthreadMutexSupportRecursive]; // pthread_mutex 也可以支持递归，需要设置PTHREAD_MUTEX_RECURSIVE
//
//  [self condition]; // 6. condition
//  [self semaphore];  // 7. dispatch_semaphore 信号量
}

#pragma mark - synchronized
- (void)synchronized {
  NSArray *items = @[@"1", @"2", @"3"];
  self.items = [[NSMutableArray alloc] init];
  for (int i = 0; i < items.count; i++) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
      @synchronized (self.items) { // 加锁
        sleep(items.count - i);
        [self.items addObject:items[i]];
        NSLog(@"%@", self.items);
      }
    });
  }
}

#pragma mark - NSLock 互斥锁
- (void)NSLockDemo {
  self.lock = [[NSLock alloc] init];
  self.lock.name = @"itemsLock";

  NSArray *items = @[@"1", @"2", @"3"];
  self.items = [[NSMutableArray alloc] init];
  for (int i = 0; i < items.count; i++) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
      [self.lock lock]; // 加锁
      sleep(items.count - i);
      [self.items addObject:items[i]];
      NSLog(@"%@", self.items);
      [self.lock unlock]; // 解锁
      
//      if ([self.lock tryLock]) { // ???
//        sleep(items.count - i);
//        [self.items addObject:item];
//        NSLog(@"%@", self.items);
//        [self.lock unlock];
//      }
    });
  }
}

#pragma mark - pthreadMutex
- (void)pthreadMutex {
  // 需要：#import <pthread.h>
  pthread_mutex_init(&_pthread, NULL); // _pthread 不能是局部变量!!
  
  NSArray *items = @[@"1", @"2", @"3"];
  self.items = [[NSMutableArray alloc] init];
  for (int i = 0; i < items.count; i++) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
      pthread_mutex_lock(&_pthread); // 加锁
      sleep(items.count - i);
      [self.items addObject:items[i]];
      NSLog(@"%@", self.items);
      pthread_mutex_unlock(&_pthread); // 解锁
    });
  }
  sleep(2);
  int lockResult = pthread_mutex_trylock(&_pthread);
  if (lockResult == 0) { // 加锁成功是0, 否则错误码
    NSLog(@"lock");
    pthread_mutex_unlock(&_pthread);
  } else {
    NSLog(@"lock error:%i", lockResult);
    usleep(4); // 失败后的重试机制？？？
  }
  
//  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//    pthread_rwlock_(&_pthread); // 加锁
//    sleep(items.count - i);
//    [self.items addObject:items[i]];
//    NSLog(@"%@", self.items);
//    pthread_mutex_unlock(&_pthread); // 解锁
//  });
}

#pragma mark - os_unfair_lock 互斥锁 iOS10+
- (void)osUnfairLock {
  // 需要: #import <os/lock.h>
  _unfairLock = &(OS_UNFAIR_LOCK_INIT);
  NSArray *items = @[@"1", @"2", @"3"];
  self.items = [[NSMutableArray alloc] init];
  
//  for (int i = 0; i < items.count; i++) {
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//      os_unfair_lock_lock(_unfairLock); // 加锁
//      sleep(items.count - i);
//      [self.items addObject:items[i]];
//      NSLog(@"%@", self.items);
//      os_unfair_lock_unlock(_unfairLock); // 解锁
//      // TODO 会crash ？？？？
//    });
//  }
  
  // OSSpinLock iOS10+ 已废弃
//  __block OSSpinLock oslock = OS_SPINLOCK_INIT;
//  for (int i = 0; i < items.count; i++) {
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//      OSSpinLockLock(&oslock); // 加锁
//      sleep(items.count - i);
//      [self.items addObject:items[i]];
//      NSLog(@"%@", self.items);
//      OSSpinLockUnlock(&oslock); // 解锁
//    });
//  }
}

#pragma mark - 递归死锁
- (void)deadLock {
  NSLock *lock = [[NSLock alloc] init];
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    static void (^RecursiveMethod)(int);
    RecursiveMethod = ^(int value) {
      [lock lock];
      if (value > 0) {
        NSLog(@"加锁 %d", value);
        sleep(2);
        RecursiveMethod(value - 1); // 解锁之前又加想锁, 需要等待锁的解除，
      }
      NSLog(@"解锁 %d", value);
      [lock unlock];
    };
    RecursiveMethod(5);
  });
}

#pragma mark - NSRecursiveLock 递归锁
- (void)recursiveLock {
  NSRecursiveLock *lock = [[NSRecursiveLock alloc] init];
  
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    static void (^RecursiveMethod)(int);
    RecursiveMethod = ^(int value) {
      NSLog(@"加锁: %d", value);
      [lock lock]; // 加锁
      if (value < 5) {
        sleep(2);
        RecursiveMethod(++value); // 解锁之前又加想锁, 需要等待锁的解除，
      }
      NSLog(@"解锁: %d", value);
      [lock unlock]; // 解锁
    };
    RecursiveMethod(1);
    NSLog(@"finish");
  });
}

#pragma mark - pthread_mutex 支持递归
- (void)pthreadMutexSupportRecursive {
  pthread_mutex_t lock;
  pthread_mutexattr_t attr;
  pthread_mutexattr_init(&attr);
  pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
  pthread_mutex_init(&lock, &attr);
  pthread_mutexattr_destroy(&attr);
  
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    static void (^RecursiveMethod)(int);
    RecursiveMethod = ^(int value) {
      NSLog(@"加锁: %d", value);
      pthread_mutex_lock(&lock); // 加锁
      if (value < 5) {
        sleep(2);
        RecursiveMethod(++value); // 解锁之前又加想锁, 需要等待锁的解除，
      }
      NSLog(@"解锁: %d", value);
      pthread_mutex_unlock(&lock); // 解锁
    };
    RecursiveMethod(1);
    NSLog(@"finish");
  });
}

#pragma mark - condition 条件锁
- (void)condition {
  NSCondition *lock = [[NSCondition alloc] init];
//  //Son 线程
//  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//    [lock lock];
//    while (No Money) {
//      [lock wait];
//    }
//    NSLog(@"The money has been used up.");
//    [lock unlock];
//  });
//
//  //Father线程
//  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//    [lock lock];
//    NSLog(@"Work hard to make money.");
//    [lock signal];
//    [lock unlock];
//  });
}

#pragma mark - 信号量
- (void)semaphore {
  dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
  NSArray *items = @[@"1", @"2", @"3"];
  self.items = [[NSMutableArray alloc] init];
  for (int i = 0; i < items.count; i++) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
      dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER); // 加锁
      sleep(items.count - i);
      [self.items addObject:items[i]];
      NSLog(@"%@", self.items);
      dispatch_semaphore_signal(semaphore); // 解锁
    });
  }
}

@end
