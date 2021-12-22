//
//  LoginViewController.m
//  httpAndSwift
//
//  Created by shenjiafei on 2021/11/3.
//

#import "LoginViewController.h"
#import <AFNetworking.h>

@interface LoginViewController ()<NSURLSessionDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self NSURLSessionPost];
    [self AFHTTPSessionManagerPOST];
}


-(void)NSURLSessionPost{
    
//    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURL *url = [NSURL URLWithString:@"https://openapi.xueleyun.com/openapi/system/login"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST";

//    NSDictionary *bodyDic = @{@"password":@"boshi123456",
//                              @"sourceType":@"1",
//                              @"sourceDesc" : @"",
//                              @"userId":@"1000110002",
//                              @"token" : @"98904cc068c545ba9575d61021340531"
//                              };
//
//    NSMutableString *bodyStr = [self dealStrParams:bodyDic];
//
//    NSData *body = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    //TS 可行
    NSData *body = [@"policy=9bQO%252FejrXpHTDxPQ1uQAu%252Feuew2OvNxPnnZpE%252BpMW7jTcv8GQaYpqFsJRqG6bq5t32s5MbOiT72QZyWpK3X%252BqeXWpfT5gp4NqG9wPBbEBXZJV0Dy5XpiJ4F1qT0LxjA%252BZPvH2v7dTriRZnrjubVN60yBs%252BRfKqZf8l1K38Fi7cjngp1bVz1O6H9IpDsiEybzLaOAsRPN9moryAcnGQTDRw%253D%253D&sign=00458aabd804a45f67e0828aadd10639&time=1636008404557" dataUsingEncoding:NSUTF8StringEncoding];
//    可行
//    NSData *body = [@"policy=9bQO%252FejrXpHTDxPQ1uQAu%252Feuew2OvNxPnnZpE%252BpMW7jTcv8GQaYpqFsJRqG6bq5t32s5MbOiT72QZyWpK3X%252BqeXWpfT5gp4NqG9wPBbEBXZJV0Dy5XpiJ4F1qT0LxjA%252BZPvH2v7dTriRZnrjubVN6861c3bCC7GC%252FWxi7digfxMv4evBxhCrmK5Lyzl0XHcV25XgfmC%252FwncrD2UikiXYtw%253D%253D&sign=a62e620292c1c2b07e7fda16b671ba18&time=1636012886303&sign=a62e620292c1c2b07e7fda16b671ba18&time=1636012886303" dataUsingEncoding:NSUTF8StringEncoding];
//    不可行
//    NSData *body = [@"policy=9bQO%2FejrXpHTDxPQ1uQAu%2Feuew2OvNxPnnZpE%2BpMW7jTcv8GQaYpqFsJRqG6bq5t32s5MbOiT72QZyWpK3X%2BqeXWpfT5gp4NqG9wPBbEBXZJV0Dy5XpiJ4F1qT0LxjA%2BZPvH2v7dTriRZnrjubVN6861c3bCC7GC%2FWxi7digfxMv4evBxhCrmK5Lyzl0XHcV25XgfmC%2FwncrD2UikiXYtw%3D%3D&sign=a62e620292c1c2b07e7fda16b671ba18&time=1636012886303" dataUsingEncoding:NSUTF8StringEncoding];
    
    
    request.HTTPBody = body;
    
    NSURLSessionTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //8.解析数据
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"%@",dict);
    }];
    
    [dataTask resume];
}

//适配 https

#pragma mark - NSURLSessionDelegate
-(void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler{
    // 判断是否是信任服务器证书
    if(challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust) {
        // 告诉服务器，客户端信任证书
        // 创建凭据对象
        NSURLCredential *credntial = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
        // 通过completionHandler告诉服务器信任证书
        completionHandler(NSURLSessionAuthChallengeUseCredential,credntial);
    }
    NSLog(@"protectionSpace = %@",challenge.protectionSpace);
}



- (void)AFHTTPSessionManagerPOST{
    
    NSString *urlStr = @"https://openapi.xueleyun.com/openapi/system/login";
    
    
    NSString * cerPath = [[NSBundle mainBundle] pathForResource:@"XueLeTSHTTPS" ofType:@"cer"];
    NSData * cerData = [NSData dataWithContentsOfFile:cerPath];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager manager] initWithBaseURL:[NSURL URLWithString:urlStr]];
    
    // 客户端是否信任非法证书
    manager.securityPolicy.allowInvalidCertificates = YES;
    // 是否在证书域字段中验证域名
    [manager.securityPolicy setValidatesDomainName:NO];
    
//    1.设置非校验证书模式 支持https（不校验证书，可以抓包查看）:AFSSLPinningModeNone
//    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//      非校验模式也可以设置证书
//    manager.securityPolicy.pinnedCertificates = [NSSet setWithObject:cerData];
    
//    2.支持https（校验证书，不可以抓包）:AFSSLPinningModeCertificate
    manager.securityPolicy =  [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:[[NSSet alloc] initWithObjects:cerData, nil]];
    
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"application/xml", @"text/xml",@"text/html", @"application/json",@"text/plain",nil];
//    __weak __typeof__(self) weakSelf = self;
    
   
    
    NSDictionary *bodyDic = @{@"password":@"boshi123456",
                              @"sourceType":@"1",
                              @"sourceDesc" : @"",
                              @"userId":@"1000110002",
                              @"token" : @"98904cc068c545ba9575d61021340531"
                              };

    NSDictionary *parameters = [self dealParams:bodyDic];
    
    [manager POST:urlStr parameters:parameters headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@",responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error.userInfo);
        }];
}

@end
