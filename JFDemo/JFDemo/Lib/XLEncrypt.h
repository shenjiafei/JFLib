//
//  XLEncrypt.h
//  XueLeTS
//
//  Created by Bing on 15/8/31.
//  Copyright © 2015年 net.xuele. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XLEncrypt : NSObject
+ (NSString*)encrypt:(NSString*)plainText;
+ (NSString*)decrypt:(NSString*)encryptText;
@end
