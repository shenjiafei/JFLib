//
//  Copying.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/1.
//

import Foundation

protocol Copying: class {
    init(_ prototype: Self)
}

extension Copying {
    func copy() -> Self {
        return type(of: self).init(self)
    }
}

//宠物，遵循 copy 协议
class Pet: Copying {
    var name: String
    var weight: Double

    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }

    // MARK: - Copying

    required convenience init(_ pet: Pet) {
        self.init(name: pet.name, weight: pet.weight)
    }
}

