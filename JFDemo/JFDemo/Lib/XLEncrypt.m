//
//  XLEncrypt.m
//  XueLeTS
//
//  Created by Bing on 15/8/31.
//  Copyright © 2015年 net.xuele. All rights reserved.
//

#import "XLEncrypt.h"
#import <CommonCrypto/CommonCryptor.h>
#import "GTMBase64.h"

#define gkey    @"0987654321qazxcv"
#define gIv     @"0102030405060708"
@implementation XLEncrypt
// 加密方法
+ (NSString*)encrypt:(NSString*)plainText
{
    NSData* data = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    size_t plainTextBufferSize = [data length];
    const void *vplainText = (const void *)[data bytes];
    
//    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSizeAES128) & ~(kCCBlockSizeAES128 - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    
    const void *vkey = (const void *) [gkey UTF8String];
    const void *vinitVec = (const void *) [gIv UTF8String];
    
    CCCrypt(kCCEncrypt,
            kCCAlgorithmAES128,
            kCCOptionPKCS7Padding,
            vkey,
            kCCKeySizeAES128,
            vinitVec,
            vplainText,
            plainTextBufferSize,
            (void *)bufferPtr,
            bufferPtrSize,
            &movedBytes);
    
    NSData *myData = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes ];
    free(bufferPtr);
    bufferPtr = NULL;
    NSString *result = [myData base64EncodedStringWithOptions:0];
    return result;
}

// 解密方法
+ (NSString*)decrypt:(NSString*)encryptText {
    NSData *encryptData = [GTMBase64 decodeData:[encryptText dataUsingEncoding:NSUTF8StringEncoding]];
    size_t plainTextBufferSize = [encryptData length];
    const void *vplainText = [encryptData bytes];
    
//    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSizeAES128) & ~(kCCBlockSizeAES128 - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    
    const void *vkey = (const void *) [gkey UTF8String];
    const void *vinitVec = (const void *) [gIv UTF8String];
    
    CCCrypt(kCCDecrypt,
            kCCAlgorithmAES128,
            kCCOptionPKCS7Padding,
            vkey,
            kCCKeySizeAES128,
            vinitVec,
            vplainText,
            plainTextBufferSize,
            (void *)bufferPtr,
            bufferPtrSize,
            &movedBytes);
    
    NSString *result = [[NSString alloc] initWithData:[NSData dataWithBytes:(const void *)bufferPtr
                                                                     length:(NSUInteger)movedBytes] encoding:NSUTF8StringEncoding];
    return result;
}
@end
