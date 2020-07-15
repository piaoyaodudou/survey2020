//
//  MOAnimal+Sleep.h
//  00.OCDemo
//
//  Created by moxiaoyan on 2020/7/15.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import "MOAnimal.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MOAnimalSleepDelegate <NSObject>

- (void)sleep:(NSString *)place;

@end

@interface MOAnimal (Sleep)

// category 声明的属性
// 不会自动生成 ivar setter getter
@property (nonatomic, copy) NSString *place;

@property (nonatomic, weak) id <MOAnimalSleepDelegate> sleepDelegate;

- (void)sleep;

@end

NS_ASSUME_NONNULL_END
