//
//  Stack.swift
//  AlgorithmDemo
//
//  Created by shenjiafei on 2021/6/29.
//

import Foundation
//自己实现一个栈
struct Stack<Element> {
    private var elements: [Element] = []
    init() { }
}

extension Stack: CustomStringConvertible {
    var description: String {
        let topDivider = "====top====\n"
        let bottomDivider = "\n====bottom====\n"
        let stackElements = elements
            .reversed()
            .map { "\($0)" }
            .joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}

// MARK: - Push & Pop
extension Stack {
    mutating func push(_ element: Element) {
        elements.append(element)
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        return elements.popLast()
    }
}

// MARK: - Getters
extension Stack {
    var top: Element? {
        return elements.last
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
}
