//
//  NSOperation05ViewController.m
//  Hello
//
//  Created by shenjiafei on 2021/12/1.
//  Copyright © 2021 CodingFire. All rights reserved.
//

#import "NSOperation05ViewController.h"

@interface NSOperation05ViewController ()

@end

@implementation NSOperation05ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
 NSOperation 常用属性和方法

 取消操作方法

 - (void)cancel; 可取消操作，实质是标记 isCancelled 状态。


 判断操作状态方法

 - (BOOL)isFinished; 判断操作是否已经结束。
 - (BOOL)isCancelled; 判断操作是否已经标记为取消。
 - (BOOL)isExecuting; 判断操作是否正在在运行。
 - (BOOL)isReady; 判断操作是否处于准备就绪状态，这个值和操作的依赖关系相关。


 操作同步

 - (void)waitUntilFinished; 阻塞当前线程，直到该操作结束。可用于线程执行顺序的同步。
 - (void)setCompletionBlock:(void (^)(void))block; completionBlock 会在当前操作执行完毕时执行 completionBlock。
 - (void)addDependency:(NSOperation *)op; 添加依赖，使当前操作依赖于操作 op 的完成。
 - (void)removeDependency:(NSOperation *)op; 移除依赖，取消当前操作对操作 op 的依赖。
 @property (readonly, copy) NSArray<NSOperation *> *dependencies; 在当前操作开始执行之前完成执行的所有操作对象数组。
*/


/*
 NSOperationQueue 常用属性和方法

 取消/暂停/恢复操作

 - (void)cancelAllOperations; 可以取消队列的所有操作。
 - (BOOL)isSuspended; 判断队列是否处于暂停状态。 YES 为暂停状态，NO 为恢复状态。
 - (void)setSuspended:(BOOL)b;  可设置操作的暂停和恢复，YES 代表暂停队列，NO 代表恢复队列。


 操作同步

 - (void)waitUntilAllOperationsAreFinished; 阻塞当前线程，直到队列中的操作全部执行完毕。


 添加/获取操作

 - (void)addOperationWithBlock:(void (^)(void))block; 向队列中添加一个 NSBlockOperation 类型操作对象。
 - (void)addOperations:(NSArray *)ops waitUntilFinished:(BOOL)wait; 向队列中添加操作数组，wait 标志是否阻塞当前线程直到所有操作结束
 - (NSArray *)operations; 当前在队列中的操作数组（某个操作执行结束后会自动从这个数组清除）。
 - (NSUInteger)operationCount; 当前队列中的操作数。


 获取队列

 + (id)currentQueue; 获取当前队列，如果当前线程不是在 NSOperationQueue 上运行则返回 nil。
 + (id)mainQueue; 获取主队列。


 注意：

 这里的暂停和取消（包括操作的取消和队列的取消）并不代表可以将当前的操作立即取消，而是当当前的操作执行完毕之后不再执行新的操作。
 暂停和取消的区别就在于：暂停操作之后还可以恢复操作，继续向下执行；而取消操作之后，所有的操作就清空了，无法再接着执行剩下的操作。
 */

@end
