//
//  MOCat.h
//  00.OCDemo
//
//  Created by moxiaoyan on 2020/7/15.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import "MOAnimal.h"

NS_ASSUME_NONNULL_BEGIN

@interface MOCat : MOAnimal

// 重写了父类属性时，会屏蔽自动生成
// 此时需要手动加上: @synthesize name = _name;
@property (nonatomic, copy) NSString *name;

- (void)eat;

@end

NS_ASSUME_NONNULL_END
