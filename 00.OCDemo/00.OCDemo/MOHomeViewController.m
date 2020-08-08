//
//  MOHomeViewController.m
//  00.OCDemo
//
//  Created by 莫晓卉 on 2020/7/11.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import "MOHomeViewController.h"
//#import "MOResponderTestView.h" // 测试响应链
//#import "MOTimerViewController.h"
#import "MOBlockViewController.h"
//#import "MOCat.h"
//#import "MOAnimal+Sleep.h"
#import "MOView.h"
#import "MOButton.h"


@interface MOHomeViewController ()
//<MOAnimalDelegate, MOAnimalSleepDelegate>
//@property (nonatomic, copy) NSString *food;
@end

@implementation MOHomeViewController {
//  NSString *_indentify;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
  self = [super initWithCoder:coder];
  if (self) {
    
    // 默认自带的ViewController会执行这个初始化方法
  }
  return self;
}



- (void)viewDidLoad {
  [super viewDidLoad];
  // 响应者
//  MOResponderTestView *view = [[MOResponderTestView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
//  view.backgroundColor = [UIColor grayColor];
//  [self.view addSubview:view];
  // 计时器
  UIButton *timerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
  [timerBtn setTitle:@"计时器" forState:UIControlStateNormal];
  timerBtn.frame = CGRectMake(100, 300, 100, 60);
  timerBtn.backgroundColor = [UIColor redColor];
  [timerBtn addTarget:self action:@selector(clickTimerBtn) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:timerBtn];

  // Block
  MOButton *blockBtn = [MOButton buttonWithType:UIButtonTypeCustom];
  [blockBtn setTitle:@"Block" forState:UIControlStateNormal];
  blockBtn.frame = CGRectMake(100, 400, 100, 100);
  blockBtn.backgroundColor = [UIColor redColor];
  [blockBtn addTarget:self action:@selector(clickBlockBtn) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:blockBtn];

//  [self someMethod];

}



- (void)someMethod {
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
   return ((toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) | (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft));
}

- (void)clickTimerBtn {
//  [self.navigationController pushViewController:[MOTimerViewController new] animated:YES];
  [[NSNotificationCenter defaultCenter] postNotificationName:@"moxiaoyan" object:nil userInfo:nil];
}
- (void)clickBlockBtn {
  [self.navigationController pushViewController:[MOBlockViewController new] animated:YES];
}



@end
