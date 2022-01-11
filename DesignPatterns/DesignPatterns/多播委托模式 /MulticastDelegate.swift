//
//  MulticastDelegate.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/1.
//

import Foundation

final class MulticastDelegate<ProtocolType> {

    // MARK: - Helper Types

    private final class DelegateWrapper {
        weak var delegate: AnyObject?
        init(delegate: AnyObject) { self.delegate = delegate }
    }

    // MARK: - Properties

    private var delegateWrappers: [DelegateWrapper]
    private var delegates: [ProtocolType] {
        delegateWrappers = delegateWrappers.filter { $0.delegate != nil }
        return delegateWrappers.map { $0.delegate } as! [ProtocolType]
    }

    // MARK: - Initializers

    init(delegates: [ProtocolType] = []) {
        delegateWrappers = delegates
            .map { DelegateWrapper(delegate: $0 as AnyObject)}
    }

    // MARK: - Delegate Management

    func addDelegate(_ delegate: ProtocolType) {
        let wrapper = DelegateWrapper(delegate: delegate as AnyObject)
        delegateWrappers.append(wrapper)
    }

    func removeDelegate(_ delegate: ProtocolType) {
        guard let index = delegateWrappers
            .index(where: { $0.delegate === (delegate as AnyObject)}) else {
                return
        }
        delegateWrappers.remove(at: index)
    }

    func notifyDelegates(_ closure: (ProtocolType) -> Void) {
        delegates.forEach { closure($0) }
    }
}

//代理协议
protocol FireEmergencyResponding: class {
    func notifyFire(at location: String)
}

//代理
final class FireStation: FireEmergencyResponding {
    func notifyFire(at location: String) {
        print("已经通知消防员在\(location)发生了火灾")
    }
}

final class HospitalEmergencyCenter: FireEmergencyResponding {
    func notifyFire(at location: String) {
        print("已经通知医护人员在\(location)发生了火灾")
    }
}

//需要代理的对象
final class SecurityCenter {
    static let shared = SecurityCenter()
    let multicastDelegate = MulticastDelegate<FireEmergencyResponding>()
}
