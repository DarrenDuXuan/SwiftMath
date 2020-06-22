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
        // 1. 常规反转
//        var tempNode = head
//        var node : ListNode!
//        while tempNode != nil {
//            let temp = tempNode?.next
//            tempNode?.next = node
//            node = tempNode
//            tempNode = temp
//        }
//        return node
        
        // 递归反转
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
    
    /*
     面试题25. 合并两个排序的链表
     输入两个递增排序的链表，合并这两个链表并使新链表中的节点仍然是递增排序的。

     示例1：

     输入：1->2->4, 1->3->4
     输出：1->1->2->3->4->4
     */
    // MARK: - 合并两个排序的链表
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        if (l1 == nil) {
//            return l2
//        }
//        
//        if (l2 == nil) {
//            return l1
//        }
//        
//        if (l1!.val <= l2!.val) {
//            l1?.next = mergeTwoLists(l1?.next, l2)
//            return l1
//        } else {
//            l2?.next = mergeTwoLists(l1, l2?.next)
//            return l2
//        }
        
        // 2. 正常
        let node : ListNode! = ListNode(0)
        var head : ListNode! = node
        var ll1 = l1
        var ll2 = l2
        while ll1 != nil && ll2 != nil {
            if (ll1!.val < ll2!.val) {
                head.next = ll1
                head = head.next
                ll1 = ll1?.next
            } else {
                head.next = ll2
                head = head.next
                ll2 = ll2?.next
            }
        }
        
        if (ll1 == nil) {
            head.next = ll2
        } else {
            head.next = ll1
        }
        
        return node!.next
    }
    
    /*
     面试题15. 二进制中1的个数
     请实现一个函数，输入一个整数，输出该数二进制表示中 1 的个数。例如，把 9 表示成二进制是 1001，有 2 位是 1。因此，如果输入 9，则该函数输出 2。

     示例 1：

     输入：00000000000000000000000000001011
     输出：3
     解释：输入的二进制串 00000000000000000000000000001011 中，共有三位为 '1'。
     示例 2：

     输入：00000000000000000000000010000000
     输出：1
     解释：输入的二进制串 00000000000000000000000010000000 中，共有一位为 '1'。
     示例 3：

     输入：11111111111111111111111111111101
     输出：31
     解释：输入的二进制串 11111111111111111111111111111101 中，共有 31 位为 '1'。
     */
    
    // MARK: - 二进制中1的个数
    func hammingWeight(_ n: Int) -> Int {
        /*
         任何整数于小于这个整数相&，最有一位1会变0，用来判断有多少位1。
         */
        var num = 0
        var tn = n
        while tn > 0 {
            num += 1
            tn &= tn
        }
        return num
    }
    
    /*
     面试题54. 二叉搜索树的第k大节点
     给定一棵二叉搜索树，请找出其中第k大的节点。
     示例 1:

     输入: root = [3,1,4,null,2], k = 1
        3
       / \
      1   4
       \
        2
     输出: 4
     示例 2:

     输入: root = [5,3,6,2,4,null,null,1], k = 3
            5
           / \
          3   6
         / \
        2   4
       /
      1
     输出: 4
     */
    // MARK: - 二叉搜索树的第k大节点
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        
//        let _ = kthLargestHelp(root, k)
//
//        return res
        
        var list : [Int] = [Int]()
        var tNum = 0
        var tRes = 0
        var nodeList: [TreeNode] = [TreeNode]()
        var node = root
        while !nodeList.isEmpty || node != nil {
            while node != nil {
                nodeList.append(node!)
                node = node?.right
            }
            
            if (!nodeList.isEmpty) {
                node = nodeList.removeLast()
                tNum += 1
                if (tNum == k) {
                    tRes = node!.val
                    break
                }
                list.append(node!.val)
                node = node?.left
            }
        }

        return tRes
