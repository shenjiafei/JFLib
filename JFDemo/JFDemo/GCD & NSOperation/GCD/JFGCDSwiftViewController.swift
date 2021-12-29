//
//  JFGCDSwiftViewController.swift
//  XueLeTS
//
//  Created by shenjiafei on 2021/1/9.
//  Copyright © 2021 net.xuele. All rights reserved.
//

import UIKit

class JFGCDSwiftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func swiftCode() {
        //    swift版本
//      定义DispatchQueue
        let concurrentQueue = DispatchQueue.init(label: "concurrentQueue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil);

//        定义DispatchWorkItem
        let block = DispatchWorkItem.init(block: {
           print("normal do some thing...")
        })

        let qosBlock = DispatchWorkItem.init(qos: .default, flags: .noQoS, block: {
           print("qos do some thing...")
        })
//        DispatchQueue 对象执行 包含 DispatchWorkItem 的 blcok
        concurrentQueue.async(execute: block);
        
//      or 直接再主线程里执行 block
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.1) {
            print("延迟0.01s后执行")
        }
    }
    
    /*演示 监听 block 执行结束
    long dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout);
     
     public func wait()
     public func wait(timeout: DispatchTime) -> DispatchTimeoutResult
     public func wait(wallTimeout: DispatchWallTime) -> DispatchTimeoutResult
    */
    func controlTest() {
        let concurrentQueue = DispatchQueue.init(label: "concurrentQueue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil);

        concurrentQueue.async(execute: {
            let allTesksQueue = DispatchQueue.init(label: "allTesksQueue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil);

            let workItem = DispatchWorkItem.init(block: {
                print("开始执行")
                sleep(3)
                print("结束执行")
            })

            allTesksQueue.async(execute: workItem)
            
            // 设置超时时间，超时时间为 10s
            let timeout = DispatchTime.now() + 10
            let result = workItem.wait(timeout: timeout)

            if result == .success {
                print("执行成功")
            } else {
                print("执行超时")
            }
        })
        
    }
    
    /*演示 方法二 DispatchWorkItem 的实例方法进行
 public func notify(qos: DispatchQoS = default, flags: DispatchWorkItemFlags = default, queue: DispatchQueue, execute: @escaping @convention(block) () -> Swift.Void)

 public func notify(queue: DispatchQueue, execute: DispatchWorkItem)
 */
    func controlTest2() {
        print("---- 开始设置任务 ----")

        let tasksQueue = DispatchQueue.init(label: "com.fyf.tasksQueue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil);

        let refreshUIWorkItem = DispatchWorkItem.init(block: {
            print("更新 UI")
        })

        let tasksWorkItem = DispatchWorkItem.init(block: {
            print("开始耗时任务")
            sleep(3)
            print("完成耗时任务")
        })

        tasksWorkItem.notify(queue: DispatchQueue.main, execute: refreshUIWorkItem)
        tasksQueue.async(execute: tasksWorkItem)

        print("---- 完成设置任务 ----")
    }
    
    /*演示 取消线程
    可以使用 DispatchWorkItem 的实例方法进行设置
    */
    func cancelTest() {
        let tasksQueue = DispatchQueue.init(label: "com.fyf.tasksQueue");

        let firstWorkItem = DispatchWorkItem.init(block: {
            print("开始第一个任务")
            sleep(2)
            print("结束第一个任务")
        })

        let secondWorkItem = DispatchWorkItem.init(block: {
            print("开始第二个任务")
            sleep(2)
            print("结束第二个任务")
        })

        tasksQueue.async(execute: firstWorkItem)
        tasksQueue.async(execute: secondWorkItem)

        // 等待 1s，让第一个任务开始运行
        sleep(1)

        firstWorkItem.cancel()
        print("尝试过取消第一个任务")
        secondWorkItem.cancel()
        print("尝试过取消第二个任务")
    }
    
    func customUse() {
        //异步执行
        DispatchQueue.main.async {
            
        }
        // 延迟异步执行 延迟1s 后执行
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.0) {
//
//        }
//
//        DispatchQueue.global()
    }
 
}
