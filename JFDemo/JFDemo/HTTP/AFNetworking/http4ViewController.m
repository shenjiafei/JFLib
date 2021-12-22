//
//  http4ViewController.m
//  httpAndSwift
//
//  Created by shenjiafei on 2021/11/3.
//

#import "http4ViewController.h"
#import <AFNetworking.h>

@interface http4ViewController ()

@end

@implementation http4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AF封装了GET和POST操作的 -- AFHTTPSessionManager";
    [self AFHTTPSessionManagerGet];
}

//AFHTTPSessionManager Get 的方式下载
- (void)AFHTTPSessionManagerGet{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/pdf"];
    __weak __typeof__(self) weakSelf = self;
    
    NSString *urlStr = @"http://localhost/test3.pdf";
    
    NSURLSessionDataTask *task = [manager GET:urlStr parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@",responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error.userInfo);
        }];
}

//调用顺序
//AFHTTPSessionManager 文件
//GET:urlStr parameters:nil headers:nil
//dataTaskWithHTTPMethod:(NSString *)method

//AFURLSessionManager 中
//dataTaskWithRequest
//addDelegateForDataTask

@end
