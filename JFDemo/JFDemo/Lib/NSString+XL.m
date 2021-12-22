//
//  NSString+XL.m
//  GoddessClock
//
//  Created by wubing on 14-9-9.
//  Copyright (c) 2014年 iMac. All rights reserved.
//

#import "NSString+XL.h"

@implementation NSString (XL)

- (NSString *)URLEncodedString
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,                                                                         (CFStringRef)self,                                                                     NULL,                                                                          CFSTR("-!*'();:@&=+$,/?%#[]"),                                                                 kCFStringEncodingUTF8));
    return result;
}
- (NSString*)URLDecodedString
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,                                                                                           (CFStringRef)self,                                                                                       CFSTR(""),                                                                                       kCFStringEncodingUTF8));
    return result;
}

@end
