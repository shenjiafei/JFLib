//
//  TCJProxy.m
//  JFDemo
//
//  Created by shenjiafei on 2022/1/7.
//  Copyright © 2022 shenjiafei. All rights reserved.
//

#import "TCJProxy.h"

@interface TCJProxy()

@property (nonatomic, weak) id object;

@end

@implementation TCJProxy

+ (instancetype)proxyWithTransformObject:(id)object{
    TCJProxy *proxy = [TCJProxy alloc];
    proxy.object = object;
    return proxy;
}
-(id)forwardingTargetForSelector:(SEL)aSelector {
    return self.object;
}

@end
