//
//  MOPerson.h
//  00.OCDemo
//
//  Created by 莫晓卉 on 2020/8/25.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOPerson : NSObject

//@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSArray <MOPerson *>*childens;
@property (nonatomic, strong) NSArray *arr;

+ (instancetype)personWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
