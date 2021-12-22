//
//  DictionaryViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/12/16.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "DictionaryViewController.h"

@interface DictionaryViewController ()

@end

@implementation DictionaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//+ (instancetype)dictionary;
//+ (instancetype)dictionaryWithObject:(id)object forKey:(id <NSCopying>)key;
//+ (instancetype)dictionaryWithObjectsAndKeys:(id)firstObject, ...;
//+ (id)dictionaryWithContentsOfFile:(NSString *)path;
//+ (id)dictionaryWithContentsOfURL:(NSURL *)url;

-(void)create{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"Walkers", @"name", @"12345678", @"phone", @"ZhongGuo", @"address", nil];
    
    NSDictionary *dict2 = [NSDictionary dictionaryWithObjects:@[@"Walkers",@"30",@"1.75"] forKeys:@[@"name",@"age",@"height"]];

    NSDictionary *dict3 = @{@"name":@"Walkers", @"phone":@"12345678", @"address":@"ZhongGuo"};
    
    dict[@"name"];
}

-(void)blcok{
    NSDictionary *dict = @{@"name":@"Walkers", @"phone":@"12345678", @"address":@"ZhongGuo"};
    
    [dict enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL *stop) {
        NSLog(@"key = %@, value = %@", key, obj);
    }];
}

-(void)file{

    NSDictionary *dict = @{@"name":@"Walkers", @"phone":@"12345678", @"address":@"ZhongGuo"};

    BOOL flag = [dict writeToFile:@"/Users/Walkers/Desktop/dict.plist" atomically:YES];
    NSLog(@"flag = %i", flag);

//    输出结果：flag = 1
    
    
    NSDictionary *newDict = [NSDictionary dictionaryWithContentsOfFile:@"/Users/Walkers/Desktop/dict.plist"];
    NSLog(@"newDict = %@", newDict);

}

-(void)NSMutableDictionary{
//    removeObjectForKey
//    removeAllObjects
//    dict[@"name"] = @"Jack";
}

@end
