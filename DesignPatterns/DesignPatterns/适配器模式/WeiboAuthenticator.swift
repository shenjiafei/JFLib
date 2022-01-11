//
//  WeiboAuthenticator.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/1.
//

import Foundation



struct Token {
    let value: String
}

protocol AuthenticationServiceable {
    func login(email: String,
               password: String,
               success: (User, Token) -> Void,
               failure: (Error?) -> Void)
}

//假设下面的api来自第三方库，不能直接被修改：
public struct WeiboUser {
    public let username: String
    public let email: String
    public let token: String
}

public final class WeiboAuthenticator {
    public func login(email: String,
                      password: String,
                      completion: (WeiboUser?, Error?) -> Void) {

        let token = "a_token_value"
        let username = "a_user_name"
        let user = WeiboUser(username: username,
                             email: email,
                             token: token)
        completion(user, nil)
    }
}
