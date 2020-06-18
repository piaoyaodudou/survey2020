//
//  MOViewController.m
//  01.OCTest
//
//  Created by moxiaoyan on 2020/5/15.
//  Copyright © 2020 moxiaoyan. All rights reserved.
//

#import "MOViewController.h"

@interface MOViewController ()

@end

@implementation MOViewController

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

- (instancetype)initWithName:(NSString *)name {
  self = [super init];
  if (self) {
    NSLog(@"ViewController initWithName"); // ??/
  }
  return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
