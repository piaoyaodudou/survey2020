//
//  ViewController.m
//  02.多线程
//
//  Created by mobvoi on 2020/1/15.
//  Copyright © 2020 moxiaoyan. All rights reserved.
//

#import "ViewController.h"
#import "MOGCD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [MOGCD shareInstance];

}


@end
