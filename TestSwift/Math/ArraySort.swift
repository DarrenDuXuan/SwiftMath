//
//  ArraySort.swift
//  TestSwift
//
//  Created by darren on 2020/6/4.
//  Copyright © 2020 杜璇. All rights reserved.
//

import UIKit

class ArraySort: NSObject {
    /*
     快排
     */
    func quickSort(_ list: [Int]) -> [Int] {
        var array = list
        return quickSortPrivate(&array, 0, array.count - 1)
    }
    
    private func quickSortPrivate(_ list: inout [Int], _ first: Int, _ last: Int) -> [Int] {
        if (first >= last) {
            return list
        }
        
        let i = partition(&list, first, last);
        
        let _ = quickSortPrivate(&list, first, i-1)
        let _ = quickSortPrivate(&list, i+1, last)
        return list
    }
    
    private func partition(_ list: inout [Int], _ first:Int, _ last:Int) -> Int {
        let sign = list[last]
        
        var tFirst = first
        for i in first...last-1 {
            if (list[i] < sign) {
                list.swapAt(tFirst, i)
                tFirst+=1
            }
        }
        
        list[last] = list[tFirst]
        list[tFirst] = sign
        
        return tFirst
    }
    
    /*
     冒泡
     */
    func mpSrort(_ list: inout [Int]) {
        let count = list.count
        for index in 0..<count {
            for j in 0..<count - 1 - index {
                if (list[j] > list[j + 1]) {
                    list.swapAt(j, j+1)
                }
            }
        }
    }
    
    /*
     选择排序
     */
    func selectionSort(_ lists: inout [Int]) {
        for (index1, num) in lists.enumerated() {
            var signNum = index1
            for i in index1..<lists.count {
                if (num > lists[i]) {
                    signNum = i
                }
            }
            lists.swapAt(index1, signNum)
        }
    }
    
    /*
     插入排序
     */
    func insertSort(_ list: inout [Int]) {
        for (index1, num1) in list.enumerated() {
            for j in (0..<index1).reversed() {
                if (list[j] > num1) {
                    list.swapAt(j, j + 1)
                }
            }
        }
    }
    
    /*
     希尔排序
     */
    func shellSort(_ list: inout [Int]) {
        var gap = 1;
        while gap < list.count {
            gap = gap * 3 + 1
        }
        
        while gap > 0 {
            for (index, num) in list.enumerated() {
                var j = index - gap
                while (j >= 0 && list[j] > num) {
                    list[j + gap] = list[j]
                    j -= gap
                }
                list[j + gap] = num
            }
            let f : Float = Float((gap*1)/3)
            gap = Int(floorf(f))
        }
    }
    
    /*
     堆排序
     */
    var heapListCount = 0;
    func heapSort(_ list: inout [Int]) {
        heapListCount = list.count
        // 构建堆
        buildHeap(&list)
        
        for (index, _) in list.enumerated().reversed() {
            list.swapAt(0, index)
            heapListCount -= 1
            heapify(&list, i: 0)
        }
        print(2)
    }
    
    private func buildHeap(_ list: inout [Int]) {
        for i in (0..<heapListCount/2).reversed() {
            heapify(&list, i: i)
        }
    }
    
    private func heapify(_ list: inout [Int], i: Int) {
        var left = 2 * i + 1,
            right = 2 * i + 2,
            center = i;
        if (left < heapListCount && list[left] > list[center]) {
            center = left
        }
        
        if (right < heapListCount && list[right] > list[center]) {
            center = right
        }
        
        if (center != i) {
            list.swapAt(i, center)
            heapify(&list, i: center)
        }
    }
    
    /*
     计数排序
     */
    func countSort(_ list: inout [Int])  {
//        let min = list.min()
        let max = list.max()
        var countList = [Int](repeating: 0, count: max! + 1)
        for (_, num) in list.enumerated() {
            countList[num] += 1
        }
        list.removeAll()
        for (index, count) in countList.enumerated() {
            for _ in 0..<count {
                list.append(index)
            }
        }
    }
}
