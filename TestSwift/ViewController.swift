//
//  ViewController.swift
//  TestSwift
//
//  Created by darren on 2020/5/13.
//  Copyright © 2020 杜璇. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    var _list : List! = List.init()
    var _math = Math.init()
    var _swordFingerOffer = SwordFingerOffer.init()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        let head = ListNode.init(1)
        let next = ListNode.init(2)
        head.next = next
        let _ = _list.isPalindrome(head)
        let headNode = _list.creatNodeList([1])
        let _ = _list.rotateRight(headNode, 1)
        
        let _ = Math.findDisappearedNumbers([4,3,2,7,8,2,3,1,9,11])
        let _ = _math.isValid("()")
        let _ = _math.findUnsortedSubarray([2,6,4,8,10,9,15])
        let _ = _math.sumNums(3)
        let _ = _math.subsets([3, 2, 1])
        let _ = _math.productExceptSelf([1,2,3,4])
        let _ = _math.countBits(4)
        let _ = _math.longestConsecutive([100, 4, 200, 1, 3, 2])
        let _ = _math.combinationSum([2,3,6,7], 7)
        let _ = _math.hammingDistance(1, 4)
        let _ = _math.numRepeatCount([1,1,2,4,3,4,1])
        let _ = _math.fib(95)
        let _ = _math.maxArea([1,8,6,2,5,4,8,3,7])
        let _ = _math.threeSumClosest([-1,2,1,-4], 1)
        let _ = _math.fourSum([1,0,-1,0,-2,2], 0)
        var list1 = [0,0,1,1,1,2,2,3,3,4]
        let _ = _math.removeDuplicates(&list1)
        let _ = Math.searchRange([1, 3], 1)
        let _ = Math.searchInsert([1, 3, 5, 6], 7)
        let _ = _math.combinationSum2([10,1,2,7,6,1,5], 8)
        var matrix =
        [
          [1,2,3],
          [4,5,6],
          [7,8,9]
        ]
        
        Math.rotate(&matrix)
        let _ = Math.spiralOrder([[1,2,3],[4,5,6],[7,8,9]])
        let _ = Math.canJump([2,0,0])
        let _ = Math.longestCommonPrefix(["flower","flow","flight"])
        let _ = Math.merge([[1,3],[2,6],[8,10],[15,18]])
        let _ = Math.generateMatrix(3)
        let _ = Math.uniquePaths(3, 2)
        let _ = Math.uniquePathsWithObstacles([[0,0,0],[0,1,0],[0,0,0]])
        let _ = Math.pairSums([2, 1, 8, 6, 5, 7, -1, 3, 5, 5], 7)
        let _ = Math.searchMatrix([[1]], 1)
        let _ = Math.minPathSum([[1,3,1],[1,5,1],[4,2,1]])
        var tList = [1]
        let _ = _math.sortColors(&tList)
        let _ = Math.subsetsWithDup([1,2,2])
        
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
        let _ = _swordFingerOffer.twoSum([2,7,11,15], 9)
        
        let _ = Search.BinarySearchRecursive([1, 10, 100, 1000], 9, 0, 3)
        let _ = Search.BinarySearchNormalHasRepeatNum([1, 10, 10, 100, 1000], 10)
        
        let string = "1,2,3,null,null,4,5"
        let node = Tree.init().deserialize(string)
        let _ = Tree.init().serialize(node)
        let _ = Tree.init().recoverFromPreorder("1-2--3--4-5--6--7")
        
    }
}

