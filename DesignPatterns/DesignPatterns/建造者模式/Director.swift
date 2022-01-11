//
//  Director.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/1.
//

import Foundation

class Employee {
    private let builder = HamburgerBuilder()

    func createBeefHamburger() -> Hamburger {
        builder.setMeat(.beef)
        builder.addSauces(.ketchup)
        builder.addToppings([.lettuce, .tomatoes])
        return builder.build()
    }

    func createChickenHamburger() -> Hamburger {
        let builder = HamburgerBuilder()
        builder.setMeat(.chicken)
        builder.addSauces(.mustard)
        builder.addToppings([.lettuce, .tomatoes])
        return builder.build()
    }
}
