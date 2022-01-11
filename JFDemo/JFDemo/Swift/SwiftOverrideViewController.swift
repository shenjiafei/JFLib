//
//  SwiftOverrideViewController.swift
//  JFDemo
//
//  Created by shenjiafei on 2022/1/11.
//  Copyright © 2022 shenjiafei. All rights reserved.
//

import UIKit

class SwiftOverrideViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 在OC中并没有重载的概念,因为OC的一个方法每增加一个参数就会变成另外一个新的方法
    }
    
//  【重写】方法名和参数都必须跟父类相同
    /// 父类中声明一个方法
    class SuperClass: NSObject {
        func sayHelloWorld() {
            print("Hello World") //!< 输出 Hello World
        }
    }
    /// 子类中重写父类的方法 + override
    class SubClass: SuperClass {
        override func sayHelloWorld() {
            print("Hello World I am Wang") //!< 输出 Hello World I am Wang
        }
    }
//    (方法)重载:简单来说就是方法名相同,但是参数列表不同. 这样同名不同参的方法之间互相称之为重载方法.
    /// 子类中重载父类的方法
    class SubClass2: SuperClass {
        /// sayHelloWorld(name: "WangZH")
        func sayHelloWorld(name: String) {
            super.sayHelloWorld()
            print("Hello World I am \(name)") //!< 输出 Hello World I am WangZH
        }
    }
}
