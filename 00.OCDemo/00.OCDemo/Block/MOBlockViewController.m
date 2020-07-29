//
//  MOBlockViewController.m
//  00.OCDemo
//
//  Created by moxiaoyan on 2020/7/14.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import "MOBlockViewController.h"



@interface MOPerson : NSObject
@property (nonatomic, copy) NSString *name;
@end
@implementation MOPerson
@end

int globalCount = 0;

@interface MOBlockViewController ()
@property (nonatomic, weak) id delegate;
@end

@implementation MOBlockViewController

- (void)dealloc {
  NSLog(@"MOBlockViewController dealloc");
}



- (void)viewDidLoad {
  [super viewDidLoad];
  

  // 捕获变量
  // 1、全局变量、全局静态变量: 直接使用，不会改变block结构
  // 2、局部静态变量: 拷贝指针，在block结构体中强引用
  // 3、局部变量:
    // 3.1、基本数据类型对象: 拷贝值
    // 3.2、OC对象: 拷贝指针
    // 重新赋值: 需要 __block 修饰
    // __block 会创建一个 __Block_byref_***_0 的结构体，将变量用这个结构体包裹着，传入block中使用
  // Self的循环引用：捕获了self的指针，copy到block结构体中（强引用）
  [self someMethod];
}

- (void)someMethod {
//  static int lokalCount = 0; // 静态局部变量
//  int count = 0; // 局部变量
  
//  __block int blockCount = 0; // 局部变量 __block 修饰
  // __block 修饰后，会创建一个 __Block_byref_***_0 的结构体，将变量声明为这个结构体的对象
  // 将此对象的指针拷贝到 block的结构体 中使用
  
  // OC对象: 使用or修改 都不需要 __block 修饰
//  MOPerson *obj = [MOPerson new];

//  __block NSMutableArray *arr = [NSMutableArray array];
  // __block 修饰后，会创建一个 __Block_byref_***_0 的结构体，将变量声明为这个结构体的对象
  // 将此对象的指针拷贝到 block的结构体 中使用
  
  __weak typeof(self) weakSelf = self;
  
  
  void (^MyBlock)(void) = ^{
//    NSLog(@"%d", globalCount); // 结构不变，直接调用
//    NSLog(@"%d", lokalCount); // 拷贝指针到 block的结构体 中使用
//    NSLog(@"%d", count); // 拷贝值
//    NSLog(@"%d", blockCount); // 拷贝指针

    //    NSLog(@"%@", obj.name);
    NSLog(@"%@", weakSelf.delegate);
//    arr = [NSMutableArray array];
//    [arr addObject:@"1"];
//    NSLog(@"%@", arr);
    
  };
//  count = 1;
//  blockCount = 1;
//  obj.name = @"momo";
//  [MyBlock copy];
  NSLog(@"%@", [MyBlock class]);
}

@end
