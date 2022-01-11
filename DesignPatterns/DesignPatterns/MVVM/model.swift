//
//  model.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/1.
//

import Foundation

struct UsersResults: Codable {
    let users: [User]
}

struct User: Codable {
    var userID: String?
    var username: String?
    var email: String?
    var password: String?
}
