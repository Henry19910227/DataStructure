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
}

//MARK: - Public
extension LinkedList {
    
    /// 加入節點
    public func append(value: T) {
        
        let node = Node(value: value)
        if let lastNode = last {
            lastNode.next = node
            node.previous = lastNode
        } else {
            head = node
        }
    }
    
    /// 取出某個節點的值
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
    
    /// 插入節點
    public func insert(value: T, index: UInt) {
        
        let (previousNode, nextNode) = nodeBeforeAndAfter(index: index)
        
        let node = Node(value: value)
        node.previous = previousNode
        node.next = nextNode
        
        nextNode?.previous = node
        
        guard let prevNode = previousNode else {
            head = node
            return
        }
        prevNode.next = node
        
    }
    
    /// 刪除某個節點
    @discardableResult
    public func removeAt(_ index: UInt) -> T? {
        
        guard let node = nodeAt(index) else {
            return nil
        }
        
        return remove(node: node)
    }
    
    /// 展示全部節點
    public func showAll() {
        
        guard var node = head else {
            return
        }
        
        print(node.value)
        while case let next? = node.next {
            print(next.value)
            node = next
        }
    }
    
    public subscript(index: UInt) -> T {
        let node = nodeAt(index)
        assert(node != nil)
        return node!.value
    }
}

extension LinkedList {
    
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
    
    private func remove(node: Node) -> T {
        
        let previousNode = node.previous
        let nextNode = node.next
        
        previousNode?.next = nextNode
        nextNode?.previous = previousNode
        
        node.previous = nil
        node.next = nil
        
        if previousNode == nil {
            head = nextNode
        }
        
        return node.value
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
