//
//  List.swift
//  TestSwift
//
//  Created by darren on 2020/6/4.
//  Copyright © 2020 杜璇. All rights reserved.
//

import UIKit

class ListNode : NSObject {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class List: NSObject {
    func creatNodeList(_ list: [Int]) -> ListNode? {
        var node = ListNode.init(0)
        let head = node
        
        for num in list {
            let tNode = ListNode.init(num)
            node.next = tNode
            node = tNode
        }
        
        return head.next
    }
    
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if (headA == nil || headB == nil) {
            return nil
        }
        
        var h1 = headA, h2 = headB
        while h1 != h2 {
            h1 = h1 == nil ? headB : h1?.next
            h2 = h2 == nil ? headA : h2?.next
        }
        return h1
    }
    
    /*
     反转一个单链表。
     示例:

     输入: 1->2->3->4->5->NULL
     输出: 5->4->3->2->1->NULL
     进阶:
     你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
     */
    // MARK: - 迭代反转一个单链表。
    func reverseList(_ head: ListNode?) -> ListNode? {
        if (head == nil) {
            return nil
        }
        
        var cur : ListNode?
        var root = head
        while root != nil {
            let next = root?.next
            root?.next = cur
            cur = root
            root = next
        }
        return cur
        
        return overList(nil, head)
    }
       
    // MARK: - 递归反转一个单链表。
    func overList(_ pre:ListNode?, _ cur:ListNode?) -> ListNode? {
        if (cur == nil) {
            return pre
        }
        
        let next = cur?.next
        cur?.next = pre
        return overList(cur, next)
    }
    
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
//            l1!.next = mergeTwoLists(l1!.next, l2)
//            return l1
//        } else {
//            l2!.next = mergeTwoLists(l1, l2!.next)
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
    141. 环形链表
    */
    // MARK: - 环形链表
    func hasCycle(_ head: ListNode?) -> Bool {
        if (head == nil) {
            return false
        }
        
        var fast = head?.next
        var slow = head
        while fast != slow {
            if fast?.next == nil || fast?.next?.next == nil {
                return false
            }
            
            fast = fast?.next?.next
            slow = slow?.next
        }
        return true
    }
    
    /*
     234. 请判断一个链表是否为回文链表。
     */
    func isPalindrome(_ head: ListNode?) -> Bool {
        if(head == nil || head!.next == nil) {
            return true
        }
        
        var root:ListNode? = head
        var list:[ListNode] = []

        while root != nil {
            list.append(root!)
            root = root?.next
        }
        
        var low = 0
        var hight = list.count - 1
        while low < hight {
            
            if (list[low].val == list[hight].val) {
                low += 1
                hight -= 1
            } else {
                return false
            }
        }
        return true
    }
    
    /*
     169. 多数元素
     给定一个大小为 n 的数组，找到其中的多数元素。多数元素是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。

     你可以假设数组是非空的，并且给定的数组总是存在多数元素。

     示例 1:

     输入: [3,2,3]
     输出: 3
     示例 2:

     输入: [2,2,1,1,1,2,2]
     输出: 2
     */
    func majorityElement(_ nums: [Int]) -> Int {
        var dict = [Int:Int]()
        for num in nums {
            
            if let n = dict[num] {
                dict[num] = n + 1
            } else {
                dict[num] = 1
            }
            
            let count = nums.count / 2
            if (dict[num]! > count) {
                return num
            }
        }
        return 0
    }
    
    //MARK: - 两数相加
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let resNode : ListNode! = ListNode.init(0)
        var res : ListNode! = resNode
    
        var sign = 0,
        vL1 = l1,
        vL2 = l2
        
        
        while vL1 != nil || vL2 != nil || sign != 0 {
            var l1Val = 0,
            l2Val = 0
            
            if let val = vL1?.val {
                l1Val = val
            }
            
            if let val = vL2?.val {
                l2Val = val
            }
            
            var val = l1Val + l2Val + sign
            sign = val / 10
            val %= 10
            
            let node = ListNode.init(val)
            res.next = node
            res = node
            
            if vL1 != nil {
                vL1 = vL1?.next
            }
            
            if vL2 != nil {
                vL2 = vL2?.next
            }
        }
        
