//
//  JFCalculator.h
//  JFDemo
//
//  Created by shenjiafei on 2022/1/10.
//  Copyright © 2022 shenjiafei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JFCalculator;

//自定义一个JFChainingBlock 参数 float 返回就是JFCalculator对象
typedef JFCalculator *(^JFChainingBlock)(float input);


@interface JFCalculator : NSObject

@property (nonatomic, assign) float result;

- (JFChainingBlock)add;
- (JFChainingBlock)subtract;
- (JFChainingBlock)multiply;
- (JFChainingBlock)divide;

@end

