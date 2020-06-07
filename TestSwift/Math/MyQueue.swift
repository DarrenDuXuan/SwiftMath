//
//  MyQueue.swift
//  TestSwift
//
//  Created by darren on 2020/5/24.
//  Copyright © 2020 杜璇. All rights reserved.
//

import UIKit

class MyQueue: NSObject {
    var list = [Int]()
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        list.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        let first = list.removeFirst()
        return first
    }
    
    /** Get the front element. */
    func peek() -> Int {
        return list.first!
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return list.count == 0
    }
}
