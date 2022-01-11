//
//  TreeNode.swift
//  AlgorithmDemo
//
//  Created by shenjiafei on 2021/6/29.
//

import Foundation

final class TreeNode<T> {
    var value: T
    private(set) var children: [TreeNode] = []
    
    init(_ value: T) {
        self.value = value
    }
    
    func addChild(_ child: TreeNode) {
        children.append(child)
    }
}

// MARK: - Traverse
extension TreeNode {
    func traverseDepthFirst(_ closure: (TreeNode) -> Void) {
        closure(self)
        children.forEach {
            $0.traverseDepthFirst(closure)
        }
    }
    
    func traverseLevelOrder(_ closure: (TreeNode) -> Void) {
        closure(self)
        var queue = Queue<TreeNode>()
        children.forEach { queue.enqueue($0) }
        while let node = queue.dequeue() {
            closure(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }
}
