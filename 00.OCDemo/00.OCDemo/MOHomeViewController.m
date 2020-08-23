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
#import "MOBlockViewController.h"
//#import "MOCat.h"
//#import "MOAnimal+Sleep.h"
#import "MOView.h"
#import "MOButton.h"
#import <objc/runtime.h>

typedef struct {
  float x, y, z;
} ThreeFloats;

@interface MOHomeViewController ()
//<MOAnimalDelegate, MOAnimalSleepDelegate>
@property (nonatomic, copy) NSString *food;
@property (nonatomic, strong) NSMutableArray *ps;
@property (nonatomic, assign) ThreeFloats threeFloats;
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

  // TODO change tableView
  // 响应者
//  MOResponderTestView *view = [[MOResponderTestView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
//  view.backgroundColor = [UIColor grayColor];
//  [self.view addSubview:view];
  // 计时器
  UIButton *timerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
  [timerBtn setTitle:@"计时器" forState:UIControlStateNormal];
  timerBtn.frame = CGRectMake(100, 300, 100, 60);
  timerBtn.backgroundColor = [UIColor redColor];
  [timerBtn addTarget:self action:@selector(clickTimerBtn) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:timerBtn];

  // Block
  MOButton *blockBtn = [MOButton buttonWithType:UIButtonTypeCustom];
  [blockBtn setTitle:@"Block" forState:UIControlStateNormal];
  blockBtn.frame = CGRectMake(100, 400, 100, 100);
  blockBtn.backgroundColor = [UIColor redColor];
  [blockBtn addTarget:self action:@selector(clickBlockBtn) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:blockBtn];

  [self someMethod];
}

- (void)someMethod {
  // Key Value Coding
  // get
  // valueForKey: 传入NSString属性的名字。
  // valueForKeyPath: 属性的路径，xx.xx
  // valueForUndefinedKey 默认实现是抛出异常，可重写这个函数做错误处理
  
  // set
  // setValue:forKey:
  // setValue:forKeyPath:
  // setValue:forUnderfinedKey:
  // setNilValueForKey: 对非类对象属性设置nil时调用，默认抛出异常。

//  NSArray *arrStr = @[@"english", @"franch", @"chinese"];
//  NSLog(@"%@", [arrStr valueForKey:@"capitalizedString"]);
//  NSLog(@"%@", [arrStr valueForKey:@"length"]);
  
  MOPerson *p1 = [MOPerson personWithName:@"lili" number:@(5)];
  
  MOPerson *p2 = [MOPerson personWithName:@"cici" number:@(9)];
  MOPerson *p3 = [MOPerson personWithName:@"kiki" number:@(8)];
  self.ps = [@[p1, p2, p3] mutableCopy];
  NSArray *nams = [self valueForKeyPath:@"ps.name"];
  NSLog(@"nams: %@", nams);
  // 1. 集合运算符
  // @avg平均值 @sum求和 @max @min @count
  NSNumber *avgNumber = [self.ps valueForKeyPath:@"@avg.number"];
  NSLog(@"avgNumber: %@", avgNumber);
  
  // 2. 对象运算符
  // @unionOfObjects
  NSArray *unionNames = [self.ps valueForKeyPath:@"@unionOfObjects.name"];
  NSLog(@"unionNames: %@", unionNames);

  // @distinctUnionOfObjects 枚举所有取值
  // 枚举出所有包含的名字 (不重复)
  NSArray *distinctUnionName = [self.ps valueForKeyPath:@"@distinctUnionOfObjects.name"];
  NSLog(@"distinctUnionName: %@", distinctUnionName);
  
  // dictionaryWithValuesForKeys 提取dic里部分key的value
  // dictionaryWithValuesForKeys 设置dic里部分key的value
  NSDictionary *dic = @{@"key1":p1, @"key2":p2, @"key3":p3};
  NSLog(@"values: %@", [dic dictionaryWithValuesForKeys:@[@"key1", @"key2"]]);
  
  // mutableArrayValueForKey
  // addObject 无法触发KVO
  // mutableArrayValueForKey addObject 可以触发KVO (调用完后地址会发生变化)
  [self addObserver:self forKeyPath:@"ps" options:NSKeyValueObservingOptionNew context:nil];
//  [self.ps addObject:[MOPerson personWithName:@"momo" number:@(12)]];
  [[self mutableArrayValueForKey:@"ps"] addObject:[MOPerson personWithName:@"momo" number:@(12)]];
  NSLog(@"%@", self.ps);
  
  
  // 3. Array 和 Set 操作: 集合中包含集合的情况
  // @distinctUnionOfArrays: 数组嵌套数组, 把嵌套数组中所有的值全部放到一个数组中(distinctUnionOfArrays 去重, UnionOfArrays 不去重)返回
  // @unionOfArrays: 该操作会返回一个数组，这个数组包含的对象是在从关键路径到操作器右边的被指定的属性里和@distinctUnionOfArrays不一样，重复的对象不会被移除
  // @distinctUnionOfSets: 和@distinctUnionOfArrays类似。因为Set本身就不支持重复
  
  // Wrapping and Unwrapping Structures: NSPoint、NSRange、NSRect、NSSize、NSValue
  // getter
  NSValue *threeFloat = [self valueForKey:@"threeFloats"];
  // setter
  ThreeFloats floats = {1., 2., 3.};
  NSValue *value = [NSValue valueWithBytes:&floats objCType:@encode(ThreeFloats)];
  [self setValue:value forKey:@"threeFloats"];
  
  // Validating Properties 属性验证
  // 由于特定于属性的验证方法 通过引用接收的值和错误参数，因此验证有三种可能的结果：
  //
  // 1)验证方法认为参数有效并返回 YES.
  // 2)验证方法认为参数无效, 并不修改, 则返回 NO, 且会将 error 指针指向 NSError 对象指示失败的原因.
  // 3)验证方法认为参数无效, 但是创建一个新的可以有效作为替换的参数, 方法返回 YES, 同时保持错误对象不变。在返回之前，该方法修改值引用以指向新值对象。当它进行修改值时，该方法总是创建一个新对象，而不是修改旧对象，即使值对象是可变的。
  MOPerson *person = [[MOPerson alloc] init];
  NSError *error;
  NSString *name = @"John";
  if (![person validateValue:&name forKey:@"name" error:&error]) {
    NSLog(@"%@", error);
  }
  // 注意: 永远不要在 set<Key>: 方法中调用 Validating Properties 中描述的验证方法.
  
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
  NSLog(@"keyPath: %@\n object: %@\n change: %@", keyPath, object, change);
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
//   return ((toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) | (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft));
//}

- (void)clickTimerBtn {
//  [self.navigationController pushViewController:[MOTimerViewController new] animated:YES];
  [[NSNotificationCenter defaultCenter] postNotificationName:@"moxiaoyan" object:nil userInfo:nil];
}
- (void)clickBlockBtn {
  [self.navigationController pushViewController:[MOBlockViewController new] animated:YES];
}



@end
