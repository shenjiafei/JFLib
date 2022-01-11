//
//  EmailFactory.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/1.
//

import Foundation

//当想要把实例的创建逻辑独立出来，可以使用工厂模式。但如果想要的实例非常简单，直接在用到的地方直接创建即可。如果这个实例需要一系列的步骤才能创建，最好使用Builder模式。

struct EmailFactory {

    let senderEmail: String

    func createEmail(to recipient: JobApplicant, messageBody: String? = nil) -> Email {
        switch recipient.status {
        case .new:
            return Email(
                subject: "已收到你的求职申请",
                messageBody: messageBody ?? "感谢你申请我们的职位，我们会在24小时内回复你。",
                recipientEmail: recipient.email,
                senderEmail: senderEmail)

        case .interview:
            return Email(
                subject: "面试邀请",
                messageBody: messageBody ?? "你的简历已经通过筛选，请于明天上午10点到我们公司面试。",
                recipientEmail: recipient.email,
                senderEmail: senderEmail)

        case .hired:
            return Email(
                subject: "你已通过面试",
                messageBody: messageBody ?? "恭喜你，你已经通过我们公司的面试，请于下周一到我们公司报道。",
                recipientEmail: recipient.email,
                senderEmail: senderEmail)

        case .rejected:
            return Email(
                subject: "面试未通过",
                messageBody: messageBody ?? "因不符合我公司的要求，此次面试不通过。谢谢！",
                recipientEmail: recipient.email,
                senderEmail: senderEmail)
        }
    }
}
