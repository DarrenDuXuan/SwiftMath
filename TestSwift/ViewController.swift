//
//  ViewController.swift
//  TestSwift
//
//  Created by darren on 2020/5/13.
//  Copyright © 2020 杜璇. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let _ = Math.findDisappearedNumbers([4,3,2,7,8,2,3,1,9,11])
        
        let head = ListNode.init(1)
        let next = ListNode.init(2)
        head.next = next
        let _ = List.init().isPalindrome(head)
        
        let _ = Math.init().isValid("()")
        let _ = Math.init().findUnsortedSubarray([2,6,4,8,10,9,15])
        let _ = Math.init().sumNums(3)
        let _ = Math.init().subsets([3, 2, 1])
        let _ = Math.init().productExceptSelf([1,2,3,4])
        let _ = Math.init().countBits(4)
        let _ = Math.init().longestConsecutive([100, 4, 200, 1, 3, 2])
        let _ = Math.init().combinationSum([2,3,6,7], 7)
        let _ = Math.init().hammingDistance(1, 4)
        let _ = Math.init().numRepeatCount([1,1,2,4,3,4,1])
        let _ = Math.init().fib(95)
        let _ = Math.init().maxArea([1,8,6,2,5,4,8,3,7])
        let _ = Math.init().threeSumClosest([-1,2,1,-4], 1)
        let _ = Math.init().fourSum([1,0,-1,0,-2,2], 0)
        var list1 = [0,0,1,1,1,2,2,3,3,4]
        let _ = Math.init().removeDuplicates(&list1)
        let _ = Math.searchRange([1, 3], 1)
        let _ = Math.searchInsert([1, 3, 5, 6], 7)
        let _ = Math.init().combinationSum2([10,1,2,7,6,1,5], 8)
        var matrix =
        [
          [1,2,3],
          [4,5,6],
          [7,8,9]
        ]
        
        Math.rotate(&matrix)
        let _ = Math.spiralOrder([[1,2,3],[4,5,6],[7,8,9]])
        
        var list = [4, 2, 5, 9]
        ArraySort.init().mpSrort(&list)
        var seleList = [4, 2, 5, 9]
        ArraySort.init().selectionSort(&seleList)
        var insertList = [4, 2, 5, 9]
        ArraySort.init().insertSort(&insertList)
        var shellList = [20, 50, 51, 91, 2, 12, 1, 3, 100, 0, 5, 22]
        ArraySort.init().shellSort(&shellList)
        var heapList = shellList
        ArraySort.init().heapSort(&heapList)
        var countintSort = shellList
        ArraySort.init().countSort(&countintSort)
        
        let _ = SwordFingerOffer.init().findContinuousSequence(9)
        
        let _ = Search.BinarySearchRecursive([1, 10, 100, 1000], 9, 0, 3)
        let _ = Search.BinarySearchNormalHasRepeatNum([1, 10, 10, 100, 1000], 10)
    }
}

