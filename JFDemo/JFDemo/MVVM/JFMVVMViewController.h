//
//  JFMVVMViewController.h
//  JFDemo
//
//  Created by shenjiafei on 2021/2/24.
//  Copyright © 2021 shenjiafei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserViewModel.h"//这里只需要引入 VM，不要M

NS_ASSUME_NONNULL_BEGIN

@interface JFMVVMViewController : UIViewController

@property (nonatomic, strong) UILabel *lb_userName;
@property (nonatomic, strong) UserViewModel *userViewModel;

@end

NS_ASSUME_NONNULL_END
