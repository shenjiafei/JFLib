//
//  http2ViewController.m
//  httpAndSwift
//
//  Created by shenjiafei on 2021/11/2.
//

#import "http2ViewController.h"

@interface http2ViewController ()<NSURLConnectionDataDelegate>

@property (nonatomic,assign ) long long fileLength;

@property (nonatomic,assign ) long long currentLength;

@property (nonatomic,strong ) NSFileHandle *fileHandle;

@end

@implementation http2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self withBlock];
//    [self withDelegate];
}

/**
 * 采用block的API ①
 * 点击按钮 -- 使用NSURLConnection下载图片文件，并显示再imageView上
 */
- (IBAction)withBlock{
    // 创建下载路径
    NSURL *url = [NSURL URLWithString:@"https://upload-images.jianshu.io/upload_images/1877784-b4777f945878a0b9.jpg"];
    
    // NSURLConnection发送异步Get请求，该方法iOS9.0之后就废除了，推荐NSURLSession
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        self.imageView.image = [UIImage imageWithData:data];
        
        // 可以在这里把下载的文件保存
    }];

}

//利用代理的API
- (IBAction)withDelegate{
    // 创建下载路径
    NSURL *url = [NSURL URLWithString:@"http://dldir1.qq.com/qqfile/QQforMac/QQ_V5.4.0.dmg"];
    // NSURLConnection发送异步Get请求，并实现相应的代理方法，该方法iOS9.0之后废除了。
    [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:url] delegate:self];
}

#pragma mark <NSURLConnectionDataDelegate> 实现方法

/**
 * 接收到响应的时候：创建一个空的沙盒文件
 */
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // 获得下载文件的总长度
    self.fileLength = response.expectedContentLength;
    
    // 沙盒文件路径
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"QQ_V5.4.0.dmg"];
    
    NSLog(@"File downloaded to: %@",path);
    
    // 创建一个空的文件到沙盒中
    [[NSFileManager defaultManager] createFileAtPath:path contents:nil attributes:nil];
    
    // 创建文件句柄
    self.fileHandle = [NSFileHandle fileHandleForWritingAtPath:path];
}

/**
 * 接收到具体数据：把数据写入沙盒文件中
 */
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // 指定数据的写入位置 -- 文件内容的最后面
    [self.fileHandle seekToEndOfFile];
        
    // 向沙盒写入数据
    [self.fileHandle writeData:data];
    
    // 拼接文件总长度
    self.currentLength += data.length;
    
    // 下载进度
//    self.progressView.progress =  1.0 * self.currentLength / self.fileLength;
//    self.progressLabel.text = [NSString stringWithFormat:@"当前下载进度:%.2f%%",100.0 * self.currentLength / self.fileLength];
    
    NSLog(@"当前下载进度:%.2f%%",100.0 * self.currentLength / self.fileLength);
}

/**
 *  下载完文件之后调用：关闭文件、清空长度
 */
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // 关闭fileHandle
    [self.fileHandle closeFile];
    self.fileHandle = nil;
    
    // 清空长度
    self.currentLength = 0;
    self.fileLength = 0;
}



@end
