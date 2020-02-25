//
//  ViewController.m
//  04.Runtime
//
//  Created by 莫晓卉 on 2020/2/23.
//  Copyright © 2020 moxiaoyan. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+Placeholder.h"
//#import "UIScrollView+Swizzling.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
//  self.tableView.ifNeedCheckEmpty = YES;
  __weak typeof(self) weakSelf = self;
  [self.tableView setReloadBlock:^{
    [weakSelf reloadData];
  }];
  [self.view addSubview:self.tableView];
  [self reloadData];
}

- (void)reloadData {
//  self.tableView.ifNeedCheckEmpty = YES;
  self.tableView.state = MOPlaceholderLoadingState;
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    self.tableView.state = MOPlaceholderNoNetworkState;
    [self.tableView reloadData];
  });
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *indetify = @"UITableViewCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indetify forIndexPath:indexPath];
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indetify];
  }
  cell.textLabel.text = [NSString stringWithFormat:@"%@", indexPath];
  return cell;
}

@end
