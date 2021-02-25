//
//  User.m
//  JFDemo
//
//  Created by shenjiafei on 2021/2/24.
//  Copyright © 2021 shenjiafei. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithUserName:(NSString *)userName userId:(NSInteger)userId {
    self = [super init];
    if (!self) return nil;
    _userName = userName;
    _userId   = userId;
    return self;
}


@end
