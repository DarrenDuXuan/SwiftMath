//
//  Math.swift
//  TestSwift
//
//  Created by darren on 2020/5/16.
//  Copyright © 2020 杜璇. All rights reserved.
//

import UIKit

class Math: NSObject {
    
    /*
     1. 两数之和
     给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

     你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。

      

     示例:

     给定 nums = [2, 7, 11, 15], target = 9

     因为 nums[0] + nums[1] = 2 + 7 = 9
     所以返回 [0, 1]
     */
    
    // MARK: - 两数之和
    class func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var hash = [Int:Int]()
        for (index, num) in nums.enumerated() {
            let found = target - num
            if let i = hash[found] {
                return [i, index]
            } else {
                hash[num] = index
            }
        }
        
        return []
    }
    
    class func moveZeroes(_ nums: inout [Int]) {
        let count = nums.count
        var j = 0
        for i in 0..<count {
            if nums[i] != 0 {
                nums.swapAt(i, j)
                j += 1
            }
        }
    }
    
    class func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var varNums = nums
        for i in 0..<varNums.count {
            let index = abs(varNums[i]) - 1
            if (index < varNums.count) {
                varNums[index] = -abs(varNums[index])
            }
        }
        
        var tNums = [Int]()
        for (index, num) in varNums.enumerated() {
            if (num > 0) {
                tNums.append(index + 1)
            }
        }
        return tNums
    }
    
    /*
     给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

     说明：

     你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？

     示例 1:

     输入: [2,2,1]
     输出: 1
     示例 2:

     输入: [4,1,2,1,2]
     输出: 4
     */
    
    //MARK: - 异或
    func singleNumber(_ nums: [Int]) -> Int {
        var num : Int! = 0;
        
        for i in 0..<nums.count {
            let tempNum = nums[i]
            num ^= tempNum;
        }
        return num;
    }

    
    func maxProfit(_ prices: [Int]) -> Int {
        if (prices.isEmpty) {
            return 0
        }
        
        var maxPrice : Int = 0
        var minPrice : Int = prices.first!
        
        for price in prices {
            maxPrice = max(price - minPrice, maxPrice)
            minPrice = min(price, minPrice)
        }
        
        return maxPrice
    }
    
    func maxSubArray(_ nums: [Int]) -> Int {
        var res = nums.first!
        var sum = 0
        for num in nums {
            if (sum > 0) {
                sum += num
            } else {
                sum = num
            }
            res = max(sum, res)
        }
        return res
    }
    
    /*
     爬楼梯
     */
    //MARK: - 爬楼梯
    func climbStairs(_ n: Int) -> Int {
        var n1 = 1
        var n2 = 1
        var temp = 0
        for _ in 1..<n {
            temp = n2
            n2 = n1 + n2
            n1 = temp
        }
        return n2
    }
    
    /*
     198. 打家劫舍
     */
    func rob(_ nums: [Int]) -> Int {
        if (nums.count == 0) {
            return 0
        }
        
        if (nums.count == 1) {
            return nums.first!
        }
        
        var a = 0;
        var b = 0;
        for i in nums {
            let c = max(b, a + i)
            a = b
            b = c
        }
        
        return b
    }
    
    /*
     有效括号
     */
    func isValid(_ s: String) -> Bool {
        
        let stack = Stack.init()
        for i in s {
            switch i {
                case "(":
                    stack.push(")")
                    break
                case "[":
                    stack.push("]")
                    break
                case "{":
                    stack.push("}")
                    break
                default:
                    if (stack.count() == 0 || stack.top() != i.lowercased()) {
                        return false
                    }
                    stack.pop()
                    break
            }
        }
        if (stack.count() == 0) {
            return true
        }
        
        return false
    }
    
    /*
     最短无序连续数组
     */
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        
        if (nums.count == 0) {
            return 0
        }
        
        var hight = 0
        var low = nums.count - 1
        var cmax = Int.min
        var cmin = Int.max
        
        for (index ,i) in nums.enumerated() {
            if (i >= cmax) {
                cmax = i
            } else {
                hight = index
            }
            
            if (nums[nums.count - index - 1] <= cmin) {
                cmin = nums[nums.count - index - 1]
            } else {
                low = nums.count - index - 1
            }
        }
        
        return hight > low ? hight - low + 1 : 0
    }
    /*
     面试题64. 求1+2+…+n
     */
    func sumNums(_ n: Int) -> Int {
        if (n <= 0) {
            return 0
        }
        
        return n + sumNums(n-1)
    }
    
    /*
     1431. 拥有最多糖果的孩子
     */
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        let max : Int! = candies.max()
        var bList = [Bool]()
        for candieCount in candies {
            if (candieCount + extraCandies >= max) {
                bList.append(true)
            } else {
                bList.append(false)
            }
        }
        return bList
    }
    
    /*
     78. 子集
     
     */
    func subsets(_ nums: [Int]) -> [[Int]] {
        var list = [[Int]]()
        
        if (nums.count == 0) {
            return list
        }
        
        list.append([])
        
        for (_, num) in nums.enumerated() {
            for (_, nums) in list.enumerated() {
                var tempNums = nums
                tempNums.append(num)
                list.append(tempNums)
            }
        }
        
        return list;
    }
    /*
     46. 全排列
     result = []
     def backtrack(路径, 选择列表):
         if 满足结束条件:
             result.add(路径)
             return
         
         for 选择 in 选择列表:
             做选择
             backtrack(路径, 选择列表)
             撤销选择
     */
    func permute(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var list = [Int]()
        var nNum = nums
        
        backTrack(&res, &list, &nNum)
        return res
    }
    
    func backTrack(_ res: inout [[Int]], _ list: inout [Int], _ nums: inout [Int]) {
        if (list.count == nums.count) {
            res.append(list)
            return;
        }
        
        for num in nums {
            if (!list.contains(num)) {
                list.append(num)
                backTrack(&res, &list, &nums)
                list.remove(at: list.count - 1)
            }
        }
    }
    
    /*
     238. 除自身以外数组的乘积
     */
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var left = 1
        var right = 1
        var list = [Int]()
        for (_, num) in nums.enumerated() {
            list.append(left)
            left *= num
        }
        
        for (index, num) in nums.enumerated().reversed() {
            list[index] *= right
            right *= num
        }
        return list
    }
    
    /*
     22. 括号生成
     */
    var list = [String]()
    func generateParenthesis(_ n: Int) -> [String] {
        
        
        generateParenthesisDfs(n, n, "")
        
        return list
    }
    
    private func generateParenthesisDfs(_ left: Int, _ right: Int, _ str: String) {
        if (left == 0 && right == 0) {
            list.append(str)
            return
        }
        
        if (left > 0) {
            generateParenthesisDfs(left - 1, right, str+"(")
        }
        
        if (right > left) {
            generateParenthesisDfs(left, right - 1, str+")")
        }
    }
    
    /*
     比特位
     */
    func countBits(_ num: Int) -> [Int] {
        var list = [Int](repeating: 0, count: num + 1)
        for i in 0...num {
            if (i%2==0) { // 偶数
                list[i] = list[i/2]
            } else {//奇数
                list[i] = list[i/2] + 1
            }
        }
        return list
    }
    
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let count = matrix.count * matrix.first!.count
        
        var numList = [Int]()
        
        var top = 0
        var left = 0
        var right = matrix.first!.count - 1
        var bottom = matrix.count - 1
        
        var findType = 0 // 0. 1. 2. 3
        
        while numList.count < count {
            if (findType == 0) {
                if (left == right) {
                    findType = 1
                    left = matrix.first!.count - abs(Int(matrix.first!.count - right)) * 2 - 1
                }
            } else if (findType == 1) {
                if (top == bottom) {
                    findType = 2
                    top = matrix.count - abs(Int(matrix.count - bottom)) * 2 - 1
                }
            } else if (findType == 2) {
                if (right == left) {
                    findType = 3
                    right = matrix.first!.count - left * 2
                }
            } else if (findType == 3) {
                if (bottom == top) {
                    findType = 0
                    bottom = matrix.count - top * 2
                    
                    top += 1
                    left += 1
                    right -= 1
                    bottom -= 1
                }
            }
            
            switch findType {
                case 0:
                    numList.append(matrix[top][left])
                    left += 1
                    break
                case 1:
                    numList.append(matrix[top][right])
                    top += 1
                    break
                case 2:
                    numList.append(matrix[bottom][right])
                    right -= 1
                    break
                case 3:
                    numList.append(matrix[bottom][left])
                    bottom -= 1
                    break
                default:
                    break
            }
        }
        
        return numList
    }
    
    /*
     最长连续序列
     */
    func longestConsecutive(_ nums: [Int]) -> Int {
        var dict = [Int:Int]()
        var maxCount = 0
        for num in nums {
            
            if dict[num] != nil {
                continue
            }
            
            let left = dict[num - 1] == nil ? 0 : dict[num - 1]!
            let right = dict[num + 1] == nil ? 0 : dict[num + 1]!
            let currentLen = 1 + left + right
            if (currentLen > maxCount) {
                maxCount = currentLen
            }
            
            dict[num] = currentLen
            dict[num - left] = currentLen
            dict[num + right] = currentLen
        }
        return maxCount
    }
    
    /*
     39. 组合总和
     给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。

     candidates 中的数字可以无限制重复被选取。

     说明：

     所有数字（包括 target）都是正整数。
     解集不能包含重复的组合。
     示例 1:

     输入: candidates = [2,3,6,7], target = 7,
     所求解集为:
     [
       [7],
       [2,2,3]
     ]
     示例 2:

     输入: candidates = [2,3,5], target = 8,
     所求解集为:
     [
       [2,2,2,2],
       [2,3,3],
       [3,5]
     ]
     */
    var combinationSumList = [[Int]]()
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var tCandidates = candidates
        tCandidates.sort()
        
        var path = [Int]()
        combinationSumHelp(tCandidates, target, 0, &path)
        return combinationSumList
    }
    
    private func combinationSumHelp(_ candidates: [Int], _ target: Int, _ begin: Int, _ path: inout [Int]) {
        if (target == 0) {
            combinationSumList.append(path)
            return;
        }
        
        for i in begin..<candidates.count {
            if (target - candidates[i] < 0) {
                continue
            }
            
            path.append(candidates[i])
            combinationSumHelp(candidates, target - candidates[i], i, &path)
            path.removeLast()
        }
    }
    
    /*
     汉明距离
     */
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var n = x ^ y
        var count = 0;
        while n > 0 {
           count += 1 ;
           n &= (n-1)
        }
        return count
    }
    
    // MARK: - 剑指Offer
    
}
