//
//  Customer.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/1.
//

import Foundation

// MARK: - Customer
struct Customer {
    let id: String
    var address: String
    var name: String
}
//因为后面要把他们作为字典的key，所以都实现了Hashable协议。
extension Customer: Hashable {
    var hashValue: Int {
        return id.hashValue
    }

    static func ==(lhs: Customer, rhs: Customer) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - Product
struct Product {
    let id: String
    var name: String
    var price: Double
}
extension Product: Hashable {
    var hashValue: Int {
        return id.hashValue
    }

    static func ==(lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
}


//InventoryDatabase和ShippingDatabase数据库
//InventoryDatabase记录了某个产品对应的数量有多少个；ShippingDatabase记录了某个客户对应的待发货的产品。
final class InventoryDatabase {
    var inventory: [Product: Int] = [:]
    init(inventory: [Product: Int]) { self.inventory = inventory }
}

final class ShippingDatabase {
    var pendingShipments: [Customer: [Product]] = [:]
}



final class OrderFacade {
    let inventoryDatabase: InventoryDatabase
    let shippingDatabase: ShippingDatabase

    init(inventoryDatabase: InventoryDatabase,
         shippingDatabase: ShippingDatabase) {
        self.inventoryDatabase = inventoryDatabase
        self.shippingDatabase = shippingDatabase
    }

    func placeOrder(for product: Product, by customer: Customer) {
        let productCount = inventoryDatabase.inventory[product, default: 0]

        guard productCount > 0 else {
            print("\(product.name)缺货")
            return
        }

        inventoryDatabase.inventory[product] = productCount - 1

        var pendingShipmentProducts = shippingDatabase.pendingShipments[customer, default: []]
        pendingShipmentProducts.append(product)
        shippingDatabase.pendingShipments[customer] = pendingShipmentProducts

        print("\(customer.name)购买了\(product.name)")
    }
}
