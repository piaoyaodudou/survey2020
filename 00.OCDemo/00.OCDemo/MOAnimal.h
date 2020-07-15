//
//  MOAnimal.h
//  00.OCDemo
//
//  Created by moxiaoyan on 2020/7/15.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MOAnimalDelegate <NSObject>
// protocol 声明的属性
// 方法1: 在代理的 @implementation 里加: @synthesize food;
// 方法2: 代理重新声明该属性
@property (nonatomic, copy) NSString *food;
- (void)eat;
@end

@interface MOAnimal : NSObject

// 属性声明
// 默认实现: @synthesize name = _name;
// 即: 自动生成 ivar + setter + getter
@property (nonatomic, copy) NSString *name;

@property (nonatomic, readonly, copy) NSString *indentify;

@property (nonatomic, weak) id <MOAnimalDelegate> delegate;

@property (nonatomic, assign) NSInteger age;

@end

NS_ASSUME_NONNULL_END

