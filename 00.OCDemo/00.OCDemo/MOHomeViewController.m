//
//  MOHomeViewController.m
//  00.OCDemo
//
//  Created by 莫晓卉 on 2020/7/11.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import "MOHomeViewController.h"
#import "MOResponderTestView.h" // 测试响应链
#import "MOTimerViewController.h"

@interface MOHomeViewController ()

@end

@implementation MOHomeViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
  self = [super initWithCoder:coder];
  if (self) {
    // 默认自带的ViewController会执行这个初始化方法

  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  MOResponderTestView *view = [[MOResponderTestView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
  view.backgroundColor = [UIColor grayColor];
  [self.view addSubview:view];
  
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  [btn setTitle:@"计时器" forState:UIControlStateNormal];
  btn.frame = CGRectMake(100, 400, 100, 60);
  btn.backgroundColor = [UIColor redColor];
  [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:btn];

  [self someMethod];

}


- (void)someMethod {

}

- (void)clickBtn {
  [self.navigationController pushViewController:[MOTimerViewController new] animated:YES];
}
@end
