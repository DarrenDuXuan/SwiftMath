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
     二分查找
     */
    
    func BinarySearch(_ list: [Int], _ value: Int, _ low: Int, _ hight: Int) -> Int {
        let mid = low + (hight - low)/2
        
        if list[mid] == value {
            return list[mid]
        }
        
        if list[mid] > value {
            return BinarySearch(list, value, low, mid - 1)
        }
        
        if (list[mid] < value) {
            return BinarySearch(list, value, mid + 1, hight)
        }
        
        return -1
    }
}
