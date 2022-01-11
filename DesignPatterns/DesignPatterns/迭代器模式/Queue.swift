//
//  Queue.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/1.
//

import Foundation

struct Queue<T> {
    private var array: [T?] = []
    private var head = 0
    
    var isEmpty: Bool {
        return count == 0
    }
    
    var count: Int {
        return array.count - head
    }
    
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard head < array.count,
            let element = array[head] else {
                return nil
        }
        array[head] = nil
        head += 1
        return element
    }
}

//Sequence协议有两个要求：1）关联值类型，也就是迭代器的类型，在上面的代码中，关联值类型是IndexingIterator，这是所有集合类型的默认迭代器类型。2）实现makeIterator()方法。
extension Queue: Sequence {
    func makeIterator() -> IndexingIterator<ArraySlice<T?>> {
        let values = array[head..<array.count]
        return values.makeIterator()
    }
}

//Swift里面有迭代器协议IteratorProtocol，但是我们不需要直接去遵循这个协议，而是通过遵循Sequence来实现，好处是我们不需要自己自定义一个迭代器，而且还可以获得集合的很多方法，例如filter、map和sort等等。

