//
//  Search.swift
//  TestSwift
//
//  Created by darren on 2020/6/7.
//  Copyright © 2020 杜璇. All rights reserved.
//

import UIKit

class Search: NSObject {
    /*
     顺序查找
     */
    class func sequanceSearch(_ lists: [Int], _ value: Int) -> Int {
        for (index, num) in lists.enumerated() {
            if (num == value) {
                return index
            }
        }
        return -1
    }
    
    
    /*
     二分查找
     */
    //MARK: - 二分递归
    class func BinarySearchRecursive(_ list: [Int], _ value: Int, _ low: Int, _ hight: Int) -> Int {
        if (low > hight) {
            return -1
        }
        
        let mid = low + (hight - low)/2
        
        if list[mid] == value {
            return mid
        }
        
        if list[mid] > value {
            return BinarySearchRecursive(list, value, low, mid - 1)
        }
        
        if (list[mid] < value) {
            return BinarySearchRecursive(list, value, mid + 1, hight)
        }
        
        return -1
    }
    
    //MARK: - 二分递归又重复
    class func BinarySearchRecursiveHasRepeatNum(_ list: [Int], _ value: Int, _ low: Int, _ hight: Int) -> Int {
        if (low > hight) {
            return -1
        }
        
        let mid = low + (hight - low)/2
        let curNum = list[mid]
        if (curNum < value) {
            return BinarySearchRecursiveHasRepeatNum(list, value, mid + 1, hight)
        }
        
        return BinarySearchRecursiveHasRepeatNum(list, value, low, mid - 1)
    }
    
    //MARK: - 二分迭代
    class func BinarySearchNormal(_ list: [Int], _ value: Int) -> Int {
        if (list.isEmpty) {
            return -1
        }
        
        var low = 0
        var hight = list.count - 1
        var mid = 0
        while low <= hight {
            mid = low + (hight - low)/2
            
            if list[mid] == value {
                return mid
            }
            
            if list[mid] < value {
                low = mid + 1
            }
            
            if (list[mid] > value) {
                hight = mid - 1
            }
        }
        return -1
    }
    
    //MARK: - 二分迭代有重复数字
    class func BinarySearchNormalHasRepeatNum(_ list: [Int], _ value: Int) -> Int {
        if (list.isEmpty) {
            return -1
        }
        
        var low = 0
        var hight = list.count - 1
        var mid = 0
        while low <= hight {
            mid = low + (hight - low)/2
                        
            if list[mid] < value {
                low = mid + 1
            }
            
            if (list[mid] >= value) {
                hight = mid - 1
            }
        }
        return low
    }
    
    /*
     插值查找
     */
    //MARK: - 插值查找
    
}
