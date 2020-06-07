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
    // MARK: - 链表中倒数第k个节点
    func printNumbers(_ n: Int) -> [Int] {
        
        return []
    }
}
