//
//  BaseViewController.m
//  httpAndSwift
//
//  Created by shenjiafei on 2021/11/2.
//

#import "BaseViewController.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>
#import "XLEncrypt.h"
#import "NSString+XL.h"

#define gkey    @"0987654321qazxcv"
#define gIv     @"0102030405060708"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60)];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:12];
    label.text = self.title;
    [self.view addSubview:label];
    
}

-(UIImageView *)imageView{
    if (_imageView == nil) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(17, 100, 150, 150)];
        [self.view addSubview:imageView];
        _imageView = imageView;
    }
    return _imageView;
}


-(NSDictionary *)dealParams:(NSDictionary*)parameters
{
    NSMutableDictionary *baseDic = [NSMutableDictionary dictionary];
    [baseDic addEntriesFromDictionary:parameters];
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:baseDic options:NSJSONWritingPrettyPrinted error:&parseError];

    NSString *string = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSDictionary *finalDic =@{@"sign":[self getMD5WithString:string], /* md5生成sign  */
                              @"policy":[[XLEncrypt encrypt:string] URLEncodedString], /* 3des + base64 生成Policy*/
                              @"time":[NSNumber numberWithLong:[self secondTimeWithDate:[NSDate date]]]
                              };
    return  finalDic;
}

-(NSMutableString *)dealStrParams:(NSDictionary*)parameters
{
    NSMutableDictionary *baseDic = [NSMutableDictionary dictionary];
    [baseDic addEntriesFromDictionary:parameters];
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:baseDic options:NSJSONWritingPrettyPrinted error:&parseError];

    NSString *string = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

    NSMutableString *bodyStr = NSMutableString.new;
    [bodyStr appendFormat:@"%@=%@",@"policy",[[XLEncrypt encrypt:string] URLEncodedString]];
    [bodyStr appendString:@"&"];
    [bodyStr appendFormat:@"%@=%@",@"sign",[self getMD5WithString:string]];
    [bodyStr appendString:@"&"];
    [bodyStr appendFormat:@"%@=%@",@"time",[NSNumber numberWithLong:[self secondTimeWithDate:[NSDate date]]]];
    
    return  bodyStr;
}

- (NSString *)getMD5WithString:(NSString *)string
{
    const char *cStr = [string UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (int)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

-(long long)secondTimeWithDate:(NSDate *)date{
    NSTimeInterval time1 = [date timeIntervalSince1970];//此时距离1970的秒数
    long long time = time1* 1000;  //获取毫秒数，并转为整数
    return time;
}

@end
