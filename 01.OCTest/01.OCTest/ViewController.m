//
//  ViewController.m
//  01.OCTest
//
//  Created by mobvoi on 2020/1/10.
//  Copyright © 2020 moxiaoyan. All rights reserved.
//

#import "ViewController.h"
#import "MOResponderTestView.h" // 测试响应链
#import "MOViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    NSLog(@"ViewController initWithNibName"); // ???
  }
  return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
  self = [super initWithCoder:coder];
  if (self) {
    NSLog(@"ViewController initWithCoder"); // ??/
  }
  return self;
}

- (instancetype)init {
  self = [super init];
  if (self) {
    NSLog(@"ViewController init"); // ??
    
    
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  MOResponderTestView *view = [[MOResponderTestView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
  view.backgroundColor = [UIColor grayColor];
  [self.view addSubview:view];
  
  self.name = @"莫小言";
  
  
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  btn.frame = CGRectMake(100, 300, 100, 60);
  btn.backgroundColor = [UIColor redColor];
  [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:btn];
}

- (void)clickBtn {
  [self.navigationController presentViewController:[[MOViewController alloc] initWithName:@""] animated:YES completion:nil];
}

@end
