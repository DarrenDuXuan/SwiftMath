//
//  SwordFingerOffer.swift
//  TestSwift
//
//  Created by darren on 2020/6/7.
//  Copyright © 2020 杜璇. All rights reserved.
//

import UIKit

class SwordFingerOffer: NSObject {
    /*
     面试题58 - II. 左旋转字符串
     字符串的左旋转操作是把字符串前面的若干个字符转移到字符串的尾部。请定义一个函数实现字符串左旋转操作的功能。比如，输入字符串"abcdefg"和数字2，该函数将返回左旋转两位得到的结果"cdefgab"。

      

     示例 1：

     输入: s = "abcdefg", k = 2
     输出: "cdefgab"
     示例 2：

     输入: s = "lrloseumgh", k = 6
     输出: "umghlrlose"
      

     限制：

     1 <= k < s.length <= 10000
     */
    // MARK: - 左旋转字符串
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        return String(s.suffix(s.count-n) + s.prefix(n))
    }
    
    /*
     面试题22. 链表中倒数第k个节点
     输入一个链表，输出该链表中倒数第k个节点。为了符合大多数人的习惯，本题从1开始计数，即链表的尾节点是倒数第1个节点。例如，一个链表有6个节点，从头节点开始，它们的值依次是1、2、3、4、5、6。这个链表的倒数第3个节点是值为4的节点。

      

     示例：

     给定一个链表: 1->2->3->4->5, 和 k = 2.

     返回链表 4->5.
     */
    // MARK: - 链表中倒数第k个节点
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        // 1. 常规
//        var list = [ListNode]()
//        var tempHead = head
//        while tempHead != nil {
//            list.append(tempHead!)
//            tempHead = tempHead?.next
//        }
//
//
//        return list[list.count-k]
        // 2. 快慢
        var fast : ListNode? = head
        var slow : ListNode? = head
        var tk = k
        while tk > 0 {
            fast = fast?.next
            tk -= 1
        }
        
        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }
        
        return slow
    }
    
    /*
     面试题17. 打印从1到最大的n位数
     输入数字 n，按顺序打印出从 1 到最大的 n 位十进制数。比如输入 3，则打印出 1、2、3 一直到最大的 3 位数 999。

     示例 1:

     输入: n = 1
     输出: [1,2,3,4,5,6,7,8,9]
      

     说明：

     用返回一个整数列表来代替打印
     n 为正整数
     */
    // MARK: - 打印从1到最大的n位数
    func printNumbers(_ n: Int) -> [Int] {
        var list = [Int]()
        let max = powf(10, Float(n))
        var i = 1
        
        while i < Int(max) {
            list.append(i)
            i+=1
        }
        
        return list
    }
    
    /*
     面试题55 - I. 二叉树的深度
     输入一棵二叉树的根节点，求该树的深度。从根节点到叶节点依次经过的节点（含根、叶节点）形成树的一条路径，最长路径的长度为树的深度。

     例如：

     给定二叉树 [3,9,20,null,null,15,7]，

         3
        / \
       9  20
         /  \
        15   7
     返回它的最大深度 3 。

      

     提示：

     节点总数 <= 10000
     */
    // MARK: - 二叉树的深度 BFS
    func maxDepth(_ root: TreeNode?) -> Int {
        if (root == nil) {
            return 0
        }
        
        var list = [TreeNode]()
        list.append(root!)
        var deep = 0
        
        while !list.isEmpty {
            deep += 1
            let count = list.count
            for _ in 0..<count {
                let removeNode = list.removeFirst()
                
                if let left = removeNode.left {
                    list.append(left)
                }
                
                if let right = removeNode.right {
                    list.append(right)
                }
            }
            
        }
        
        return deep
    }
    
    // MARK: - 二叉树的深度 DFS
    var deepNum = 0
    func maxDeep2(_ root: TreeNode?) -> Int {
        if (root == nil) {
            return 0
        }
        
        findDeep(root, 0)
        return deepNum
    }
    
    private func findDeep(_ root: TreeNode?, _ level: Int) {
        if (root == nil) {
            return
        }
        
        if level > deepNum {
            deepNum = level
        }
        
        findDeep(root?.left, level + 1)
        findDeep(root?.right, level + 1)
    }
    
    /*
     面试题27. 二叉树的镜像
     请完成一个函数，输入一个二叉树，该函数输出它的镜像。

     例如输入：

          4
        /   \
       2     7
      / \   / \
     1   3 6   9
     镜像输出：

          4
        /   \
       7     2
      / \   / \
     9   6 3   1

      

     示例 1：

     输入：root = [4,2,7,1,3,6,9]
     输出：[4,7,2,9,6,3,1]
     */
    
    // MARK: - 二叉树的镜像
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        if (root == nil) {
            return nil
        }
        
        // 前序
        let tRoot = root
        let left = tRoot?.left
        tRoot?.left = tRoot?.right
        tRoot?.right = left
        let _ = mirrorTree(tRoot?.left)
        let _ = mirrorTree(tRoot?.right)
        return tRoot
        
        // 中序
//        let _ = mirrorTree(root?.left)
//        let right = root?.right
//        root?.right = root?.left
//        root?.left = right
//        let _ = mirrorTree(mirrorTree(root?.left))
//        return root
        
        
        // 后序
        
//        let left = mirrorTree(root?.left)
//        let right = mirrorTree(root?.right)
//        root?.left = right
//        root?.right = left
//        return root
    }
    
    /*
     面试题05. 替换空格
     请实现一个函数，把字符串 s 中的每个空格替换成"%20"。

      

     示例 1：

     输入：s = "We are happy."
     输出："We%20are%20happy."
     */
    
    // MARK: - 替换空格
    func replaceSpace(_ s: String) -> String {
        // 1. 库函数
        var vs = s
        vs = vs.replacingOccurrences(of: " ", with: "%20")
        return vs
        
        // 2. 额外空间
//        var str : String! = ""
//        for c in s {
//            if c == " " {
//                str.append("%20")
//            } else {
//                str.append(c)
//            }
//        }
//        return str
    }
    
    /*
     面试题06. 从尾到头打印链表
     输入一个链表的头节点，从尾到头反过来返回每个节点的值（用数组返回）。

      

     示例 1：

     输入：head = [1,3,2]
     输出：[2,3,1]
     */
    // MARK: - 从尾到头打印链表
    func reversePrint(_ head: ListNode?) -> [Int] {
        
        var node = head
        var list = [Int]()
        while node != nil {
            if (list.isEmpty) {
                list.append(node!.val)
            } else {
                list.insert(node!.val, at: 0)
            }
            node = node?.next
        }
        
        return list
    }
    
    /*
     面试题24. 反转链表
     定义一个函数，输入一个链表的头节点，反转该链表并输出反转后链表的头节点。

      

     示例:

     输入: 1->2->3->4->5->NULL
     输出: 5->4->3->2->1->NULL
     */
    //MARK: - 反转链表
    func reverseList(_ head: ListNode?) -> ListNode? {
//        var tempNode = head
//        var node : ListNode!
//        while tempNode != nil {
//            let temp = tempNode?.next
//            tempNode?.next = node
//            node = tempNode
//            tempNode = temp
//        }
//        return node
        
        
        return revrseList1(nil, head)
    }
    
    func revrseList1(_ preNode: ListNode?, _ curNode: ListNode?) -> ListNode? {
        if (curNode == nil) {
            return preNode
        }
        
        let next = curNode?.next
        curNode?.next = preNode
        
        return revrseList1(curNode, next)
    }
}
