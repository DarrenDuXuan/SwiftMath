//
//  Node.swift
//  TestSwift
//
//  Created by darren on 2020/6/18.
//  Copyright © 2020 杜璇. All rights reserved.
//

import UIKit

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

class NodeClass: NSObject {
    //MARK: - N叉树的后序遍历
    func postorder(_ root: Node?) -> [Int] {
        if root == nil {
            return []
        }
        var nodeList = [Int]()
        postorderHelper(root, &nodeList)
        return nodeList
    }
    
    private func postorderHelper(_ root: Node?, _ list: inout [Int]) {
        if root == nil {
            return
        }
        
        for node in root!.children {
            postorderHelper(node, &list)
        }
        list.append(root!.val)
    }
}
