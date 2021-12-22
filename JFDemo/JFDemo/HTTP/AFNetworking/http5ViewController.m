//
//  http5ViewController.m
//  httpAndSwift
//
//  Created by shenjiafei on 2021/11/3.
//

#import "http5ViewController.h"
#import <AFNetworking.h>

@interface http5ViewController ()

@property (nonatomic, strong) AFURLSessionManager *manager;
@property (nonatomic,assign ) long long fileLength;
@property (nonatomic,assign ) long long currentLength;
@property (nonatomic,strong ) NSFileHandle *fileHandle;

@end

@implementation http5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AF的GET和POST请求实现第二层 -- AFURLSessionManager";
    [self downloadTaskWithRequest];
    
//    [self dataTaskWithRequestTest];
}


/*
 AFURLSessionManager 下载实例
 downloadTaskWithRequest
 */

- (IBAction)downloadTaskWithRequest{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    // 1. 创建会话管理者
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    // 2. 创建下载路径和请求对象
    NSURL *URL = [NSURL URLWithString:@"http://dldir1.qq.com/qqfile/QQforMac/QQ_V5.4.0.dmg"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    // 3.创建下载任务
    /**
     * 第一个参数 - request：请求对象
     * 第二个参数 - progress：下载进度block
     *      其中： downloadProgress.completedUnitCount：已经完成的大小
     *            downloadProgress.totalUnitCount：文件的总大小
     * 第三个参数 - destination：自动完成文件剪切操作
     *      其中： 返回值:该文件应该被剪切到哪里
     *            targetPath：临时路径 tmp NSURL
     *            response：响应头
     * 第四个参数 - completionHandler：下载完成回调
     *      其中： filePath：真实路径 == 第三个参数的返回值
     *            error:错误信息
     */
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress *downloadProgress) {
        
//        __weak typeof(self) weakSelf = self;
        // 获取主线程，不然无法正确显示进度。
        NSOperationQueue* mainQueue = [NSOperationQueue mainQueue];
        [mainQueue addOperationWithBlock:^{
            // 下载进度
//            weakSelf.progressView.progress = 1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount;
//            weakSelf.progressLabel.text = [NSString stringWithFormat:@"当前下载进度:%.2f%%",100.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount];
            NSLog(@"当前下载进度:%.2f%%",100.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
        }];
        
        
    } destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        NSURL *path = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [path URLByAppendingPathComponent:@"QQ_V5.4.0.dmg"];
        
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        
        NSLog(@"File downloaded to: %@", filePath);
    }];

    // 4. 开启下载任务
    [downloadTask resume];
}


/*
 AFURLSessionManager 下载实例
 dataTaskWithRequest
 */
-(void)dataTaskWithRequestTest{
    // 创建下载URL
    NSURL *url = [NSURL URLWithString:@"http://dldir1.qq.com/qqfile/QQforMac/QQ_V5.4.0.dmg"];

    // 2.创建request请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

    // 设置HTTP请求头中的Range
    NSString *range = [NSString stringWithFormat:@"bytes=%zd-", self.currentLength];
    [request setValue:range forHTTPHeaderField:@"Range"];

    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *downloadTask = [self.manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSLog(@"dataTaskWithRequest 下载完成");
        // 清空长度
        weakSelf.currentLength = 0;
        weakSelf.fileLength = 0;
        
        // 关闭fileHandle
        [weakSelf.fileHandle closeFile];
        weakSelf.fileHandle = nil;
    }];

}

/**
 * manager的懒加载
 */
- (AFURLSessionManager *)manager {
    if (!_manager) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        // 1. 创建会话管理者
        _manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    }
    return _manager;
}


@end
