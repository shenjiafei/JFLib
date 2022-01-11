//
//  Mediator.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/1.
//

import Foundation

protocol Colleague: class {
    func colleague(_ colleague: Colleague?,
                   didSendMessage message: String)
}

protocol MediatorProtocol: class {
    func addColleague(_ colleague: Colleague)
    func didSendMessage(_ message: String, by colleague: Colleague)
}

class Mediator<ColleagueType> {
    private(set) var colleagues: [ColleagueType] = []
    
    // MARK: - Manage Colleague
    
    func addColleague(_ colleague: ColleagueType) {
        colleagues.append(colleague)
    }
    
    func removeColleague(_ colleague: ColleagueType) {
        guard let index = colleagues
            .index(where: { ($0 as AnyObject) === (colleague as AnyObject)}) else {
                return
        }
        colleagues.remove(at: index)
    }
    
    func invokeColleagues(closure: (ColleagueType) -> Void) {
        colleagues.forEach(closure)
    }
    
    func invokeColleagues(by colleague: ColleagueType,
                          closure: (ColleagueType) -> Void) {
        colleagues.forEach {
            guard ($0 as AnyObject) !== (colleague as AnyObject) else { return }
            closure($0)
        }
    }
}

final class SecurityStaff {
    var name: String
    weak var mediator: MediatorProtocol?
    
    init(name: String, mediator: MediatorProtocol) {
        self.name = name
        self.mediator = mediator
        mediator.addColleague(self)
    }
    
    func sendMessage(_ message: String) {
        print("\(name) 发送：\(message)")
        mediator?.didSendMessage(message, by: self)
    }
}

extension SecurityStaff: Colleague {
    func colleague(_ colleague: Colleague?,
                   didSendMessage message: String) {
        print("\(name) 收到: \(message)")
    }
}

final class SecurityStaffMediator: Mediator<Colleague> { }

extension SecurityStaffMediator: MediatorProtocol {
    func didSendMessage(_ message: String, by colleague: Colleague) {
        invokeColleagues(by: colleague) {
            $0.colleague(colleague, didSendMessage: message)
        }
    }
}

