//
//  JobApplicant.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/1.
//

import Foundation

//求职者
struct JobApplicant {
    let name: String
    let email: String
    var status: Status

    enum Status {
        case new
        case interview
        case hired
        case rejected
    }
}

struct Email {
    let subject: String
    let messageBody: String
    let recipientEmail: String
    let senderEmail: String
}

extension Email: CustomStringConvertible {
    var description: String {
        return subject + messageBody + recipientEmail + senderEmail
    }
}
