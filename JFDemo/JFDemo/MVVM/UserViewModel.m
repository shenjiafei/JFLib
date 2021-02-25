//
//  UserViewModel.m
//  JFDemo
//
//  Created by shenjiafei on 2021/2/24.
//  Copyright © 2021 shenjiafei. All rights reserved.
//

#import "UserViewModel.h"

@implementation UserViewModel

- (instancetype)initWithUserName:(NSString *)userName userId:(NSInteger)userId {
    self = [super init];
    if (!self) return nil;
    _user = [[User alloc] initWithUserName:userName userId:userId];
    if (_user.userName.length > 0) {
        _userName = _user.userName;
    } else {
        _userName = [NSString stringWithFormat:@"用户%ld", _user.userId];
    }
    return self;
}

@end