        return resNode.next
    }
    
    //MARK: - 删除倒数第n个节点
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if n == 0 {
            return head
        }
        
        var fast = head,slow = head
        for _ in 0..<n {
            fast = fast?.next
        }
        
        if fast == nil {
            return head?.next
        }
        
        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        
        slow?.next = slow?.next?.next
        
        return head
    }
    
    //MARK: - 两两交换链表中的节点
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        let next = head?.next
        head?.next = swapPairs(next?.next)
        next?.next = head
        return next
    }
    //MARK: - 旋转链表
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if k == 0 {
            return head
        }
        
        if head == nil {
            return nil
        }
        
        var vHead = head
        var lastNode : ListNode?
        var lastLessOneNode : ListNode?
        var tempHead = head
        
        var num = 0
        var tempCalculateHead = head
        while tempCalculateHead != nil {
            num += 1
            tempCalculateHead = tempCalculateHead?.next
        }
        
        let step = k % num
        
        for _ in 0..<step {
            
            while vHead != nil {
                if vHead?.next == nil {
                    lastNode = vHead
                }
                
                if vHead?.next?.next == nil && vHead?.next != nil {
                    lastLessOneNode = vHead
                }
                
                vHead = vHead?.next
            }
            
            if lastNode === tempHead {
                return tempHead
            }
            
            lastNode?.next = tempHead
            tempHead = lastNode
            vHead = lastNode
            lastLessOneNode?.next = nil
        }
        
        return tempHead
    }
    
    //MARK: -  删除重复节点
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }

        var dict = [Int:Int]()
        
        var tempHead = head
        
        while tempHead != nil {
            if let count = dict[tempHead!.val] {
                let nCount = count + 1
                dict[tempHead!.val] = nCount
            } else {
                dict[tempHead!.val] = 1
            }
            
            tempHead = tempHead?.next
        }
        tempHead = head
        var tempNode : ListNode? = ListNode.init(-1)
        let res = tempNode
        
        while tempHead != nil {
            var count = 0
            if let num = dict[tempHead!.val] {
                count = num
            }
            
            if count == 1 {
                tempNode?.next = ListNode.init(tempHead!.val)
                tempNode = tempNode?.next
            }
            tempHead = tempHead?.next
        }
        
        return res?.next
    }
    
    /*
     给定一个链表和一个特定值 x，对链表进行分隔，使得所有小于 x 的节点都在大于或等于 x 的节点之前。

     你应当保留两个分区中每个节点的初始相对位置。
     */
    //MARK: - 86. 分隔链表
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var lowNode = ListNode.init(-1)
        var upNode = ListNode.init(-1)
        let tempUpNode = upNode
        
        let resNode = lowNode
        var tempNode = head
        
        while tempNode != nil {
            
            let val = tempNode!.val
            
            if val < x {
                let node = ListNode.init(val)
                lowNode.next = node
                lowNode = node
            } else {
                let node = ListNode.init(val)
                upNode.next = node
                upNode = node
            }
            
            tempNode = tempNode?.next
        }
        
        lowNode.next = tempUpNode.next
        
        return resNode.next
    }
    
    /*
     反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。

     说明:
     1 ≤ m ≤ n ≤ 链表长度。
     */
    //MARK: - 92. 反转链表 II
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        let dummy = ListNode.init(0)
        dummy.next = head
        var pre : ListNode = dummy
        for _ in 1..<m {
            pre = pre.next!
        }
        
        let tempHead = pre.next
        for _ in m..<n {
            let next = tempHead?.next
            tempHead?.next = next?.next
            next?.next = pre.next
            pre.next = next
        }
        return dummy.next
    }
    
    /*
     排序链表
     */
    func sortList(_ head: ListNode?) -> ListNode? {
        var array = [Int]()
        var tempHead = head
        
        while tempHead?.next != nil {
            array.append(tempHead!.val)
            tempHead = tempHead?.next
        }
        
        array.sort()
        var node : ListNode?
        var firstNode : ListNode?

        for val in array {
            if node == nil {
                node = ListNode(val)
                firstNode = node
            } else {
                let tNode = ListNode(val)
                node?.next = tNode
                node = tNode
            }
        }
        
        return firstNode
    }
}
