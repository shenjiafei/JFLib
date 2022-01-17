//
//  OCFunViewController.m
//  JFDemo
//
//  Created by shenjiafei on 2022/1/14.
//  Copyright © 2022 shenjiafei. All rights reserved.
//
// OC  演示各种排序算法

#import "OCFunViewController.h"

@interface OCFunViewController ()

@end

@implementation OCFunViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"15",@"12",@"7",@"9",@"1",@"3", nil];
    
    [self bubbleSort2:array];
    NSLog(@"%@",array);
}


#pragma mark -冒泡排序  两两对比置换，一步步把最小的放倒最前面
- (void)bubbleSort:(NSMutableArray *)array{
    NSInteger i,j;
    NSInteger n = array.count;
    BOOL flag = YES;
    for (i = 0; i<n&&flag; i++) {
        flag = NO;
        for (j = n -1; j>i; j--) {
            if ([array[j] integerValue] < [array[j-1] integerValue]) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:j-1];
                flag = YES;
                NSLog(@"执行置换 置换后%@",array);
            }
        }
    }
}

//-冒泡排序 两两对比置换，一步步把最大的放倒最后
- (void)bubbleSort2:(NSMutableArray *)array{
    NSInteger i,j;
    for (i = 1; i < array.count; ++i) {
        for (j = 0; j < array.count - 1; ++j) {
            if ([array[j] integerValue] > [array[j + 1] integerValue]) {
               NSObject *t = array[j];
                array[j] = array[j + 1];
                array[j + 1] = t;
                NSLog(@"执行置换 置换后%@",array);
            }
        }
    }
}


#pragma mark - 希尔排序
- (void)shellSort:(NSMutableArray *)array {
    NSInteger i,j,gap;
    NSInteger n = array.count;
    for (gap = n/2; gap > 0; gap/=2) {
        for (i=gap; i<n; i++) {
            
            for (j = i-gap; j>=0 && [array[j] integerValue] > [array[j +gap] integerValue]; j -= gap) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:j+gap];
            }
        }
    }
}

#pragma mark - 快速排序
- (void)quickSort:(NSMutableArray *)array count:(NSInteger)count{
    
    [self __quickSort:array left:0 right:count-1];
}

- (void)__quickSort:(NSMutableArray *)array left:(NSInteger)l right:(NSInteger )r{
    if (l>=r) {
        return;
    }
    NSInteger p = [self __partition:array left:l right:r];
    [self __quickSort:array left:l right:p-1];
    [self __quickSort:array left:p+1 right:r];
}

- (NSInteger )__partition:(NSMutableArray *)array left:(NSInteger)l right:(NSInteger )r{
    [array exchangeObjectAtIndex:l withObjectAtIndex:(random()%(r-l+1))+l];
    NSInteger v = [array[l] integerValue];
    NSInteger j = l;
    for (NSInteger i = l+1; i<r; i++) {
        if ([array[i] integerValue] < v) {
            [array exchangeObjectAtIndex:j+1 withObjectAtIndex:i];
            j++;
        }
    }
    [array exchangeObjectAtIndex:j withObjectAtIndex:l];
    return j;
}

#pragma mark - 插入排序
- (void)insertSort:(NSMutableArray *)array{
    NSInteger i,j,temp;
    NSInteger n = array.count;
    for (i = 1; i<n; i++) {
        if ([array[i] integerValue] < [array[i-1] integerValue]) {
            temp = [array[i] integerValue];
            for (j = i-1; j>=0&&[array[j] integerValue] > temp; j--) {
                array[j +1] = array[j];
            }
            array[j+1] = @(temp);
        }
    }
}

#pragma mark -  插入排序2
- (void)insertSort:(NSMutableArray *)array count:(NSInteger)count{
    for (NSInteger i = 1; i < count; i++) {
        NSInteger j = i;
        for ( j = i; j>0; j--) {
            if ([array[i] integerValue] < [array[j-1] integerValue]) {
//                [array exchangeObjectAtIndex:j withObjectAtIndex:j-1];
                array[j] = array[j-1];
            }else{
                /// 比前面的都大 不处理 直接结束遍历
                break;
            }
        }
        array[j] = array[i];
    }
}

#pragma mark - 简单选择排序
- (void)selectedSort:(NSMutableArray *)array{

    NSInteger i,j,min;
    NSInteger n = array.count;
    for (i=0; i<n; i++) {
        min = i;
        for (j = i+1; j<n; j++) {
            if ([array[j] integerValue]< [array[min] integerValue]) {
                min = j;
            }
        }
        if (min != i) {
            [array exchangeObjectAtIndex:i withObjectAtIndex:min];
        }
    }
}


#pragma mark -  归并排序 自底向上

- (void)mergeSortBU:(NSMutableArray *)array count:(NSInteger)count{
    
    for (NSInteger sz = 1; sz <=count; sz+=sz) {
        for (NSInteger i =0; i<count; i += sz + sz) {
            [self __merge:array left:i midle:i+sz-1 right:MIN(i+sz+sz-1, count-1)];
        }
    }
}
/// 归并排序
- (void)mergeSort:(NSMutableArray *)array count:(NSInteger)count{
    
    [self __mergeSort:array left:0 right:count-1];
}

/// 递归使用归并排序，对array [l ...r]
- (void)__mergeSort:(NSMutableArray *)array left:(NSInteger)l right:(NSInteger )r{
    if (l>= r) {
        return;
    }
//    NSInteger mid = (l+r)/2;
    NSInteger mid = l + (r-l)/2;
    [self __mergeSort:array left:l right:mid];
    [self __mergeSort:array left:mid+1 right:r];
///  由于数组的左边和右边都已经排好序了，这时候如果左边的最大值 小于右边的最小值那说明 已经排好序了 不需要在排序了
    if ([array[mid] integerValue] > [array[mid +1] integerValue]) {
        [self __merge:array left:l midle:mid right:r];
    }

}

/// [l...mid]   [mid+1.....r]  进行合并
- (void)__merge:(NSMutableArray *)array left:(NSInteger)l midle:(NSInteger)mid right:(NSInteger )r{
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSInteger i = l; i<=r; i++) {
        tempArray[i-l] = array[i];
    }
    NSInteger i=l ,j = mid +1;
    
    for (NSInteger k = l; k<=r; k++) {
        if (i >mid) {
            array[k] = tempArray[j-l];
            j++;
        }else if(j>r){
            array[k] = tempArray[i-l];
            i++;
        }else if ([tempArray[i-l] integerValue] < [tempArray[j-l] integerValue]) {
            array[k] = tempArray[i-l];
            i++;
        }else {
            array[k] = tempArray[j-l];
            j++;
        }
    }
}


@end
