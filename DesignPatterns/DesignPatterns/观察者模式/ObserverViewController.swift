//
//  ObserverViewController.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2022/1/11.
//

import UIKit

//继承自NSObject的类不会自动把他们的属性暴露给Objective-C runtime。因为NSObject使用OC runtime来执行KVO，所以我们手动添加@objcMembers，它的作用相当于在每一个属性前面加上@objc。

@objcMembers class UserModel: NSObject {
    dynamic var name: String //dynamic意思是用Objective-C runtime动态调度系统来调用属性的getter和setter，意味着静态或者虚拟调用将永远不会被使用。我们要加上dynamic，KVO才能正常进行。
    public init(name: String) {
        self.name = name
    }
}


class ObserverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let user = UserModel(name: "Lebron")

        var nameObservation: NSKeyValueObservation? =
            user.observe(\.name, options: [.initial, .new]) { (user, change) in
                print("名字是：\(user.name)")
        }
        // 名字是：Lebron
        
//        这里我们使用Swift 4的KVO写法，\.name是\KVOUser.name的简写，是一个KeyPath；options参数是用来指定想要观察哪些类型的数据，这里传入[.initial, .new]，意味着可以观察到初始的实例时name的值和name变化时的值；最后一个参数是闭包，闭包有user和change两个对象，user是所有变化完成后的对象，如果.new事件被触发，change会包含一个旧值oldValue。

//        在options参数中，我们传入了.initial，所以我们能看到这个打印名字是：Lebron。
       
//        在Swift 4的KVO中，我们不需要手动的移除观察者或者闭包，因为观察者是被弱引用着的，当观察者变为nil时，闭包会自动移除。
//        被观察的对象必须继承自NSObject和使用Objective-C runtime。
        user.name = "Love"
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
