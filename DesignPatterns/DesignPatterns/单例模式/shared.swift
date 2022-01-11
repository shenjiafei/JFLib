//
//  shared.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/1.
//

import Foundation


//通常以shared、default、standard命名的，都是用单例。
//UIApplication.shared
//
//NotificationCenter.default
//
//UserDefaults.standard
//
//URLSession.shared
//
//FileManager.default

class MySingleton {
    static let shared = MySingleton()
    private init() { }
}

let singleton = MySingleton.shared
//let singleton2 = MySingleton() // 报错


//另外一种单例，可以创建多个实例
let defaultFileManager = FileManager.default
let customFileManager = FileManager()

//自定义 只需要把 private 去掉即可
//class MySingleton {
//    static let shared = MySingleton()
//    init() { }
//}
//
//let singleton = MySingleton.shared
//let singleton2 = MySingleton()


//单例模式最大的问题是测试。如果有多个状态存储在一个单例中，测试案例的顺序跟单例的状态有密切的联系，那么在测试的时候就会比较麻烦。
