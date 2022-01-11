import UIKit

//测试链表
//let node1 = LinkedListNode(value: 1)
//let node2 = LinkedListNode(value: 2)
//let node3 = LinkedListNode(value: 3)
//
//node1.next = node2
//node2.next = node3
//
//print(node1)

// 结果
//1 -> 2 -> 3


//测试链表
//var stack = Stack<Int>()
//stack.push(1)
//stack.push(2)
//stack.push(3)
//stack.push(4)
//
//print(stack)
//
//stack.pop()
//
//print(stack)

//测试队列
//var queue = Queue<Int>()
//queue.enqueue(1)
//queue.enqueue(2)
//queue.enqueue(3)
//queue.enqueue(4)
//
//print(queue)
//
//queue.dequeue()
//
//print(queue)

//// 结果
//[1, 2, 3, 4]
//[2, 3, 4]


let products = TreeNode("Products")

let phone = TreeNode("Phone")
let computer = TreeNode("Computer")

products.addChild(phone)
products.addChild(computer)

let iPhone8 = TreeNode("iPhone 8")
let iPhone8Plus = TreeNode("iPhone 8 Plus")
let iPhoneX = TreeNode("iPhone X")

let macBookPro = TreeNode("MacBook Pro")
let iMac = TreeNode("iMac")
let iMacPro = TreeNode("iMacPro")

phone.addChild(iPhone8)
phone.addChild(iPhone8Plus)
phone.addChild(iPhoneX)

computer.addChild(macBookPro)
computer.addChild(iMac)
computer.addChild(iMacPro)

//products.traverseDepthFirst { print($0.value) }
products.traverseLevelOrder { print($0.value) }
