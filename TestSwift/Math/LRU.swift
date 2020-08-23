//
//  LRU.swift
//  TestSwift
//
//  Created by darren on 2020/8/2.
//  Copyright © 2020 杜璇. All rights reserved.
//

import UIKit

private class LRUNode {
    var key : String?
    var val: Int
    var pre : LRUNode?
    var next : LRUNode?
    public init(_ val: Int) {
        self.val = val
    }
}

private class LRUNodelDoubleList {
    // 头节点
    private var head:LRUNode?
    //尾节点
    private var tail:LRUNode?
    
    private var size:Int = 0
    public init() {
        size = 0
        head = LRUNode(0)
        tail = LRUNode(0)
        
        head?.next = tail
        tail?.pre = head
    }
    
    func addLast(_ node:LRUNode?) {
        if node == nil {
            return
        }
        
        tail?.pre?.next = node
        node?.next = tail
        
        node?.pre = tail?.pre
        tail?.pre = node
        
        size += 1
    }
    
    func remove(_ node:LRUNode?) {
        if node == nil {
            return
        }
        
        node?.pre?.next = node?.next
        node?.next?.pre = node?.pre
        
        size -= 1
    }
    
    func removeFirst() -> LRUNode? {
        if head?.next === tail {
            return nil
        }
        
        let first = head?.next
        self.remove(first)
        return first
    }
}

final class LRU: NSObject {
    private var hashMap:[Int:LRUNode]
    private var cache:LRUNodelDoubleList
    private var maxCount:Int
    
    public init(_ maxCount: Int) {
        self.maxCount = maxCount
        self.hashMap = [Int:LRUNode]()
        self.cache = LRUNodelDoubleList()
    }
}
