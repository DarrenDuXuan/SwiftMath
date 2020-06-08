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
        
        Math.findDisappearedNumbers([4,3,2,7,8,2,3,1,9,11])
        
        let head = ListNode.init(1)
        let next = ListNode.init(2)
        head.next = next
        List.init().isPalindrome(head)
        
        Math.init().isValid("()")
        Math.init().findUnsortedSubarray([2,6,4,8,10,9,15])
        Math.init().sumNums(3)
        Math.init().subsets([3, 2, 1])
        Math.init().productExceptSelf([1,2,3,4])
        Math.init().countBits(4)
        Math.init().spiralOrder([[2,3,4],
                                 [5,6,7],
                                 [8,9,10],
                                 [11,12,13]])
        Math.init().longestConsecutive([100, 4, 200, 1, 3, 2])
        Math.init().combinationSum([2,3,6,7], 7)
        Math.init().hammingDistance(1, 4)
        
        var list = [4, 2, 5, 9]
        ArraySort.init().mpSrort(&list)
        var seleList = [4, 2, 5, 9]
        ArraySort.init().selectionSort(&seleList)
        var insertList = [4, 2, 5, 9]
        ArraySort.init().insertSort(&insertList)
        var shellList = [4, 2, 5, 9, 10, 12, 1, 3]
        ArraySort.init().shellSort(&shellList)
        var heapList = shellList
        ArraySort.init().heapSort(&heapList)
        
        SwordFingerOffer.init().findContinuousSequence(9)
    }


}

