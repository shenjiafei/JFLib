//
//  OCViewController.m
//  httpAndSwift
//
//  Created by shenjiafei on 2021/11/2.
//

#import "OCViewController.h"

@interface OCViewController ()<NSURLSessionDelegate,NSURLSessionTaskDelegate>

@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
}


-(void)request{
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
//    config.timeoutIntervalForRequest
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config
                                                          delegate:self
                                                     delegateQueue:[NSOperationQueue mainQueue]];
//    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:@"http://www.baidu.com"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"data %@",data);
    }];
    task.delegate = self;
    
    
    [task resume];
    
//    config.HTTPAdditionalHeaders
//    config.HTTPCookieStorage
//    config.URLCredentialStorage //证书管理器
//    config.URLCache 请求缓存
//    config.requestCachePolicy = NSURLRequestUseProtocolCachePolicy 缓存策略
    
//    [[NSURLCache alloc] initWithMemoryCapacity:30 * 1024 * 1024
//                                  diskCapacity:30 * 1024 * 1024
//                                  directoryURL:[NSURL URLWithString:filePath]];

//    config.HTTPMaximumConnectionsPerHost
}


//NSURLSessionTaskDelegate
//每个task结束时都会回调下面的方法，
- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
didFinishCollectingMetrics:(NSURLSessionTaskMetrics *)metrics{
//    metrics.transactionMetrics
//    metrics.taskInterval 总耗时
//    metrics.redirectCount 重定向次数
    NSLog(@"data %@",metrics);
    
}

//- (void)URLSession:(NSURLSession *)session
//              task:(NSURLSessionTask *)task
//willPerformHTTPRedirection:(NSHTTPURLResponse *)response
//        newRequest:(NSURLRequest *)request
// completionHandler:(void (^)(NSURLRequest *))completionHandler
//{
//    NSURLRequest *redirectRequest = request;
//
//    if (self.taskWillPerformHTTPRedirection) {
//        redirectRequest = self.taskWillPerformHTTPRedirection(session, task, response, request);
//    }
//
//    if (completionHandler) {
//        completionHandler(redirectRequest);
//    }
//}
//
//- (NSData *)readNextBuffer {
//    if (self.maxSegment <= self.currentIndex) {
//        return nil;
//    }
//    
//    if(!self.fileHandler){
//        NSString *filePath = [self uploadFile];
//        NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
//        self.fileHandler = fileHandle;
//    }
//    [self.fileHandler seekToFileOffset:(self.currentIndex) * self.segmentSize];
//    NSData *data = [self.fileHandler readDataOfLength:self.segmentSize];
//    return data;
//}



@end
