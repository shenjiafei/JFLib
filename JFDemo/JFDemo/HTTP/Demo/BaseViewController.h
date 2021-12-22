//
//  BaseViewController.h
//  httpAndSwift
//
//  Created by shenjiafei on 2021/11/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

@property(nonatomic,weak)UIImageView *imageView;

-(NSDictionary *)dealParams:(NSDictionary*)parameters;

-(NSMutableString *)dealStrParams:(NSDictionary*)parameters;

@end

NS_ASSUME_NONNULL_END
