//
//  TestViewController.m
//  JFDemo
//
//  Created by shenjiafei on 2021/2/23.
//  Copyright © 2021 shenjiafei. All rights reserved.
//

//Injection注入

#import "TestViewController.h"

@interface TestViewController ()

@property (nonatomic, weak) UIView *sView;
@property(nonatomic,weak)UIButton *testButton;

@end

@implementation TestViewController

- (void)loadView{
    [super loadView];
    self.view.backgroundColor = UIColor.whiteColor;
    [self testButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(20, 100, 200,100)];
    view.layer.borderWidth = 1;
    [self.view addSubview:view];
    self.sView = view;
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 100,50)];
    view2.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    view2.backgroundColor = UIColor.grayColor;
    [view addSubview:view2];

}

- (void)injected
{
    [self.sView setFrame:CGRectMake(20, 100, 200, 100)];
    
}

@end
