//
//  ViewController.m
//  02.多线程
//
//  Created by mobvoi on 2020/1/15.
//  Copyright © 2020 moxiaoyan. All rights reserved.
//

#import "ViewController.h"
#import "MOGCD.h"
#import "MOOperationQueue.h"
#import "MONSThread.h"

@interface ViewController ()
@end

@implementation ViewController
- (void)viewDidLoad {
  [super viewDidLoad];
//  [MOGCD shareInstance];
//  [MOOperationQueue shareInstance];
  [MONSThread shareInstance];
}
@end
