//
//  TwoNumbersAddViewController.m
//  JFDemo
//
//  Created by shenjiafei on 2022/1/17.
//  Copyright © 2022 shenjiafei. All rights reserved.
//## 比如这道算法：有一个数组，找到两个数相加为10，有多少种组合，有没有最优解。

#import "TwoNumbersAddViewController.h"

@interface TwoNumbersAddViewController ()

@end

@implementation TwoNumbersAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *nums = [NSArray arrayWithObjects:@(1),@(2),@(5),@(6),@(7),@(4),@(8),nil];
//    [self twoSum4:nums];
    [self hashFun:nums target:10];
}

//暴力解法  n2 没有重复
-(void)twoSum2:(NSArray *)nums{
    for (int i = 0; i < nums.count; i ++) {
        for (int j = i + 1; j < nums.count; j++) {
            NSNumber *num1 = nums[i];
            NSNumber *num2 = nums[j];
            if (num1.intValue + num2.intValue == 10) {
                NSLog(@"num1 = %d num2 = %d",num1.intValue,num2.intValue);
            }
        }
    }
    NSLog(@"么找到");
}

-(void)hashFun:(NSArray*)nums target:(int)target{
    NSMutableDictionary *map = [[NSMutableDictionary alloc]init];
    
    for (int i = 0; i < nums.count; i ++) {
        NSNumber *num1 = nums[i];
        NSNumber *need = @(target - [num1 intValue]);
        if (map[num1]) { //请求中包含了自己
            NSNumber *numV = map[num1];
            NSLog(@"num1 = %d num2 = %d",num1.intValue,numV.intValue);
//            break;
        }else{
            [map setObject:num1 forKey:need];//发布 need 请求
            NSLog(@"map = %@",map);
        }
    }
}



//哈希表
-(NSArray*)hashTwoSum:(NSArray*)nums target:(int)target{
    NSMutableDictionary *map = [[NSMutableDictionary alloc]init];
    for (int i = 0; i < nums.count; i++) {
        NSNumber *v = nums[i];
//        if ([map.allKeys containsObject:v]) {//直接在 keys中寻找，是否有人目标为自己
        if (map[v]) { // 布告栏中有针对v的目标。就找到了  map[v] 即为原来那个请求的人
            NSLog(@"找到了 = %@",@[v,map[v]]);
            return @[v,map[v]];
        }else{
            NSNumber *k = @(target - [v intValue]); //目标 k
            map[k] = v;  // v 为具体联系方式
        }
    }
    return nil;
}



//暴力解法  n2 会有重复
-(void)twoSum:(NSArray *)nums{
    for (NSNumber *num in nums) {
        int need = 10 - num.intValue;
        if ([nums containsObject:@(need)]) {
            NSLog(@"num1 = %d num2 = %d",num.intValue,need);
            break;
        }
    }
}

-(void)twoSum3:(NSArray *)nums{
    NSMutableDictionary *mDic = [NSMutableDictionary dictionary];
    for (int i = 0; i < nums.count; i ++) {
        [mDic setObject:nums[i] forKey:[NSString stringWithFormat:@"%d",i]];
    }
    
    for (int i = 0; i < nums.count; i ++) {
        NSNumber *num1 = nums[i];
        int need = 10 - num1.intValue;
        if ([mDic.allValues containsObject:@(need)]) {
            NSLog(@"num1 = %d num2 = %d",num1.intValue,need);
        }
    }
}


-(void)twoSum4:(NSArray *)nums{
    NSMutableDictionary *mDic = [NSMutableDictionary dictionary];
    for (int i = 0; i < nums.count; i ++) {
        NSNumber *num1 = nums[i];
        [mDic setObject:nums[i] forKey:[NSString stringWithFormat:@"%d",num1.intValue]];
    }
    
    for (int i = 0; i < nums.count; i ++) {
        NSNumber *num1 = nums[i];
        int need = 10 - num1.intValue;
        if ([mDic.allKeys containsObject:[NSString stringWithFormat:@"%d",need]]) {
            NSLog(@"num1 = %d num2 = %d",num1.intValue,need);
        }
    }
}

@end
