//
//  NSThread03ViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/12/1.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "NSThread03ViewController.h"

@interface NSThread03ViewController ()

@property (nonatomic, assign) int ticketSurplusCount;
@property (nonatomic, strong) NSThread *ticketSaleWindow1;
@property (nonatomic, strong) NSThread *ticketSaleWindow2;

@end

@implementation NSThread03ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self initTicketStatusNotSave];
    [self initTicketStatusSave];
}

/**
 * 初始化火车票数量、卖票窗口(非线程安全)、并开始卖票
 */
- (void)initTicketStatusNotSave {
    // 1. 设置剩余火车票为 50
    self.ticketSurplusCount = 50;
    
    // 2. 设置北京火车票售卖窗口的线程
    self.ticketSaleWindow1 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicketNotSafe) object:nil];
    self.ticketSaleWindow1.name = @"北京火车票售票窗口";
    
    // 3. 设置上海火车票售卖窗口的线程
    self.ticketSaleWindow2 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicketNotSafe) object:nil];
    self.ticketSaleWindow2.name = @"上海火车票售票窗口";
    
    // 4. 开始售卖火车票
    [self.ticketSaleWindow1 start];
    [self.ticketSaleWindow2 start];

}

/**
 * 售卖火车票(非线程安全)
 */
- (void)saleTicketNotSafe {
    while (1) {
        //如果还有票，继续售卖
        if (self.ticketSurplusCount > 0) {
            self.ticketSurplusCount --;
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%ld 窗口：%@", self.ticketSurplusCount, [NSThread currentThread].name]);
            [NSThread sleepForTimeInterval:0.2];
        }
        //如果已卖完，关闭售票窗口
        else {
            NSLog(@"所有火车票均已售完");
            break;
        }
    }
}

/**
 * 初始化火车票数量、卖票窗口(线程安全)、并开始卖票
 */
- (void)initTicketStatusSave {
    // 1. 设置剩余火车票为 50
    self.ticketSurplusCount = 50;
    
    // 2. 设置北京火车票售卖窗口的线程
    self.ticketSaleWindow1 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicketSafe) object:nil];
    self.ticketSaleWindow1.name = @"北京火车票售票窗口";
    
    // 3. 设置上海火车票售卖窗口的线程
    self.ticketSaleWindow2 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicketSafe) object:nil];
    self.ticketSaleWindow2.name = @"上海火车票售票窗口";
    
    // 4. 开始售卖火车票
    [self.ticketSaleWindow1 start];
    [self.ticketSaleWindow2 start];
    
}

/**
 * 售卖火车票(线程安全)
 */
- (void)saleTicketSafe {
    while (1) {
        // 互斥锁
        @synchronized (self) {
            //如果还有票，继续售卖
            if (self.ticketSurplusCount > 0) {
                self.ticketSurplusCount --;
                NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%d 窗口：%@", self.ticketSurplusCount, [NSThread currentThread].name]);
                [NSThread sleepForTimeInterval:0.2];
            }
            //如果已卖完，关闭售票窗口
            else {
                NSLog(@"所有火车票均已售完");
                break;
            }
        }
    }
}

@end
