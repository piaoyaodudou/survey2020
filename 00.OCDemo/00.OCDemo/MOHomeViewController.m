//
//  MOHomeViewController.m
//  00.OCDemo
//
//  Created by 莫晓卉 on 2020/7/11.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import "MOHomeViewController.h"
#import "MOResponderViewController.h"
#import "MOTimerViewController.h"
#import "MOBlockViewController.h"
#import "MOKVCViewController.h"
//#import "MOCat.h"
//#import "MOAnimal+Sleep.h"
#import "MOButton.h"
#import <objc/runtime.h>
#import "MOArrayDataSource.h"

@interface MOHomeViewController () <UITableViewDelegate>
//<MOAnimalDelegate, MOAnimalSleepDelegate>
@property (nonatomic, copy) NSString *food;
@property (nonatomic, strong) MOArrayDataSource *dataSource;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation MOHomeViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
  self = [super initWithCoder:coder];
  if (self) {
    // 默认自带的ViewController会执行这个初始化方法
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"OC-Demo";
  [self setupView];
  [self someMethod];
}

- (void)someMethod {
  
}

- (void)setupView {
  NSArray *section1 = @[[MOCellModel modelWithTitle:@"Responder" vcName:@"MOResponderViewController"],
                        [MOCellModel modelWithTitle:@"Timer Demo" vcName:@"MOTimerViewController"],
                        [MOCellModel modelWithTitle:@"Block Demo" vcName:@"MOBlockViewController"],
                        [MOCellModel modelWithTitle:@"KVC Demo" vcName:@"MOKVCViewController"]];
  NSArray *section2 = @[];
  NSArray *sections = @[section1, section2];
  
  self.dataSource = [[MOArrayDataSource alloc] initSections:sections cellIndentifier:@"UITableViewCell" configureCell:^(UITableViewCell * _Nonnull cell, id  _Nonnull model) {
    MOCellModel *m = (MOCellModel *)model;
    cell.textLabel.text = m.title;
  }];
  self.tableView.dataSource = self.dataSource;
  [self.view addSubview:self.tableView];
  [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.section == 0) {
    MOCellModel *model = [self.dataSource modelAtIndexPath:indexPath];
    UIViewController *vc = [[NSClassFromString(model.vcName) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
  } else {
    
  }
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)viewSafeAreaInsetsDidChange {
  [super viewSafeAreaInsetsDidChange];
  UIEdgeInsets insets = self.view.safeAreaInsets;
  CGRect bounds = [UIScreen mainScreen].bounds;
  self.tableView.frame = CGRectMake(insets.left, insets.top, bounds.size.width - insets.left - insets.right, bounds.size.height - insets.top - insets.bottom);
  [self.tableView reloadData];
}

- (UITableView *)tableView {
  if (!_tableView) {
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
  }
  _tableView.delegate = self;
  return _tableView;
}

@end
