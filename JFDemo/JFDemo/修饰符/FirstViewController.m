//
//  FirstViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/11/24.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "FirstViewController.h"
#import "JFDemo-Swift.h"

@interface FirstViewController ()

@property (nonatomic, assign) BOOL statusBarHidden;

@property (nonatomic, assign) UIStatusBarStyle statusStyle;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.orangeColor;
    NSLog(@"%d",self.preferredStatusBarStyle);
//    self.statusStyle = UIStatusBarStyleDefault;
//    [self setNeedsStatusBarAppearanceUpdate];
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}
//
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    self.statusBarHidden = true;
//    self.statusStyle = UIStatusBarStyleLightContent;
//    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
//        [self preferredStatusBarStyle];
//        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
//    }
//    nav 子视图 由父视图控制颜色
    ChildViewController *vc = [[ChildViewController alloc]init];
    [self.navigationController pushViewController:vc animated:true];
}
//
-(BOOL)prefersStatusBarHidden{
//    NSLog(@"%d",self.statusBarHidden);
//    return self.statusBarHidden;
    return false;
}
//
- (UIStatusBarStyle)preferredStatusBarStyle{
    NSLog(@"%d",self.statusStyle);
    return self.statusStyle;
//    return UIStatusBarStyleLightContent;
}

//- (UIViewController *)childViewControllerForStatusBarStyle {
//    return self.topViewController;
//}



@end
