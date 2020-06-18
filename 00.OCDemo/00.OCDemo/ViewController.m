//
//  ViewController.m
//  00.OCDemo
//
//  Created by moxiaoyan on 2020/6/18.
//  Copyright © 2020 moxiaohui. All rights reserved.
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
    NSLog(@"ViewController initWithCoder"); // ??
    
    [self someMethod];

  }
  return self;
}

- (void)someMethod {
  __block int i = 10;
  dispatch_async(dispatch_get_main_queue(), ^{
    NSLog(@"%d", i);
  });
  i = 20;
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