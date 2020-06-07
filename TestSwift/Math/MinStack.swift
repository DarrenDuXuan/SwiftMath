//
//  MinStack.swift
//  TestSwift
//
//  Created by darren on 2020/5/21.
//  Copyright © 2020 杜璇. All rights reserved.
//

import UIKit

class MinStack: NSObject {
    var stackTop: Int?
    var stack: [Int]
    var stackMin: [Int]

    
    /** initialize your data structure here. */
    override init() {
        stack = [Int]()
        stackTop = nil
        stackMin = [Int]()
    }
    
    func push(_ x: Int) {
        stackTop = x
        stack.append(x)
        if stackMin.isEmpty {
            stackMin.append(x)
        } else if x <= stackMin.last! {
            stackMin.append(x)
        }
    }
    
    func pop() {
        let top = stack.removeLast()
        if top == stackMin.last! {
            stackMin.removeLast()
        }
        stackTop = stack.last
    }
    
    func top() -> Int {
        return stackTop!
    }
    
    func getMin() -> Int {
        return stackMin.last!
    }
    
    func length() -> Int {
        return stack.count
    }
}
