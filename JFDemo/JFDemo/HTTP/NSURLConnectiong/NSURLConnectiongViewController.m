//
//  NSURLConnectiongViewController.m
//  httpAndSwift
//
//  Created by shenjiafei on 2021/12/7.
//

#import "NSURLConnectiongViewController.h"

@interface NSURLConnectiongViewController ()<NSURLConnectionDataDelegate>

@end

@implementation NSURLConnectiongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)syncGet{
    // 1.创建请求路径(url)
    NSURL *url = [NSURL URLWithString:@""];
    // 2.通过请求路径(url)创建请求对象(request)
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // 3.向服务器发送同步请求(data)
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    // sendSynchronousRequest阻塞式的方法，等待服务器返回数据
    // 4.解析服务器返回的数据(解析成字符串)
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

-(void)asyncBlockGet{
    // 1.创建请求路径(url)
    NSURL *url = [NSURL URLWithString:@""];
    // 2.通过请求路径(url)创建请求对象(request)
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // 3.向服务器发送异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        // 请求完毕会来到这个 block
        // 4.解析服务器返回的数据（解析成字符串）
        NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", string);
    }];
}

-(void)asyncDelegateGet{
    // 1.创建请求路径(url)
    NSURL *url = [NSURL URLWithString:@""];
    // 2.通过请求路径(url)创建请求对象(request)
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // 3.通过代理创建连接对象
    [NSURLConnection connectionWithRequest:request delegate:self];
    // [[NSURLConnection alloc] initWithRequest:request delegate:self];
    // NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
    // startImmediately:是否立即发送请求
    // 开始发送请求
    // [conn start];
    // 取消发送请求
    // [conn cancel];
}

-(void)syncBlockPost{
    // 1.创建请求路径(url)
    NSURL *url = [NSURL URLWithString:@""];
    // 2.通过请求路径(url)创建请求对象(request)
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 更改请求方法
    request.HTTPMethod = @"POST";
    // 设置请求体
    request.HTTPBody = [@"" dataUsingEncoding:NSUTF8StringEncoding];
    // 设置超时(5秒后超时)
    request.timeoutInterval = 5;
    // 设置请求头(非必要，看情况)
    // [request setValue:@"iOS 9.0" forHTTPHeaderField:@"User-Agent"];
    // 3.向服务器发送同步请求
    [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
}

-(void)asyncBlockPost{
    // 1.创建请求路径(url)
    NSURL *url = [NSURL URLWithString:@""];
    // 2.通过请求路径(url)创建请求对象(request)
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 更改请求方法
    request.HTTPMethod = @"POST";
    // 设置请求体
    request.HTTPBody = [@"" dataUsingEncoding:NSUTF8StringEncoding];
    // 设置超时(5秒后超时)
    request.timeoutInterval = 5;
    // 设置请求头
    // [request setValue:@"iOS 9.0" forHTTPHeaderField:@"User-Agent"];
    // 3.向服务器发送异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) { // 比如请求超时
            NSLog(@"----请求失败");
        } else {
            NSLog(@"------%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        }
    }];
}


//NSURLConnection 中文URL处理
-(void)china{
    NSString *urlStr = @"";
    // 将中文URL进行转码
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
}



#pragma mark - <NSURLConnectionDataDelegate>
// 接收到服务器的响应
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
}
// 接收到服务器的数据（如果数据量比较大，这个方法会被调用多次）
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
} // 不断拼接服务器返回的数据
// 服务器的数据成功接收完毕
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
}
// 请求失败（比如请求超时）
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
}

@end
