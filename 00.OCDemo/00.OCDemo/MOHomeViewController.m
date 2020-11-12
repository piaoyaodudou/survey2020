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
#import "MOButton.h"
#import "MOPerson.h"
#import <objc/runtime.h>
#import "MOArrayDataSource.h"

@interface Rectangle : NSObject <NSCoding>
// 属性声明为只读，外界就无法设置Rectangle对象的属性了，只能通过初始化方法设置
@property (nonatomic, assign, readonly) float width;
@property (nonatomic, assign, readonly) float height;
- (instancetype)initWithWidth:(float)width height:(float)height NS_DESIGNATED_INITIALIZER;
@end
@implementation Rectangle
#pragma mark - Designated Initializer
- (instancetype)initWithWidth:(float)width height:(float)height {
  self = [super init];
  if (self) {
    _width = width;
    _height = height;
  }
  return self;
}
// 如果有人用父类的init方法来创建Rectangle呢？...(并不是我们想要的)
// 所以类继承时：如果子类的全能初始化方法与父类的名称不同，那么总应覆写父类的全能初始化方法
#pragma mark - override super Designated Initializer !!!
- (instancetype)init {
  return [self initWithWidth:5.0 height:5.0];
}
#pragma mark - Designated Initializer
- (instancetype)initWithCoder:(NSCoder *)coder {
  self = [super initWithCoder:coder]; // 调用父类相关DI
  if (self) { // 再执行本类相关任务
    _width = [coder decodeFloatForKey:@"width"];
    _height = [coder decodeFloatForKey:@"height"];
  }
  // 这样写出来的类就完全遵守了NSCoding协议(fully NSCoding compliant)
  return self;
}
@end

@interface Square : Rectangle
@property (nonatomic, copy) NSString *name;
- (instancetype)initWithDimension:(float)dimension __attribute__((objc_designated_initializer)); // Designated Initializer
- (instancetype)initWithName:(NSString *)name; // Secondary initializer
@end
@implementation Square
#pragma mark - Designated Initializer
- (instancetype)initWithDimension:(float)dimension {
  return [super initWithWidth:dimension height:dimension];
}
#pragma mark - override super Designated Initializer !!!
- (instancetype)initWithWidth:(float)width height:(float)height {
  float dimension = MAX(width, height);
  return [self initWithDimension:dimension];
}

#pragma mark - override super Designated Initializer !!!
- (instancetype)init {
  return [self initWithDimension:5.0];
}
#pragma mark - Designated Initializer
- (instancetype)initWithCoder:(NSCoder *)coder {
  self = [super initWithCoder:coder];
  // 如果没有调用父类的同名方法，而是 自己的初始化方法/超类的其他初始化方法
  // 那么Rectangle类的initWithCoder:就没机会执行了(就无法将_width和_height这俩实例变量解码了)
  if (self) {
    // Square's specific initializer
  }
  return self;
}
#pragma mark - Secondary initializer
- (instancetype)initWithName:(NSString *)name {
//  self = [super init]; // 不能调用父类的DI，得调用自己的DI !!!
  self = [self initWithDimension:5.0];
  if (self) {
    _name = name;
  }
  return self;
}
@end


@interface MOHomeViewController () <UITableViewDelegate>
//<MOAnimalDelegate, MOAnimalSleepDelegate>
@property (nonatomic, copy) NSString *food;
@property (nonatomic, strong) MOArrayDataSource *dataSource;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation MOHomeViewController

#pragma mark - Designated Initializer
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  // 仅包含了xib里设置的数据，在初始化后会调用awakeFromNib 方法，我们需要把额外初始化动作写在这里
}
- (void)awakeFromNib {
  [super awakeFromNib];
  [self someInit];
}
- (void)someInit {
  self.name = @"";
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
  self.title = @"OC-Demo";
//  [self setupView];
  [self someMethod];
}

- (void)someMethod {
  MOPerson *p = [[MOPerson alloc] init];
  MOButton *b = [[MOButton alloc] init];
}

- (void)method:(NSMutableArray *)arr {
  [arr addObject:@3];
  arr = nil;
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
