//
//  NSString+XL.h
//  NSString的扩展，提供NSString的一些扩展方法。
//
//  Created by wubing on 14-9-9.
//  Copyright (c) 2014年 . All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (XL)

- (NSString *)URLEncodedString;
- (NSString *)URLDecodedString;

@end
