//
//  MOResponderViewController.m
//  00.OCDemo
//
//  Created by moxiaoyan on 2020/8/26.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import "MOResponderViewController.h"
#import "MOResponderTestView.h" // 测试响应链

@interface MOResponderViewController ()

@end

@implementation MOResponderViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // 响应者
  MOResponderTestView *view = [[MOResponderTestView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
  view.backgroundColor = [UIColor grayColor];
  [self.view addSubview:view];
  
}


@end
