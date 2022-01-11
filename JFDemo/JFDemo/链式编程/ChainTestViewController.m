//
//  ChainTestViewController.m
//  JFDemo
//
//  Created by shenjiafei on 2022/1/10.
//  Copyright © 2022 shenjiafei. All rights reserved.
//

#import "ChainTestViewController.h"
#import "JFCalculator.h"

@interface ChainTestViewController ()

@end

@implementation ChainTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    JFCalculator *calculator = JFCalculator.new;
    calculator.add(4).subtract(1).multiply(2).divide(3);
    NSLog(@"%.2f", calculator.result);
}

@end
