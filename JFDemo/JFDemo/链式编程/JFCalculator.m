//
//  JFCalculator.m
//  JFDemo
//
//  Created by shenjiafei on 2022/1/10.
//  Copyright © 2022 shenjiafei. All rights reserved.
//

#import "JFCalculator.h"

@implementation JFCalculator

- (instancetype)init {
    if (self = [super init]) {
        self.result = 0;
    }
    return self;
}

- (JFChainingBlock)add {
    return ^JFCalculator *(float input) {
        self.result += input;
        return self;
    };
}

- (JFChainingBlock)subtract {
    return ^JFCalculator *(float input) {
        self.result -= input;
        return self;
    };
}

- (JFChainingBlock)multiply {
    return ^JFCalculator *(float input) {
        self.result *= input;
        return self;
    };
}

- (JFChainingBlock)divide {
    return ^JFCalculator *(float input) {
        self.result *= (1.0 / input);
        return self;
    };
}

@end
