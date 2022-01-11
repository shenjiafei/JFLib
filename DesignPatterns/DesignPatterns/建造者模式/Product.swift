//
//  Product.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/1.
//

import Foundation

struct Hamburger {
    let meat: Meat
    let toppings: Toppings
    let sauces: Sauces
}
extension Hamburger: CustomStringConvertible {
    var description: String {
        return meat.rawValue + " Hamburger"
    }
}

enum Meat: String {
    case beef
    case chicken
}
//配料
struct Toppings: OptionSet {
    static let cheese = Toppings(rawValue: 1 << 0)
    static let lettuce = Toppings(rawValue: 1 << 1)
    static let tomatoes = Toppings(rawValue: 1 << 2)

    let rawValue: Int

    init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
//调味汁
struct Sauces: OptionSet {
//    芥末
    static let mustard = Sauces(rawValue: 1 << 0)
//    番茄酱
    static let ketchup = Sauces(rawValue: 1 << 1)

    let rawValue: Int

    init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
