//
//  Stack.swift
//  TestSwift
//
//  Created by darren on 2020/6/2.
//  Copyright © 2020 杜璇. All rights reserved.
//

import UIKit

class Stack: NSObject {

    var stackList = [String]()
    
    
    func push(_ x: String!) {
        stackList.append(x)
    }
    
    func count() -> Int {
        return stackList.count
    }
    
    func pop() -> String {
        return stackList.removeLast()
    }
    
    func top() -> String? {
        return stackList.last
    }
}
