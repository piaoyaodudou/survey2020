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
//#import "MOBlockViewController.h"
//#import "MOCat.h"
//#import "MOAnimal+Sleep.h"
#import "MOView.h"
#import "MOScrollView.h"

@interface MOHomeViewController ()
//<MOAnimalDelegate, MOAnimalSleepDelegate>
//@property (nonatomic, copy) NSString *food;
@end

@implementation MOHomeViewController {
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
//  UIButton *timerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//  [timerBtn setTitle:@"计时器" forState:UIControlStateNormal];
//  timerBtn.frame = CGRectMake(100, 400, 100, 60);
//  timerBtn.backgroundColor = [UIColor redColor];
//  [timerBtn addTarget:self action:@selector(clickTimerBtn) forControlEvents:UIControlEventTouchUpInside];
//  [self.view addSubview:timerBtn];
//
//  // Block
  UIButton *blockBtn = [UIButton buttonWithType:UIButtonTypeCustom];
  [blockBtn setTitle:@"Block" forState:UIControlStateNormal];
  blockBtn.frame = CGRectMake(100, 400, 100, 60);
  blockBtn.backgroundColor = [UIColor redColor];
  [blockBtn addTarget:self action:@selector(clickBlockBtn) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:blockBtn];

//  [self someMethod];
//  [self testProperty];
  
//  CGFloat num = 99.99;
//  NSInteger nums = num * 10;
//  NSString *str = [NSString stringWithFormat:@"%ld.%ld", nums/10, nums%10];
//  NSLog(@"%@", str); // 99.9

//  NSDecimalNumber *decNumber = [[NSDecimalNumber alloc] initWithFloat:99.0];
//  NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler
//                                     decimalNumberHandlerWithRoundingMode:NSRoundDown
//                                     scale:1
//                                     raiseOnExactness:NO
//                                     raiseOnOverflow:NO
//                                     raiseOnUnderflow:NO
//                                     raiseOnDivideByZero:YES];
//  NSDecimalNumber *yy = [decNumber decimalNumberByRoundingAccordingToBehavior:roundUp];
//  NSString *str = [NSString stringWithFormat:@"%@", yy];
//  NSLog(@"%@", str); // 99.9
//  NSLog(@"%@", yy); // 99.90000000000001
////  _lb.text = [NSString stringWithFormat:@"%@", yy]; // 99.9
//  [blockBtn setTitle:[NSString stringWithFormat:@"%@", yy] forState:UIControlStateNormal];

  MOView *supView = [[MOView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
  [self.view addSubview:supView];

  
  MOView *view = [[MOView alloc] init];
//  MOView *view = [[MOView alloc] initWithFrame:CGRectZero];
//  MOView *view = [[MOView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
  [supView addSubview:view];
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//    view.frame = CGRectMake(5, 0, 50, 50);
  });
  
//  MOScrollView *scroll = [[MOScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//  scroll.contentSize = CGSizeMake(0, self.view.frame.size.height * 3);
//  [self.view addSubview:scroll];
  
  
}

- (void)layoutSubviews {
  NSLog(@"layoutSubviews VC");
}

- (void)someMethod {

}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
   return ((toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) | (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft));
}

//- (void)clickTimerBtn {
//  [self.navigationController pushViewController:[MOTimerViewController new] animated:YES];
//}
- (void)clickBlockBtn {
//  [self.navigationController pushViewController:[MOBlockViewController new] animated:YES];
}
//@synthesize food;
//- (void)testProperty {
//  MOCat.price = @"1000";
//  MOCat *cat = [[MOCat alloc] init];
//  cat.name = @"momo";
//  cat.delegate = self;
//  [cat eat];
//
//  cat.sleepDelegate = self;
//  cat.place = @"床";
//  [cat sleep];
  
//  cat.age = 10;
//  NSLog(@"age %ld", (long)cat.age);
//}
//- (void)eat {
//  NSLog(@"eat %@", self.food);
//}
//- (void)sleep:(NSString *)place {
//  NSLog(@"sleep %@", place);
//}

@end
