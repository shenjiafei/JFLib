//
//  WeiboAuthenticatorAdapter.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/1.
//

import Foundation

final class WeiboAuthenticatorAdapter: AuthenticationServiceable {

    private lazy var authenticator = WeiboAuthenticator()

    func login(email: String,
               password: String,
               success: (User, Token) -> Void,
               failure: (Error?) -> Void) {

        authenticator.login(email: email, password: password) { (weiboUser, error) in
            guard let weiboUser = weiboUser else {
                failure(error)
                return
            }
            
            let user = User(username: weiboUser.username,
                            email: weiboUser.email)
            let token = Token(value: weiboUser.token)
            success(user, token)
        }
    }
}

