//
//  MOTestInitView.h
//  01.OCTest
//
//  Created by moxiaoyan on 2020/5/14.
//  Copyright © 2020 moxiaoyan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOTestInitView : UIView

@property (nonatomic, copy) NSString *name;

- (instancetype)initWithFrame:(CGRect)frame andName:(NSString *)name NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithCoder:(NSCoder *)coder NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
