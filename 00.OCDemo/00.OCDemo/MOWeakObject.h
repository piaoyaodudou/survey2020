//
//  MOProxyObject.h
//  00.OCDemo
//
//  Created by moxiaoyan on 2020/7/13.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOProxyObject : NSObject

+ (instancetype)proxyWithWeakObject:(id)obj;
- (instancetype)initWithWeakObject:(id)obj;

@end

NS_ASSUME_NONNULL_END
