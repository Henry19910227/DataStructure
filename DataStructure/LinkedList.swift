//
//  LinkedListNode.swift
//  DataStructure
//
//  Created by 廖冠翰 on 2019/1/8.
//  Copyright © 2019 廖冠翰. All rights reserved.
//

import UIKit

class LinkedList<T> {
    
    public typealias Node = LinkedListNode<T>
    
    private var head: Node?
    
    public var last: Node? {
        
        guard var node = head else {
            return nil
        }
        
        while case let next? = node.next {
            node = next
        }
        return node
    }
    
    public var count: Int {
    
        guard var node = head else {
            return 0
        }
        
        var count = 1
        while case let next? = node.next {
            node = next
            count += 1
        }
        
        return count
    }
    
    public var isEmpty: Bool? {
        return head == nil
    }
    
    /// 加入Node
    public func append(value: T) {
        
        let node = Node(value: value)
        if let lastNode = last {
            lastNode.next = node
            node.previous = lastNode
        } else {
            head = node
        }
    }
    
    public func nodeAt(_ index: UInt) -> Node? {
        
        guard count > 0 && (count - 1) >= index else {
            return nil
        }
        
        var node = head!
        for _ in 0..<index {
            if let nextNode = node.next {
                node = nextNode
            } else {
                return node
            }
        }
        
        return node
    }
    
    public func insert(value: T, index: UInt) {
        
    }
    
    public subscript(index: UInt) -> T {
        let node = nodeAt(index)
        assert(node != nil)
        return node!.value
    }
    
    private func nodeBeforeAndAfter(index: UInt) -> (Node?, Node?) {
        
        assert(count > 0 && (count - 1) >= index)
        
        var previousNode: Node?
        var nextNode = head
        for _ in 0..<index {
            
            previousNode = nextNode
            nextNode = nextNode?.next
        }
    
        return (previousNode, nextNode)
    }
}



class LinkedListNode<T> {

    public var value: T
    
    public var next: LinkedListNode?
    
    weak var previous: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
    
}
