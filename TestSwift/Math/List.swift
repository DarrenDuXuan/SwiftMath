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
    }
       
    // MARK: - 递归反转一个单链表。
    private func overList(_ pre:ListNode?, _ cur:ListNode?) -> ListNode? {
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
}
