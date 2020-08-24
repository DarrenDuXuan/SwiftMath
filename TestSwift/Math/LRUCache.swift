//
//  LRUCache.swift
//  TestSwift
//
//  Created by darren on 2020/8/24.
//  Copyright © 2020 杜璇. All rights reserved.
//

import UIKit

/*
    运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制。它应该支持以下操作： 获取数据 get 和 写入数据 put 。

    获取数据 get(key) - 如果关键字 (key) 存在于缓存中，则获取关键字的值（总是正数），否则返回 -1。
    写入数据 put(key, value) - 如果关键字已经存在，则变更其数据值；如果关键字不存在，则插入该组「关键字/值」。当缓存容量达到上限时，它应该在写入新数据之前删除最久未使用的数据值，从而为新的数据值留出空间。

     

    进阶:

    你是否可以在 O(1) 时间复杂度内完成这两种操作？

     

    示例:

    LRUCache cache = new LRUCache( 2 /* 缓存容量 */ );

    cache.put(1, 1);
    cache.put(2, 2);
    cache.get(1);       // 返回  1
    cache.put(3, 3);    // 该操作会使得关键字 2 作废
    cache.get(2);       // 返回 -1 (未找到)
    cache.put(4, 4);    // 该操作会使得关键字 1 作废
    cache.get(1);       // 返回 -1 (未找到)
    cache.get(3);       // 返回  3
    cache.get(4);       // 返回  4
 */

class LRUCache: NSObject {
    
    class LRUNode: NSObject {
        var val : Int = 0
        var key : Int = 0
        var prev : LRUNode?
        var next : LRUNode?
        
        init(_ val: Int, _ key: Int) {
            self.val = val
            self.key = key
        }
    }
    
    var dict = [Int:LRUNode]()
    var count : Int = 0
    var capacity : Int = 0
    var head = LRUNode(0, 0)
    var tail = LRUNode(0, 0)
    
    init(_ capacity: Int) {
        self.capacity = capacity
        
        head.next = tail
        tail.prev = head
    }
    
    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            removeLRUNode(node)
            moveNodeToFirst(node)
            return node.val
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = dict[key] {
            node.val = value
            
            removeLRUNode(node)
            moveNodeToFirst(node)
        } else {
            if count == capacity {
                let _ = removeLast()
            } else {
                count += 1
            }
            
            let node = LRUNode(value, key)
            moveNodeToFirst(node)
        }
    }
    
    func removeLRUNode(_ node: LRUNode) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
        dict[node.key] = nil
    }
    
    func moveNodeToFirst(_ node: LRUNode) {
        head.next?.prev = node
        node.next = head.next
        head.next = node
        node.prev = head
        dict[node.key] = node
    }
    
    func removeLast() -> LRUNode? {
        let tempNode = tail.prev!
        removeLRUNode(tempNode)
        dict[tempNode.key] = nil
        return tempNode
    }
}
