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

@implementation ViewController {
  UILabel *_lb;
}

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
  
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  btn.frame = CGRectMake(100, 300, 100, 60);
  btn.backgroundColor = [UIColor redColor];
  [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:btn];
  
  _lb = [[UILabel alloc] init];
  _lb.textColor = [UIColor blackColor];
  _lb.font = [UIFont systemFontOfSize:16];
  _lb.frame = CGRectMake(100, 500, 100, 60);
  [self.view addSubview:_lb];

  
  [self someMethod];

}


- (void)someMethod {

  CGFloat progress = 99.98;
  NSDecimalNumber *decNumber = [[NSDecimalNumber alloc] initWithFloat:progress];
  NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler
                                     decimalNumberHandlerWithRoundingMode:NSRoundDown
                                     scale:1 // 保留几位小数
                                     raiseOnExactness:NO
                                     raiseOnOverflow:NO
                                     raiseOnUnderflow:NO
                                     raiseOnDivideByZero:YES];
  NSDecimalNumber *yy = [decNumber decimalNumberByRoundingAccordingToBehavior:roundUp];
  NSString *str = [NSString stringWithFormat:@"%@", yy];
  NSLog(@"%@", str);
  NSLog(@"%@", yy);
  _lb.text = [NSString stringWithFormat:@"%@", yy];
  
}

- (void)clickBtn {
  [self.navigationController presentViewController:[[MOViewController alloc] initWithName:@""] animated:YES completion:nil];
}

@end
