//
//  Tree.swift
//  TestSwift
//
//  Created by darren on 2020/5/13.
//  Copyright © 2020 杜璇. All rights reserved.
//

import UIKit

class TreeNode : NSObject {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}



class Tree: NSObject {
    //MARK: - 二叉树的遍历
    /*
     给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）。

      

     示例：
     二叉树：[3,9,20,null,null,15,7],

         3
        / \
       9  20
         /  \
        15   7
     返回其层次遍历结果：

     [
       [3],
       [9,20],
       [15,7]
     ]
     */
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if (root == nil) {
            return []
        }
        
        var resNumList = [[Int]]()
        var nodeList = [TreeNode]()
        nodeList.append(root!)
        
        while !nodeList.isEmpty {
            var tempNumList = [Int]()
            for _ in 0...nodeList.count {
                let node = nodeList.removeFirst()
                tempNumList.append(node.val)
                if let left = node.left {
                    nodeList.append(left)
                }
                if let right = node.right {
                    nodeList.append(right)
                }
            }
            resNumList.append(tempNumList)
        }
        
        return resNumList
    }
    
    //MARK: - 二叉树的中序遍历
    /*
     94. 二叉树的中序遍历
     给定一个二叉树，返回它的中序 遍历。

     示例:

     输入: [1,null,2,3]
        1
         \
          2
         /
        3

     输出: [1,3,2]
     */
    var list = [Int]()
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if (root == nil) {
            return []
        }
        let _ = inorderTraversal(root?.left)
        
        let val = root?.val
        list.append(val!)
        
        let _ = inorderTraversal(root?.right)
        return list
    }
    
    func inorderTraversal2(_ root: TreeNode?) -> [Int] {
        var nList = [Int]()
        var nodeList = [TreeNode]()
        var curNode = root
        
        while curNode != nil || !nodeList.isEmpty {
            if curNode != nil {
                nodeList.append(curNode!)
                curNode = curNode!.left
            } else {
                let node = nodeList.removeLast()
                let val = node.val
                nList.append(val)
                curNode = node.right
            }
        }
        
        return nList
    }
    
    //MARK: - 不修改原树，二叉树的合并
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if (t1==nil && t2 == nil) {
            return nil
        }
        
        var t1Value = 0, t2Value = 0
        if let value = t1?.val {
            t1Value = value
        }
        
        if let value = t2?.val {
            t2Value = value
        }
        
        let value = t1Value + t2Value
        let node = TreeNode(value)
        
        node.left = mergeTrees(t1?.left, t2?.left)
        node.left = mergeTrees(t1?.right, t2?.right)
        
        return node
    }
    
    //MARK: - 修改原树，二叉树的合并
    func mergeTrees1(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if (t1 == nil) {
            return t2
        }
        
        if (t2 == nil) {
            return t1
        }
        
        var t1Val = 0, t2Val = 0
        if let val = t1?.val {
            t1Val = val
        }
        
        if let val = t2?.val {
            t2Val = val
        }
        
        t1Val += t2Val;
        t1?.val = t1Val
        
        t1?.left = mergeTrees1(t1?.left, t2?.left)
        t1?.right = mergeTrees1(t1?.right, t2?.right)
        
        return t1
    }
    
    //MARK: - 二叉树的合并，迭代
    func mergeTrees2(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if (t1 == nil) {
            return t2
        }
        
        if (t2 == nil) {
            return t1
        }
        
        var lists = [[TreeNode]]()
        
        lists.append([t1!, t2!])
        
        while !lists.isEmpty {
            
            for _ in 0..<lists.count {
                var tempLit = [TreeNode]()
                
                let removeNodeList = lists.removeFirst()
                
                var t1Val = 0, t2Val = 0
                if let val = removeNodeList.first?.val {
                    t1Val = val
                }
                
                if let val = removeNodeList.last?.val {
                    t2Val = val
                }
                
                let val = t1Val + t2Val
                removeNodeList.first?.val = val
                
                let t1Left = removeNodeList.first!.left
                let t2Left = removeNodeList.last!.left
                
                if t1Left != nil && t2Left != nil {
                    tempLit.append(t1Left!)
                    tempLit.append(t2Left!)
                    lists.append(tempLit)
                } else if t1Left == nil {
                    removeNodeList.first!.left = t2Left
                    removeNodeList.last!.left = nil
                }
                
                let t1Right = removeNodeList.first!.right
                let t2Right = removeNodeList.last!.right
                
                if t1Right != nil && t2Right != nil {
                    tempLit.append(t1Right!)
                    tempLit.append(t2Right!)
                    lists.append(tempLit)
                } else if t1Left == nil {
                    removeNodeList.first!.right = t2Right
                    removeNodeList.last!.right = nil
                }
            }
        }
        
        return t1
    }
    
    //MARK: - 二叉树最大深度
    /*
     给定一个二叉树，找出其最大深度。

     二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

     说明: 叶子节点是指没有子节点的节点。

     示例：
     给定二叉树 [3,9,20,null,null,15,7]，

         3
        / \
       9  20
         /  \
        15   7
     返回它的最大深度 3 。
     */
    func maxDepth(_ root: TreeNode?) -> Int {
        if (root == nil) {
            return 0
        }
        // 1. BFS广度优先
        var length = 0
        
        var list = [TreeNode]()
        list.append(root!)
        while !list.isEmpty {
            
            length += 1
            
            for _ in 0..<list.count {
                
                let rNodel = list.removeFirst()
                
                if let left = rNodel.left {
                    list.append(left)
                }
                
                if let right = rNodel.right {
                    list.append(right)
                }
            }
        }
        
        return length
    }
    
    var tempLength : Int = 0;
    func maxDepthDFS(_ root: TreeNode?) -> Int {
        // 2. DFS深度优先
        _maxDepthDFS(root, 0)
        return tempLength
    }

    private func _maxDepthDFS(_ root: TreeNode?, _ len: Int) {
        if (root == nil) {
            return;
        }
        
        if (len > tempLength) {
            tempLength = len + 1
        }
        _maxDepthDFS(root?.left, len + 1)
        _maxDepthDFS(root?.right, len + 1)
    }
    
    /*
     538. 把二叉搜索树转换为累加树
     
     给定一个二叉搜索树（Binary Search Tree），把它转换成为累加树（Greater Tree)，使得每个节点的值是原来的节点值加上所有大于它的节点值之和。

      

     例如：

     输入: 原始二叉搜索树:
                   5
                 /   \
                2     13

     输出: 转换为累加树:
                  18
                 /   \
               20     13
     */
    // MARK: - 递归把二叉搜索树转换为累加树
    var num : Int! = 0
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        if (root == nil) {
            return nil
        }

        let _ = convertBST(root?.right)
        
        root?.val += num
        num = root?.val
        
        let _ = convertBST(root?.left)
        
        return root
    }
    
    // MARK: - 遍历把二叉搜索树转换为累加树
    func convertBST1(_ root: TreeNode?) -> TreeNode? {
        if (root == nil) {
            return nil
        }

        var tRoot = root
        var rootList = [TreeNode]()
        
        while tRoot != nil || rootList.count != 0 {
            while tRoot != nil {
                rootList.append(tRoot!)
                tRoot = tRoot?.right
            }
            
            tRoot = rootList.removeLast()
            tRoot?.val += num
            num = tRoot?.val
            if tRoot?.left == nil {
                tRoot = nil
            } else {
                tRoot = tRoot?.left
            }
        }
        return root
    }
    
    /*
     路径总和
     */
    //MARK: - 二叉树路径总和
    var pathNum : Int = 0;
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        if (root == nil) {
            return 0
        }
        
        findPathSum(root, sum)
        let _ = pathSum(root?.left, sum)
        let _ = pathSum(root?.right, sum)
        return pathNum;
    }
    
    private func findPathSum(_ root: TreeNode?, _ sum: Int) {
        if (root == nil) {
            return
        }
        
        let num = sum - root!.val
        if (num == 0) {
            pathNum += 1
        }
        
        findPathSum(root?.left, sum - root!.val)
        findPathSum(root?.right, sum - root!.val)
    }
    
    
    /*
     101. 对称二叉树
     */
    //MARK: - 对称二叉树
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isSame(root, root);
    }

    func isSame(_ left:TreeNode?, _ right:TreeNode?) -> Bool {
        if (left == nil && right == nil) {
            return true
        }
        
        if (left == nil || right == nil) {
            return false
        }
        
        if (left?.val == right?.val) {
            return isSame(left?.left, right?.right) && isSame(left?.right, right?.left)
        }
        return false
    }
    
    /*
     783. 二叉搜索树节点最小距离
     给定一个二叉搜索树的根节点 root，返回树中任意两节点的差的最小值。
     示例：

     输入: root = [4,2,6,1,3,null,null]
     输出: 1
     解释:
     注意，root是树节点对象(TreeNode object)，而不是数组。

     给定的树 [4,2,6,1,3,null,null] 可表示为下图:

               4
             /   \
           2      6
          / \
         1   3

     最小的差值是 1, 它是节点1和节点2的差值, 也是节点3和节点2的差值。
      

     注意：

     1. 二叉树的大小范围在 2 到 100。
     2. 二叉树总是有效的，每个节点的值都是整数，且不重复。
     3. 本题与 530：https://leetcode-cn.com/problems/minimum-absolute-difference-in-bst/ 相同
     */
    func minDiffInBST(_ root: TreeNode?) -> Int {
        
        return 0
    }
    
    /*
     114. 二叉树展开为链表
     给定一个二叉树，原地将它展开为一个单链表。

      

     例如，给定二叉树

         1
        / \
       2   5
      / \   \
     3   4   6
     将其展开为：

     1
      \
       2
        \
         3
          \
           4
            \
             5
              \
               6
     */
    //MARK: - 二叉树展开为链表
    var last : TreeNode?
    func flatten(_ root: TreeNode?) {
        if (root == nil) {
            return
        }
        
        flatten(root?.right)
        flatten(root?.left)
        root?.right = last
        root?.left = nil
        last = root
    }
    
    /*
     226. 翻转二叉树
     
     翻转一棵二叉树。

     示例：

     输入：

          4
        /   \
       2     7
      / \   / \
     1   3 6   9
     输出：

          4
        /   \
       7     2
      / \   / \
     9   6 3   1
     */
    // MARK: - 正序翻转二叉树
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        
        if (root == nil) {
            return root
        }
        
        let tRoot = root
        let temp = tRoot?.left
        tRoot?.left = tRoot?.right
        tRoot?.right = temp
        
        let _ = invertTree(tRoot?.left)
        let _ = invertTree(tRoot?.right)
        
        return tRoot
    }
    
    // MARK: - 中序翻转二叉树
    func invertTree1(_ root: TreeNode?) -> TreeNode? {
        
        if (root == nil) {
            return root
        }
        
        let _ = invertTree1(root?.left)
        let tempRightNodel = root?.right
        root?.right = root?.left
        root?.left = tempRightNodel
        let _ = invertTree1(root?.left)
        
        return root
    }
    
    // MARK: - 后序翻转二叉树
    func invertTree2(_ root: TreeNode?) -> TreeNode? {
        if (root == nil) {
            return root
        }
        
        let lastLeftNode = invertTree2(root!.left)
        let lastRightNode = invertTree2(root!.right)
        
        root?.left = lastRightNode
        root?.right = lastLeftNode
        
        return root
    }
    
    /*
     543. 二叉树的直径
     
     给定一棵二叉树，你需要计算它的直径长度。
     一棵二叉树的直径长度是任意两个结点路径长度中的最大值。这条路径可能穿过也可能不穿过根结点。
     示例 :
     给定二叉树

               1
              / \
             2   3
            / \
           4   5
     返回 3, 它的长度是路径 [4,2,1,3] 或者 [5,2,1,3]。
     */
    // MARK: - 二叉树直径
    var deepNum : Int! = 0
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        let _ = getDeep(root)
        return deepNum
    }
    
    private func getDeep(_ root: TreeNode?) -> Int {
        if (root == nil) {
            return 0
        }
        
        let left = getDeep(root?.left)
        let right = getDeep(root?.right)
        if left + right > deepNum {
            deepNum = left + right
        }
        
        return max(left, right) + 1
    }
}

    
    

