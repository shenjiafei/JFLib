//
//  NSURLSessionViewController.m
//  httpAndSwift
//
//  Created by shenjiafei on 2021/12/7.
//

#import "NSURLSessionViewController.h"

@interface NSURLSessionViewController ()<NSURLSessionDataDelegate>

@end

@implementation NSURLSessionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)get{
    // 第一种GET请求
    // 获得NSURLSession对象
    NSURLSession *session = [NSURLSession sharedSession];
    // 创建任务
    NSURLSessionDataTask *task = [session dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@""]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
    }];
    // 启动任务
    [task resume];
}

-(void)get2{
    // 第二种GET请求
    // 获得NSURLSession对象
    NSURLSession *session = [NSURLSession sharedSession];

    // 创建任务
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:@""] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
    }];

    // 启动任务
    [task resume];
}

-(void)post1{
    // 获得NSURLSession对象
    NSURLSession *session = [NSURLSession sharedSession];

    // 创建请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@""]];
    request.HTTPMethod = @"POST"; // 请求方法
    request.HTTPBody = [@"" dataUsingEncoding:NSUTF8StringEncoding]; // 请求体

    // 创建任务
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
    }];

    // 启动任务
    [task resume];
}

-(void)postDelegate{
    // 获得NSURLSession对象
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[[NSOperationQueue alloc] init]];

    // 创建任务
    NSURLSessionDataTask *task = [session dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@""]]];

    // 启动任务
    [task resume];
}

#pragma mark - <NSURLSessionDataDelegate>

// 1.接收到服务器的响应
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    // 允许处理服务器的响应，才会继续接收服务器返回的数据
    completionHandler(NSURLSessionResponseAllow);
    // void (^)(NSURLSessionResponseDisposition)
}

// 2.接收到服务器的数据（可能会被调用多次）
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    NSLog(@"%s", __func__);
}

// 3.请求成功或者失败（如果失败，error有值）
-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    NSLog(@"%s", __func__);
}

@end
