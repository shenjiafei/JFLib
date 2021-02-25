//
//  User.h
//  JFDemo
//
//  Created by shenjiafei on 2021/2/24.
//  Copyright © 2021 shenjiafei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, assign) NSInteger userId;

- (instancetype)initWithUserName:(NSString *)userName userId:(NSInteger)userId;

@end

NS_ASSUME_NONNULL_END
