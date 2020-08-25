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

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *number;

+ (instancetype)personWithName:(NSString *)name number:(NSNumber *)number;
- (instancetype)initWithName:(NSString *)name number:(NSNumber *)number;

@end

NS_ASSUME_NONNULL_END