//        return list[list.count - k]
    }
    
    var num = 0
    var res = 0
    var nList : [Int] = [Int]()
    func kthLargestHelp(_ root: TreeNode?, _ k: Int) -> Int {
        if (root == nil) {
            return 0
        }
        
        let _ = kthLargestHelp(root?.left, k)
        
        num += 1
        if num == k {
            res = root!.val
            return 0
        }
//        nList.append(root!.val)
        
        let  _ = kthLargestHelp(root?.right, k)
        
        return 0
    }
    
    /*
     面试题32 - II. 从上到下打印二叉树 II
     从上到下按层打印二叉树，同一层的节点按从左到右的顺序打印，每一层打印到一行。

      

     例如:
     给定二叉树: [3,9,20,null,null,15,7],

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
    //MARK: - 从上到下打印二叉树 II
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if (root == nil) {
            return []
        }
        
        var list = [[Int]]()
        var nodeList = [TreeNode]()
        nodeList.append(root!)
        while !nodeList.isEmpty {
            var tempList = [Int]()
            let count = nodeList.count
            for _ in 0..<count {
                let node = nodeList.removeFirst()
                
                tempList.append(node.val)
                
                if let left = node.left {
                    nodeList.append(left)
                }
                
                if let right = node.right {
                    nodeList.append(right)
                }
            }
            list.append(tempList)
        }
        
        return list
    }
    
    /*
     面试题57 - II. 和为s的连续正数序列
     输入一个正整数 target ，输出所有和为 target 的连续正整数序列（至少含有两个数）。

     序列内的数字由小到大排列，不同序列按照首个数字从小到大排列。
     示例 1：

     输入：target = 9
     输出：[[2,3,4],[4,5]]
     示例 2：

     输入：target = 15
     输出：[[1,2,3,4,5],[4,5,6],[7,8]]
     */
    //MARK: - 和为s的连续正数序列
    func findContinuousSequence(_ target: Int) -> [[Int]] {
        // 暴力滑动窗口解决
        var left = 1, sum = 0
        var list = [[Int]]()
        for right in 1..<target {
            sum += right

            while sum > target {
                // 大于 target
                // 左窗口左移一位直到 sum <= target
                sum -= left
                left += 1
            }
            
            if (sum == target) {
                let count = right - left + 1
                var tempList = [Int]()
                for i in 0..<count {
                    tempList.append(left+i)
                }
                list.append(tempList)
            }
        }
        return list
    }
    
    /*
     面试题46. 把数字翻译成字符串
     给定一个数字，我们按照如下规则把它翻译为字符串：0 翻译成 “a” ，1 翻译成 “b”，……，11 翻译成 “l”，……，25 翻译成 “z”。一个数字可能有多个翻译。请编程实现一个函数，用来计算一个数字有多少种不同的翻译方法。
     示例 1:

     输入: 12258
     输出: 5
     解释: 12258有5种不同的翻译，分别是"bccfi", "bwfi", "bczi", "mcfi"和"mzi"
     */
    //MARK:- 把数字翻译成字符串
    func translateNum(_ num: Int) -> Int {
        if (num <= 9) {
            return 0
        }
        let yu = num%100
        if (yu <= 9 || yu >= 26) {
            return translateNum(num/10)
        }
        
        return translateNum(num/10) + translateNum(num/100)
    }
    
    //MARK: - 剑指 Offer 03. 数组中重复的数字
    func findRepeatNumber(_ nums: [Int]) -> Int {
        var hash = [Int:Int]()
        
        for num in nums {
            if hash[num] != nil {
                return num
            }
            
            hash[num] = num
        }
        
        return -1
    }
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        if root == p || root == q {
            return root
        }
        
        let left = lowestCommonAncestor(root?.left, p, q)
        let right = lowestCommonAncestor(root?.right, p, q)
        
        if left != nil && right != nil {
            return root
        }
        
        if left != nil {
            return left
        }
        
        if right != nil {
            return right
        }
        
        return nil
    }
    
    //MARK: - 剑指 Offer 39. 数组中出现次数超过一半的数字
    func majorityElement(_ nums: [Int]) -> Int {
        // 排序，数字必定在中间
        var vNUms = nums
        vNUms.sort()
        return vNUms[vNUms.count/2]
        
        // Hash
        if nums.count == 0 {
            return -1
        }
        
        if nums.count == 1 {
            return nums[0]
        }
        
        let count = nums.count/2
        var hash = [Int:Int]()
        for num in nums {
            if hash[num] == nil {
                hash[num] = 1
            } else {
                var tCount : Int! = hash[num]
                if tCount >= count {
                    return num
                }
                tCount += 1
                hash[num] = tCount
            }
        }
        
        return -1
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        var left = 0,
//        right = nums.count-1
//        while left < right {
//            if nums[left] + nums[right] == target {
//                return [nums[left], nums[right]]
//            } else if nums[left] + nums[right] > target {
//                right -= 1
//            } else {
//                left += 1
//            }
//        }
//
//        return []
        
        var hash = [Int:Int]()
        for num in nums {
            let found = target - num
            if hash[found] != nil {
                return [found, num]
            } else {
                hash[num] = num
            }
        }
        
        return []
    }
}
