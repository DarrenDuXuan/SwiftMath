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
    //MARK: - 二叉树的层遍历
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
    
    //MARK: - 二叉树的前序遍历
    func inorderFrontWhile(_ root: TreeNode?) -> [Int] {
        
        var res = [Int]()
        var treeList = [TreeNode]()
        var node = root
        
        while node != nil || !treeList.isEmpty {
            while node != nil {
                res.append(node!.val)
                treeList.append(node!)
                node = node?.left
            }
            
            if !treeList.isEmpty {
                node = treeList.popLast()
                node = node?.right
            }
        }
        return res
    }
    
    var frontList = [Int]()
    func inorderFrontRecursive(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        
        let val = root?.val
        frontList.append(val!)
        let _ = inorderFrontRecursive(root?.left)
        let _ = inorderFrontRecursive(root?.right)
        
        return frontList
    }
    
    //MARK: - 二叉树的中序遍历
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
    
    //MARK: - 二叉树的后序遍历
    var postorderList = [Int]()
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        
        let _ = postorderTraversal(root?.left)
        let _ = postorderTraversal(root?.right)
        let val = root?.val
        postorderList.append(val!)
        
        return postorderList
    }
    
    func postorderTraversalWhile(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        
        var nodeList = [TreeNode]()
        var vRoot = root
        var lastVistNode = root
        
        while vRoot != nil || !nodeList.isEmpty {
            while vRoot != nil {
                nodeList.append(vRoot!)
                vRoot = vRoot?.left
            }
            vRoot = nodeList.last
            if vRoot?.right == nil || vRoot?.right === lastVistNode {
                res.append(vRoot!.val)
                nodeList.removeLast()
                lastVistNode = vRoot
                vRoot = nil
            } else {
                vRoot = vRoot?.right
            }
        }
        
        return res
    }
    
    //MARK: - 不修改原树，二叉树的合并
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if t1 == nil {
            return t2
        }
        
        if t2 == nil {
            return t1
        }
        
        let val = t1!.val + t2!.val
        let node = TreeNode.init(val)
        
        node.left = mergeTrees(t1?.left, t2?.left)
        node.right = mergeTrees(t1?.right, t2?.right)
        
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
        
        t1Val += t2Val
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
        if root == nil {
            return nil
        }
        
        let tempLeft = root?.left
        root?.left = root?.right
        root?.right = tempLeft
        
        let _ = invertTree(root?.left)
        let _ = invertTree(root?.right)
        return root
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
    
    /*
     297. 二叉树的序列化与反序列化
     序列化是将一个数据结构或者对象转换为连续的比特位的操作，进而可以将转换后的数据存储在一个文件或者内存中，同时也可以通过网络传输到另一个计算机环境，采取相反方式重构得到原数据。

     请设计一个算法来实现二叉树的序列化与反序列化。这里不限定你的序列 / 反序列化算法执行逻辑，你只需要保证一个二叉树可以被序列化为一个字符串并且将这个字符串反序列化为原始的树结构。

     示例:

     你可以将以下二叉树：

         1
        / \
       2   3
          / \
         4   5

     序列化为 "[1,2,3,null,null,4,5]"
     */
    //MARK: - 二叉树的序列化与反序列化
    func serialize(_ root: TreeNode?) -> String {
        if root == nil {
            return ""
        }
        var str = ""
        var nodeList = [TreeNode]()
        nodeList.append(root!)
        str.append(String(root!.val))
        
        while nodeList.count != 0 {
            
            let count = nodeList.count
            for _ in 0..<count {
                let node = nodeList.removeFirst()
                
                str += ","
                if let left = node.left {
                    nodeList.append(left)
                    str.append(String(left.val))
                } else {
                    str.append("null")
                }
                
                str += ","
                if let right = node.right {
                    nodeList.append(right)
                    str.append(String(right.val))
                } else {
                    str.append("null")
                }
            }
        }
        return str
    }
    
    //MARK: - 二叉树序列换，反序列化
    func deserialize(_ data: String) -> TreeNode? {
        if data.count == 0 {
            return nil
        }
        
        let list = data.components(separatedBy: ",")
        
        if list.isEmpty {
            return nil
        }
        
        let curS : String! = list[0]
        guard let val = Int(curS) else { return nil }
        let res = TreeNode.init(val)
        var resList = [TreeNode]()
        resList.append(res)
        var index = 0
        while true {
            let node = resList.removeFirst()
            index += 1
            if index >= list.count {
                break
            }
            if list[index] != "null" {
                let valStr = list[index]
                guard let val = Int(valStr) else { return nil }
                let left = TreeNode.init(val)
                node.left = left
                resList.append(node.left!)
            }
            
            index += 1
            if index >= list.count {
                break
            }
            
            if list[index] != "null" {
                let valStr = list[index]
                guard let val = Int(valStr) else { return nil }
                let right = TreeNode.init(val)
                node.right = right
                resList.append(node.right!)
            }
        }
        
        return res
    }
    
    var res = [Int: TreeNode]()
    func recoverFromPreorder(_ S: String) -> TreeNode? {
        var val = "",
        deep = 0
        res[-1] = TreeNode.init(0)
        for c in S {
            if c != "-" {
                val += String(c)
            } else if val != "" {
                addTree(val, deep)
                val = ""
                deep = 1
            } else {
                deep += 1
            }
        }
        addTree(val, deep)
        return res[0]
    }
    
    private func addTree(_ val: String, _ key: Int) {
        res[key] = TreeNode.init(Int(val) ?? 0)
        if res[key - 1]?.left != nil {
            res[key - 1]?.left = res[key]
        } else {
            res[key - 1]?.right = res[key]
        }
    }
    
    //MARK: - 前中重建二叉树
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        return buildTreeHelp(preorder, inorder, 0, 0, inorder.count - 1)
    }
    
    private func buildTreeHelp(_ preorder: [Int], _ inorder: [Int], _ root: Int, _ start: Int, _ end: Int) -> TreeNode? {
        if start > end {
            return nil
        }
        
        let node = TreeNode.init(preorder[root])
        var i = start
        while i < end && preorder[root] != inorder[i] {
            i += 1
        }
        
        node.left = buildTreeHelp(preorder, inorder, root + 1, start, i - 1)
        node.right = buildTreeHelp(preorder, inorder, root + 1 + i - start, i + 1, end)
        return node
    }
    
    //MARK: - 平衡二叉树
    func isBalanced(_ root: TreeNode?) -> Bool {
        return isBalancedHelp(root) >= 0
    }
    
    private func isBalancedHelp(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let lh = isBalancedHelp(root?.left)
        let rh = isBalancedHelp(root?.right)
        
        if lh >= 0 && rh >= 0 && abs(lh - rh) <= 1 {
            return max(lh, rh) + 1
        } else {
            return -1
        }
    }
    
    //MARK: -  最大二叉树
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        return constructMaximumBinaryTreeHelp(nums, 0, nums.count - 1)
    }
    
    private func constructMaximumBinaryTreeHelp(_ nums: [Int], _ l: Int, _ r: Int) -> TreeNode? {
        if l > r {
            return nil
        }
        
        let maxIndex = findMax(nums, l, r)
        let root = TreeNode.init(nums[maxIndex])
        root.left = constructMaximumBinaryTreeHelp(nums, l, maxIndex - 1)
        root.right = constructMaximumBinaryTreeHelp(nums, maxIndex + 1, r)
        return root
    }
    
    private func findMax(_ nums: [Int], _ l: Int, _ r: Int) -> Int {
        var max = -256,
        maxIndex = l
        
        for i in l...r {
            if max < nums[i] {
                max = nums[i]
                maxIndex = i
            }
        }
        
        return maxIndex
    }
    
    //MARK: - 二叉树最小深度
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        if root?.left == nil && root?.right != nil {
            return 1 + minDepth(root?.right)
        }
        
        if root?.right == nil && root?.left != nil {
            return 1 + minDepth(root?.left)
        }
        
        return 1 + min(minDepth(root?.left), minDepth(root?.right))
    }
    
    //MARK: - 删除排序链表中的重复元素
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var vHead = head
        while vHead != nil && vHead?.next != nil {
            if vHead!.val == vHead?.next?.val {
                vHead?.next = vHead?.next?.next
            } else {
                vHead = vHead?.next
            }
        }
        return head
    }
}

    
    

