//
//  http1ViewController.m
//  httpAndSwift
//
//  Created by shenjiafei on 2021/11/2.
//

#import "http1ViewController.h"

//[NSData dataWithContentsOfURL:url];

@interface http1ViewController ()


@end

@implementation http1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self downloadBtnClick:nil];
    
}

/**
 * 点击按钮 -- 使用NSData下载图片文件，并显示再imageView上
 */
- (IBAction)downloadBtnClick:(UIButton *)sender {
    
    // 在子线程中发送下载文件请求
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 创建下载路径
        NSURL *url = [NSURL URLWithString:@"https://upload-images.jianshu.io/upload_images/1877784-b4777f945878a0b9.jpg"];
        
        // NSData的dataWithContentsOfURL:方法下载
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        // 回到主线程，刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.imageView.image = [UIImage imageWithData:data];
        });
    });
}

@end
