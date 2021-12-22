//
//  ArrayViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/12/16.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "ArrayViewController.h"

@interface ArrayViewController ()

@end

@implementation ArrayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//+ (instancetype)array;
//+ (instancetype)arrayWithObject:(id)anObject;
//+ (instancetype)arrayWithObjects:(id)firstObj, ...;
//+ (instancetype)arrayWithArray:(NSArray *)array;
//+ (id)arrayWithContentsOfFile:(NSString *)path;
//+ (id)arrayWithContentsOfURL:(NSURL *)url;

-(void)create{
//    @[@"Jack", @"Rose", @"Jim"];
//    array[index];
}

-(void)demo{
    NSArray *arr = [NSArray arrayWithObjects:@"abc",@"edf",@"hij", nil];
//    获得hij位置 找不到 返回-1
    NSLog(@"index = %lu",[arr indexOfObject:@"hij"]);
    
//    获得edf位置(1-2范围) 找不到 返回-1
    NSRange range = {1,2};
    NSLog(@"index = %lu",[arr indexOfObject:@"edf" inRange:range]);
}

-(void)blcok{
    NSArray *arr = @[@"abc", @"edf", @"hij"];
    // 使用OC数组的迭代器来遍历
    // 每取出一个元素就会调用一次block
    // 每次调用block都会将当前取出的元素和元素对应的索引传递给我们
    // obj就是当前取出的元素, idx就是当前元素对应的索引
    [arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx == 1) {
            *stop = YES;  // stop用于控制什么时候停止遍历
        }
        NSLog(@"obj = %@, idx = %lu", obj, idx);
    }];

//    输出结果：
//    obj = abc, idx = 0
//    obj = edf, idx = 1
}

-(void)selector{
    NSArray *arr = @[@"abc", @"edf", @"hij"];
    
    // 让数组中所有对象执行这个方法
    // 注意：如果数组中的对象没有这个方法会报错，需要实现该方法
    //    [arr makeObjectsPerformSelector:@selector(say)];
    [arr makeObjectsPerformSelector:@selector(eat:) withObject:@"bread"];
}

-(void)sort{
    NSArray *arr = @[@10,@9,@1,@19];
    NSLog(@"排序前: %@", arr);
    NSArray *newArr = [arr sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"排序后: %@", newArr);
}

-(void)sort2{
//    Person *p1 = [Person new];
//    p1.age = 10;
//    Person *p2 = [Person new];
//    p2.age = 20;
//    Person *p3 = [Person new];
//    p3.age = 5;
//    Person *p4 = [Person new];
//    p4.age = 7;
//
//    NSArray *arr = @[p1, p2, p3, p4];
//    NSLog(@"排序前: %@", arr);
//    // 按照人的年龄进行排序
//    // 该方法默认会按照升序排序
//    NSArray *newArr = [arr sortedArrayWithOptions:NSSortStable usingComparator:^NSComparisonResult(Person *obj1, Person *obj2) {
//    // 每次调用该block都会取出数组中的两个元素给我们
//    return obj1.age > obj2.age;    // 升序
//    //    return obj1.age < obj2.age;    // 降序
//    }];
//    NSLog(@"排序后: %@", newArr);
//
//    输出结果：
//    排序前: (
//        "age = 10",
//        "age = 20",
//        "age = 5",
//        "age = 7"
//    )
//    排序后: (
//        "age = 5",
//        "age = 7",
//        "age = 10",
//        "age = 20"
//    )
}

-(void)file{
    
//    array 写入文件
    NSArray *arr = @[@"abc", @"def", @"hij", @"klm"];
    BOOL flag = [arr writeToFile:@"/Users/Walkers/Desktop/test.plist" atomically:YES];
    
    //读取文件
    NSArray *newArr = [NSArray arrayWithContentsOfFile:@"/Users/Walkers/Desktop/test.plist"];
    NSLog(@"newArr = %@", newArr);

}

-(void)trans{
//    把数组元素链接成字符串
    NSArray *arr = @[@"abc", @"edf", @"hij", @"klm"];
    NSString *res = [arr componentsJoinedByString:@"*"];//组合
    NSLog(@"res = %@", res);
    
    NSString *str = @"abc-edf-hij-klm";
    NSArray *arr2 = [str componentsSeparatedByString:@"-"];//分割
    NSLog(@"arr = %@", arr2);

}

-(void)NSMutableArray{
//    removeObjectsInRange
//    用anObject替换index位置对应的元素
//    - (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
//    交换idx1和idx2位置的元素
//    - (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;
}


@end
