//
//  MOBlockViewController.h
//  00.OCDemo
//
//  Created by moxiaoyan on 2020/7/14.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOPerson : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *number;
+ (instancetype)personWithName:(NSString *)name number:(NSNumber *)number;
- (instancetype)initWithName:(NSString *)name number:(NSNumber *)number;
@end

@interface MOBlockViewController : UIViewController

@end

NS_ASSUME_NONNULL_END

