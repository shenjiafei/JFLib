//
//  TCJProxy.h
//  JFDemo
//
//  Created by shenjiafei on 2022/1/7.
//  Copyright © 2022 shenjiafei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TCJProxy : NSProxy

+ (instancetype)proxyWithTransformObject:(id)object;

@end

NS_ASSUME_NONNULL_END
