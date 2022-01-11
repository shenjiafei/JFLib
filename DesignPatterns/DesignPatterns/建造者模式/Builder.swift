//
//  Builder.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/1.
//

import Foundation

class HamburgerBuilder {
//    这里用private 防止被外部篡改
    private(set) var meat: Meat = .chicken
    private(set) var toppings: Toppings = []
    private(set) var sauces: Sauces = []

    func setMeat(_ meat: Meat) {
        self.meat = meat
    }

    func addToppings(_ toppings: Toppings) {
        self.toppings.insert(toppings)
    }

    func removeToppings(_ toppings: Toppings) {
        self.toppings.remove(toppings)
    }

    func addSauces(_ sauces: Sauces) {
        self.sauces.insert(sauces)
    }

    func removeSauces(_ sauces: Sauces) {
        self.sauces.remove(sauces)
    }

    func build() -> Hamburger {
        return Hamburger(meat: meat,
                         toppings: toppings,
                         sauces: sauces)
    }
}
