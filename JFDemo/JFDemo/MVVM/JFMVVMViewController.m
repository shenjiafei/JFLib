//
//  JFMVVMViewController.m
//  JFDemo
//
//  Created by shenjiafei on 2021/2/24.
//  Copyright © 2021 shenjiafei. All rights reserved.
//

#import "JFMVVMViewController.h"

@interface JFMVVMViewController ()

@end

@implementation JFMVVMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    MVC模式
    //创建User实例并初始化
//    if (_user.userName.length > 0) {
//        _lb_userName.text = _user.userName;
//    } else {
//        _lb_userName.text = [NSString stringWithFormat:@"用户%ld", _user.userId];
//    }
    
//    优点：结构简单，便于理解
//    缺点：model 过于轻量，只承担了数据结构的任务
//    Controller 过于臃肿，一些逻辑判断和网络请求都放在这里
//    Model 和 View 永远不能相互通信，只能通过 Controller 传递。
    
    //MVP 模式
//    MVC和MVP的区别就是，在MVP中M和V没有直接通信。
    
    //MVVM 模式，逻辑判断在 VM 中进行
    _userViewModel = [[UserViewModel alloc] initWithUserName:@"liu" userId:123456];
    _lb_userName.text = _userViewModel.userName;
    
//    核心是ViewModel，它是一种特殊的model类型，用于表示程序的UI状态
//    MVVM模式中的三部分比MVC更加简洁，下面是一些严格的限制：
//
//    View引用了ViewModel，但反过来不行。
//    ViewModel引用了Model，但反过来不行。
//    如果我们破坏了这些规则，便无法正确地使用MVVM。
//    View引用了ViewModel，但ViewModel没有引用View，那ViewModel如何更新视图呢？MVVM模式依赖于数据绑定，它是一个框架级别的特性，用于自动连接对象属性和UI控件。
//好处：对于很简单的界面使用MVVM会增加代码量，但如果界面中内容很多、Cell样式也很多的情况下使用MVVM可以很好地将VC中处理Cell相关的工作分离出来。
    
//    MVVM的缺点
//    MVVM这种做法是能够提高后续操作代码的可读性的。在比较直觉的思路里面，是需要这部分转化过程的，但这部分转化过程的成本是很大的，主要成本在于：
//
//    数组内容的转化成本较高：数组里面每项都要转化成Item对象，如果Item对象中还有类似数组，就很头疼。
//    转化之后的数据在大部分情况是不能直接被展示的，为了能够被展示，还需要第二次转化。
//    只有在API返回的数据高度标准化时，这些对象原型（Item）的可复用程度才高，否则容易出现类型爆炸，提高维护成本。
//    调试时通过对象原型查看数据内容不如直接通过NSDictionary/NSArray直观。
//    同一API的数据被不同View展示时，难以控制数据转化的代码，它们有可能会散落在任何需要的地方。
}


@end
