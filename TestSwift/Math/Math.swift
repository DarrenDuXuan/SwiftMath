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
    
    /*
     283. 移动零
     给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
     示例:
     输入: [0,1,0,3,12]
     输出: [1,3,12,0,0]
     必须在原数组上操作，不能拷贝额外的数组。
     尽量减少操作次数。
     */
    //MARK: - 移动零
    class func moveZeroes(_ nums: inout [Int]) {
        let count = nums.count
        var j = 0
        for i in 0..<count {
            if nums[i] != 0 {
                if i != j {
                    nums.swapAt(i, j)
                }
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

    //MARK: -  股票的最大利润
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
                    let _ = stack.pop()
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
     两个组合总和的区别在于，第一个需要从当前index继续往后查找
     第二个在于
     */
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
            combinationSumHelp(candidates, target - candidates[i], i + 1, &path)
            path.removeLast()
        }
    }
    
    /*
     40. 组合总和 II
     给定一个数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。

     candidates 中的每个数字在每个组合中只能使用一次。

     说明：

     所有数字（包括目标数）都是正整数。
     解集不能包含重复的组合。
     示例 1:

     输入: candidates = [10,1,2,7,6,1,5], target = 8,
     所求解集为:
     [
       [1, 7],
       [1, 2, 5],
       [2, 6],
       [1, 1, 6]
     ]
     示例 2:

     输入: candidates = [2,5,2,1,2], target = 5,
     所求解集为:
     [
       [1,2,2],
       [5]
     ]
     */
    var combinationSum2 = [[Int]]()
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        if candidates.isEmpty {
            return []
        }
        var sortedCandidates = candidates
        sortedCandidates.sort()
        
        var path = [Int]()
        combinationSumHelp2(sortedCandidates, target, 0, &path)
        return combinationSum2
    }
    
    private func combinationSumHelp2(_ candidates: [Int], _ target: Int, _ begin: Int, _ path: inout [Int]) {
        if (target == 0) {
            combinationSum2.append(path)
            return;
        }
        
        for i in begin..<candidates.count {
            if i > begin && candidates[i] == candidates[i-1] {
                continue;
            }

            if (target - candidates[i] < 0) {
                continue
            }
            
            path.append(candidates[i])
            combinationSumHelp2(candidates, target - candidates[i], i + 1, &path)
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
    
    /*
     输入：一个大文件，每一行存储了一个整数
     输出：重复数的总次数
     示例：1，1，2，4，3，4，1；其中1重复了2次，4重复了1次，则输出为3
     */
    // MARK: - 重复数的总次数
    func numRepeatCount(_ numLists: [Int]) -> Int {
        if (numLists.isEmpty) {
            return 0
        }
        
        var hash = [Int:Int]()
        var count = 0
        
        for i in numLists {
            if hash[i] != nil {
                count += 1
                hash[i] = count
            } else {
                hash[i] = 1
            }
        }
        
        return count
    }
    
    /*
     输入整数数组 arr ，找出其中最小的 k 个数。例如，输入4、5、1、6、2、7、3、8这8个数字，则最小的4个数字是1、2、3、4。

     示例 1：

     输入：arr = [3,2,1], k = 2
     输出：[1,2] 或者 [2,1]
     示例 2：

     输入：arr = [0,1,2,1], k = 1
     输出：[0]
     */
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        var vArray = arr
        vArray.sort()
        var list = [Int]()
        for (index, num) in vArray.enumerated() {
            if (index <= k - 1) {
                list.append(num)
            }
            
            if (index == k - 1) {
                break
            }
        }
        return list
    }
    
    /*
        斐波那契数列
        0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233……
     */
    func fibonacci(_ n: Int) -> Int {
        if n == 0 || n == 1 {
            return n
        }
        var first = 0
        var sec = 1
        var third = 0

        for _ in 2...n {
            third = first + sec
            first = sec
            sec = third
        }

        return third
    }
    
    func fibonacci2(_ n: Int) -> Int {
        if n == 0 || n == 1 {
            return n
        }
        
        return fibonacci2(n - 1) + fibonacci2(n - 2)
    }
    
    /*
     11. 盛最多水的容器
     */
    //MARK: - 盛最多水的容器
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var res = 0
        // 双指针
        while left < right {
            let h = min(height[left], height[right])
            res = max(res, h * (right - left))
            if height[left] > height[right] {
                right -= 1
            } else {
                left += 1
            }
        }
        
        return res
    }
    
    func maxArea2(_ height: [Int]) -> Int {
        var res = 0
        
        for i in 0..<height.count-1 {
            
            for j in (i+1)..<height.count {
                
                let h = min(height[i], height[j])
                
                res = max(res, h * (j - i))
            }
            
        }
        
        return res
    }
    
    /*
     15. 三数之和
     给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有满足条件且不重复的三元组。

     注意：答案中不可以包含重复的三元组。
     示例：

     给定数组 nums = [-1, 0, 1, 2, -1, -4]，

     满足要求的三元组集合为：
     [
       [-1, 0, 1],
       [-1, -1, 2]
     ]
     */
    //MARK: - 三数之和
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
           return []
        }

        var tempNums = nums
        tempNums.sort()
        print(tempNums)
        var res : [[Int]] = [[Int]]()
        for i in 0..<tempNums.count - 2 {
            if i == 0 || (i > 0 && tempNums[i] != tempNums[i-1]) {
                var left = i + 1,
                right = tempNums.count - 1,
                sum = 0 - tempNums[i]
                while left < right {
                    if tempNums[left] + tempNums[right] == sum {
                        res.append([tempNums[i], tempNums[left], tempNums[right]])
                        while left < right && tempNums[left] == tempNums[left+1] {left += 1}
                        while left < right && tempNums[right] == tempNums[right-1] {right -= 1}
                        left += 1
                        right -= 1
                    } else if tempNums[left] + tempNums[right] < sum {
                        while left < right && tempNums[left] == tempNums[left+1] {left += 1}
                        left += 1
                    } else {
                        while left < right && tempNums[right] == tempNums[right-1] {right -= 1}
                        right -= 1
                    }
                }
            }
        }
        return res
    }
    
    /*
     16. 最接近的三数之和
     给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。
     示例：
     输入：nums = [-1,2,1,-4], target = 1
     输出：2
     解释：与 target 最接近的和是 2 (-1 + 2 + 1 = 2) 。
     */
    //MARK: - 最接近的三数之和
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        if nums.count < 3 {
            return 0
        }
        
        var vNums = nums
        vNums.sort()
        var closeNum = vNums[0] + vNums[1] + vNums[2]
        
        for i in 0..<vNums.count {
            var left = i + 1,
            right = vNums.count - 1
            
            while left < right {
                let threeNum = vNums[i] + vNums[left] + vNums[right]
                if abs(threeNum - target) < abs(closeNum - target) {
                    closeNum = threeNum
                }
                
                if threeNum > target {
                    right -= 1
                } else if threeNum < target {
                    left += 1
                } else {
                    return target
                }
            }
        }
        return closeNum
    }
    
    /*
     18. 四数之和
     给定一个包含 n 个整数的数组 nums 和一个目标值 target，判断 nums 中是否存在四个元素 a，b，c 和 d ，使得 a + b + c + d 的值与 target 相等？找出所有满足条件且不重复的四元组。

     注意：

     答案中不可以包含重复的四元组。

     示例：

     给定数组 nums = [1, 0, -1, 0, -2, 2]，和 target = 0。

     满足要求的四元组集合为：
     [
       [-1,  0, 0, 1],
       [-2, -1, 1, 2],
       [-2,  0, 0, 2]
     ]
     */
    //MARK: - 四数之和
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.count < 4 {
            return []
        }

        var vNums = nums
        vNums.sort()

        var res = [[Int]]()
        for i in 0..<vNums.count {
            
            if i > 0 && vNums[i] == vNums[i-1] {
                continue
            }
            
            let threeSum = target - vNums[i]
            
            for j in i+1..<vNums.count {
                
                if j > i+1 && vNums[j] == vNums[j-1] {
                    continue
                }
                
                var left = j + 1,
                right = vNums.count - 1,
                sum = threeSum - vNums[j]
                
                while left < right {
                    if vNums[left] + vNums[right] == sum {
                        res.append([vNums[i], vNums[j], vNums[left], vNums[right]])
                        while left < right && vNums[left] == vNums[left+1] {
                            left += 1
                        }
                        
                        while left < right && vNums[right] == vNums[right-1] {
                            right -= 1
                        }
                        
                        left += 1
                        right -= 1
                    } else if vNums[left] + vNums[right] <= sum {
                        while left < right && vNums[left] == vNums[left+1] {
                            left += 1
                        }
                        
                        left += 1
                    } else {
                        while left < right && vNums[right] == vNums[right-1] {
                            right -= 1
                        }
                        
                        right -= 1
                    }
                }
            }
        }

        return res
    }
    
    /*
     26. 删除排序数组中的重复项
     给定一个排序数组，你需要在 原地 删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。

     不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。
     示例 1:

     给定数组 nums = [1,1,2],

     函数应该返回新的长度 2, 并且原数组 nums 的前两个元素被修改为 1, 2。

     你不需要考虑数组中超出新长度后面的元素。
     示例 2:

     给定 nums = [0,0,1,1,1,2,2,3,3,4],

     函数应该返回新的长度 5, 并且原数组 nums 的前五个元素被修改为 0, 1, 2, 3, 4。

     你不需要考虑数组中超出新长度后面的元素。
      

     说明:

     为什么返回数值是整数，但输出的答案是数组呢?

     请注意，输入数组是以「引用」方式传递的，这意味着在函数里修改输入数组对于调用者是可见的。

     你可以想象内部操作如下:

     // nums 是以“引用”方式传递的。也就是说，不对实参做任何拷贝
     int len = removeDuplicates(nums);

     // 在函数里修改输入数组对于调用者是可见的。
     // 根据你的函数返回的长度, 它会打印出数组中该长度范围内的所有元素。
     for (int i = 0; i < len; i++) {
         print(nums[i]);
     }
     */
    //MARK: - 删除排序数组中的重复项
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count < 2 {
            return nums.count
        }
        
        // 快慢指针
        var index = 0
        for i in 1..<nums.count {
            if nums[index] != nums[i] {
                index += 1
                nums[index] = nums[i]
            }
        }

        return index + 1
    }
    
    /*
     27. 移除元素
     给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。

     不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。

     元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。

     示例 1:

     给定 nums = [3,2,2,3], val = 3,

     函数应该返回新的长度 2, 并且 nums 中的前两个元素均为 2。

     你不需要考虑数组中超出新长度后面的元素。
     示例 2:

     给定 nums = [0,1,2,2,3,0,4,2], val = 2,

     函数应该返回新的长度 5, 并且 nums 中的前五个元素为 0, 1, 3, 0, 4。

     注意这五个元素可为任意顺序。

     你不需要考虑数组中超出新长度后面的元素。
     */
    //MARK: - 移除元素
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
//        for (index, num) in nums.enumerated().reversed() {
//            if num == val {
//                nums.remove(at: index)
//            }
//        }
//        return nums.count
        var i = 0
        for (index, _) in nums.enumerated() {
            if nums[index] != val {
                i += 1
                nums[i] = nums[index]
            }
        }
        return i
    }
    
    /*
     33. 搜索旋转排序数组
     假设按照升序排序的数组在预先未知的某个点上进行了旋转。

     ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。

     搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。

     你可以假设数组中不存在重复的元素。

     你的算法时间复杂度必须是 O(log n) 级别。

     示例 1:

     输入: nums = [4,5,6,7,0,1,2], target = 0
     输出: 4
     示例 2:

     输入: nums = [4,5,6,7,0,1,2], target = 3
     输出: -1
     */
    //MARK:- 搜索旋转排序数组
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return -1
        }
        
        var left = 0,
        right = nums.count - 1,
        mid = 0
        
        while left <= right {
            mid = left + (right - left)/2
            
            if nums[mid] == target {
                return mid
            } else if nums[mid] < nums[right] {
                if nums[mid] < target && target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            } else {
                if nums[left] <= target && target < nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
        }
        return -1
    }
    
    /*
     34. 在排序数组中查找元素的第一个和最后一个位置
     给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。

     你的算法时间复杂度必须是 O(log n) 级别。

     如果数组中不存在目标值，返回 [-1, -1]。

     示例 1:

     输入: nums = [5,7,7,8,8,10], target = 8
     输出: [3,4]
     示例 2:

     输入: nums = [5,7,7,8,8,10], target = 6
     输出: [-1,-1]
     */
    //MARK:- 在排序数组中查找元素的第一个和最后一个位置
    class func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var res = [Int](repeating: -1, count: 2)
        if nums.isEmpty {
            return res
        }
        
        var left = 0,
            right = nums.count - 1,
            center = 0
        while left < right {
            center = left + (right - left)/2
            
            if nums[center] >= target {
                right = center
            } else {
                left = center + 1
            }
        }
        
        if nums[left] != target {
            return res
        }
        
        res[0] = left
        
        /*
         // 丑陋的解法，找到一个，因为一定是连续递增的数组，所以通过已经找到index往后查
         // 需要考虑 [1, 3] 1 -> [0, 0] 这种特殊Case就行。不够优雅
        if nums.count == 1 && nums.first == target {
            res[1] = left
            return res
        }
        
        for i in left+1..<nums.count {
            if nums[i] == target {
                res[1] = i
            } else {
                break
            }
        }
        
        if res[1] == -1 {
            res[1] = res[0]
        }
        
        return res
         */
        
        // 第二次找右边界，right == count
        // 从左往右查找
        right = nums.count
        while left < right {
            center = left + (right - left)/2
            
            if nums[center] <= target {
                left = center + 1
            } else {
                right = center
            }
        }
        res[1] = left - 1
        return res
    }
    
    
    
    private func isBadVersion(_ version: Int) -> Bool{return true}
    
    func firstBadVersion(_ n: Int) -> Int {
        var low = 0,
        hight = n
        while low < hight {
            let mid = low + (hight - low)/2
            if isBadVersion(mid) {
                hight = mid
            } else {
                low = mid + 1
            }
        }
        
        return hight
    }
    
    /*
     35. 搜索插入位置
     给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。

     你可以假设数组中无重复元素。

     示例 1:

     输入: [1,3,5,6], 5
     输出: 2
     示例 2:

     输入: [1,3,5,6], 2
     输出: 1
     示例 3:

     输入: [1,3,5,6], 7
     输出: 4
     示例 4:

     输入: [1,3,5,6], 0
     输出: 0
     */
    //MARK: - 搜索插入位置
    class func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if (nums.isEmpty) {
            return 0
        }
        
        var low = 0,
        hight = nums.count-1,
        mid = 0
        while low < hight {
            mid = low + (hight - low)/2
            
            if nums[mid] == target {
                return mid
            }
            
            if nums[mid] < target {
                low = mid + 1
            } else {
                hight = mid - 1
            }
        }
        return target > nums[low] ? low + 1 : low ;
    }
    
    /*
     48. 旋转图像
     给定一个 n × n 的二维矩阵表示一个图像。

     将图像顺时针旋转 90 度。

     说明：

     你必须在原地旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要使用另一个矩阵来旋转图像。

     示例 1:

     给定 matrix =
     [
       [1,2,3],
       [4,5,6],
       [7,8,9]
     ],

     原地旋转输入矩阵，使其变为:
     [
       [7,4,1],
       [8,5,2],
       [9,6,3]
     ]
     示例 2:

     给定 matrix =
     [
       [ 5, 1, 9,11],
       [ 2, 4, 8,10],
       [13, 3, 6, 7],
       [15,14,12,16]
     ],

     原地旋转输入矩阵，使其变为:
     [
       [15,13, 2, 5],
       [14, 3, 4, 1],
       [12, 6, 8, 9],
       [16, 7,10,11]
     ]
     */
    //MARK: - 旋转图像
    class func rotate(_ matrix: inout [[Int]]) {
        if matrix.isEmpty {
            return
        }
        
        let N = matrix.count
        
        for i in 0..<N/2 {
            for j in i..<N-1-i {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[N-1-j][i]
                matrix[N-1-j][i] = matrix[N-1-i][N-1-j]
                matrix[N-1-i][N-1-j] = matrix[j][N-1-i]
                matrix[j][N-1-i] = temp
            }
        }
    }
    
    /*
     54. 螺旋矩阵
     给定一个包含 m x n 个元素的矩阵（m 行, n 列），请按照顺时针螺旋顺序，返回矩阵中的所有元素。

     示例 1:

     输入:
     [
      [ 1, 2, 3 ],
      [ 4, 5, 6 ],
      [ 7, 8, 9 ]
     ]
     输出: [1,2,3,6,9,8,7,4,5]
     示例 2:

     输入:
     [
       [1, 2, 3, 4],
       [5, 6, 7, 8],
       [9,10,11,12]
     ]
     输出: [1,2,3,4,8,12,11,10,9,5,6,7]
     */
    //MARK: - 螺旋矩阵
    class func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        if matrix.isEmpty {
            return []
        }
        
        var numList = [Int]()
        
        var top = 0
        var left = 0
        var right = matrix.first!.count - 1
        var bottom = matrix.count - 1
                
        while true {
            for i in left...right {
                numList.append(matrix[top][i])
            }
            top += 1
            if top > bottom {
                break;
            }
            
            for i in top...bottom {
                numList.append(matrix[i][right])
            }
            right -= 1
            if right < left {
                break
            }
            
            for i in (left...right).reversed() {
                numList.append(matrix[bottom][i])
            }
            bottom -= 1
            if bottom < top {
                break
            }
            
            for i in (top...bottom).reversed() {
                numList.append(matrix[i][left])
            }
            left += 1
            if left > right {
                break
            }
        }
        
        return numList
    }
    
    /*
     55. 跳跃游戏
     给定一个非负整数数组，你最初位于数组的第一个位置。

     数组中的每个元素代表你在该位置可以跳跃的最大长度。

     判断你是否能够到达最后一个位置。

     示例 1:

     输入: [2,3,1,1,4]
     输出: true
     解释: 我们可以先跳 1 步，从位置 0 到达 位置 1, 然后再从位置 1 跳 3 步到达最后一个位置。
     示例 2:

     输入: [3,2,1,0,4]
     输出: false
     解释: 无论怎样，你总会到达索引为 3 的位置。但该位置的最大跳跃长度是 0 ， 所以你永远不可能到达最后一个位置。
     */
    //MARK: - 跳跃游戏
    class func canJump(_ nums: [Int]) -> Bool {
        if nums.isEmpty || nums.count == 1 {
            return true
        }
        
        var jumpLen = 0
        for (index, num) in nums.enumerated() {
            if index > jumpLen {
                return false
            }

            jumpLen = max(jumpLen, index + num)

            if jumpLen > nums.count - 1 {
                return true
            }
        }

        return false
    }
    
    /*
     14. 最长公共前缀
     编写一个函数来查找字符串数组中的最长公共前缀。

     如果不存在公共前缀，返回空字符串 ""。

     示例 1:

     输入: ["flower","flow","flight"]
     输出: "fl"
     示例 2:

     输入: ["dog","racecar","car"]
     输出: ""
     解释: 输入不存在公共前缀。
     */
    //MARK: - 最长公共前缀
    class func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty {
            return ""
        }
        
        if strs.count == 1 {
            return strs.first!
        }
        
        var index = 0
        var str = ""
        
        while true {
            var judgeStr = ""
            let count = strs.count
        
            for (i, string) in strs.enumerated() {
                if index >= string.count {
                    return str
                }

                let strIndex = string.index(string.startIndex, offsetBy: index)
                let endIndex = string.index(string.startIndex, offsetBy: index + 1)
                let tempStr = String(string[strIndex..<endIndex])
                if i == 0 {
                    judgeStr = tempStr
                } else {
                    if i == count - 1 {
                        if judgeStr == tempStr {
                            str += tempStr
                        } else {
                            return str
                        }
                    } else {
                        if judgeStr != tempStr {
                            return str
                        }
                    }
                }
            }
            index += 1
        }
        return str
    }
    
    /*
     56. 合并区间
     给出一个区间的集合，请合并所有重叠的区间。

    示例 1:

    输入: [[1,3],[2,6],[8,10],[15,18]]
    输出: [[1,6],[8,10],[15,18]]
    解释: 区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
    示例 2:

    输入: [[1,4],[4,5]]
    输出: [[1,5]]
    解释: 区间 [1,4] 和 [4,5] 可被视为重叠区间。
     */
    //MARK: - 合并区间
    class func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.isEmpty {
            return []
        }
        
        var vIntervals = intervals
        vIntervals = vIntervals.sorted { (n0, n1) -> Bool in
            return n0[0] < n1[0]
        }
        
        var first = [Int]()
        var res = [[Int]]()
        
        for (index, list) in vIntervals.enumerated() {
            if index == 0 {
                first = list
            }
            
            if vIntervals[index][0] <= first[1] {
                first[1] = max(first[1], vIntervals[index][1])
            } else {
                res.append(first)
                first = vIntervals[index]
            }
        }
        
        res.append(first)
        
        return res
    }
    
    /*
     59. 螺旋矩阵 II
     给定一个正整数 n，生成一个包含 1 到 n2 所有元素，且元素按顺时针顺序螺旋排列的正方形矩阵。

     示例:

     输入: 3
     输出:
     [
      [ 1, 2, 3 ],
      [ 8, 9, 4 ],
      [ 7, 6, 5 ]
     ]
     */
    //MARK:- 螺旋矩阵 II
    class func generateMatrix(_ n: Int) -> [[Int]] {
        if n == 0 {
            return []
        }
        
        if n == 1 {
            return [[1]]
        }
        
        var left = 0,
        right = n - 1,
        top = 0,
        bottom = n - 1
        
        var maxtrixList = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        var num = 0
        
        while true {
            for i in left...right {
                num += 1
                maxtrixList[top][i] = num
            }
            top += 1
            if top > bottom {
                break
            }
            
            for i in top...bottom {
                num += 1
                maxtrixList[i][right] = num
            }
            right -= 1
            if right < left {
                break
            }
            
            for i in (left...right).reversed() {
                num += 1
                maxtrixList[bottom][i] = num
            }
            bottom -= 1
            if bottom < top {
                break
            }
            
            for i in (top...bottom).reversed() {
                num += 1
                maxtrixList[i][left] = num
            }
            left += 1
            if left > right {
                break
            }
        }
        
        return maxtrixList
    }
    
    /*
     1014. 最佳观光组合
     给定正整数数组 A，A[i] 表示第 i 个观光景点的评分，并且两个景点 i 和 j 之间的距离为 j - i。

     一对景点（i < j）组成的观光组合的得分为（A[i] + A[j] + i - j）：景点的评分之和减去它们两者之间的距离。

     返回一对观光景点能取得的最高分。
     示例：

     输入：[8,1,5,2,6]
     输出：11
     解释：i = 0, j = 2, A[i] + A[j] + i - j = 8 + 5 + 0 - 2 = 11
     */
    //MARK: - 最佳观光组合
    func maxScoreSightseeingPair(_ A: [Int]) -> Int {
        var res = 0
        for j in 0..<A.count {
            for i in 0..<j {
                res = max(res, A[j] - j + A[i] + i)
            }
        }
//        return res
        
        var maxScore = Int(UInt8.min),
        left = A[0]
        
        for i in 1..<A.count {
            maxScore = max(maxScore, A[i] - i + left)
            left = max(left, A[i] + i)
        }
        return maxScore
    }
    
    /*
     62. 不同路径
     一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。

     机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。

     问总共有多少条不同的路径？
     */
    class func uniquePaths(_ m: Int, _ n: Int) -> Int {
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
        for i in 0..<n {
            for j in 0..<m {
                if i == 0 || j == 0 {
                    dp[i][j] = 1
                } else {
                    dp[i][j] = dp[i-1][j] + dp[i][j-1]
                }
            }
        }
        
        return dp[n-1][m-1]
    }
    
    class func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        if obstacleGrid.isEmpty || obstacleGrid[0].isEmpty {
            return 0
        }
        
        var res = [[Int]](repeating: [Int](repeating: 0, count: obstacleGrid[0].count), count: obstacleGrid.count)
        let count = obstacleGrid.count
        let listCount = obstacleGrid[0].count
        
        for i in 0..<count {
            
            for j in 0..<listCount {
                if obstacleGrid[i][j] == 1 {
                    res[i][j] = 0
                } else {
                    if i == 0 && j == 0 {
                        res[i][j] = 1
                    } else if i == 0 {
                        res[i][j] = res[i][j - 1]
                    } else if j == 0 {
                        res[i][j] = res[i - 1][j]
                    } else {
                        res[i][j] = res[i - 1][j] + res[i][j - 1]
                    }
                }
            }
        }
        let lastList : [Int] = res[res.count-1]
        return lastList[lastList.count-1]
    }
    
    /*
     面试题 16.24. 数对和
     设计一个算法，找出数组中两数之和为指定值的所有整数对。一个数只能属于一个数对。
     */
    //MARK: - 数对和
    class func pairSums(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.isEmpty {
            return []
        }
        
//        var dict = [Int:Int]()
//        var res = [[Int]]()
//
//        for num in nums {
//            let signNum = target - num
//            if dict[signNum] != nil && dict[signNum] ?? 0 > 0 {
//                res.append([num, signNum])
//                let i = dict[signNum]
//                dict[signNum] = i! - 1
//            } else {
//                if dict[num] != nil {
//                    var cNum = dict[num]
//                    cNum! += 1
//                    dict[num] = cNum
//                } else {
//                    dict[num] = 1
//                }
//            }
//        }
//
//        return res
        
        var vNums = nums
        vNums.sort()
        
        var begin = 0,
        end = nums.count - 1,
        res = [[Int]]()
        
        while begin < end {
            
            let curBeginNum = vNums[begin]
            let curEndNum = vNums[end]
            
            if curEndNum + curBeginNum == target {
                res.append([curBeginNum, curEndNum])
                begin += 1
                end -= 1
            } else if curEndNum + curBeginNum < target {
                begin += 1
            } else {
                end -= 1
            }
        }
        return res
    }
    
    class func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.isEmpty || matrix[0].isEmpty {
            return false
        }
        
        var row = -1
        let col = matrix[0].count - 1
        
        for i in 0..<matrix.count {
            let curNum = matrix[i][col]
            if i > 0 {
                let preNum = matrix[i-1][col]
                if target <= curNum &&
                    target > preNum &&
                    row == -1 {
                    row = i
                    break
                }
            } else {
                if target <= curNum &&
                    row == -1 {
                    row = i
                    break
                }
            }
        }
        if row == -1 {
            return false
        }
        
        let colCount = matrix[0].count
        for i in 0..<colCount {
            if matrix[row][i] == target {
                return true
            }
        }
        
        return false
    }
    
    /*
     64. 最小路径和
     给定一个包含非负整数的 m x n 网格，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。
     */
    //MARK: - 最小路径和
    class func minPathSum(_ grid: [[Int]]) -> Int {
        if grid.isEmpty {
            return 0
        }
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: grid[0].count), count: grid.count)
        
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                
                if i == 0 && j == 0 {
                    dp[i][j] = grid[0][0]
                } else if i == 0 && j != 0 {
                    dp[i][j] = dp[i][j-1] + grid[i][j]
                } else if j == 0 && i != 0 {
                    dp[i][j] = dp[i-1][j] + grid[i][j]
                } else {
                    dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + grid[i][j]
                }
            }
        }
        
        let lastList = dp.last
        let res = lastList!.last ?? 0
        return res
    }
    
    /*
     75. 颜色分类
     给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。

     此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。

     注意:
     不能使用代码库中的排序函数来解决这道题。
     */
    func sortColors(_ nums: inout [Int]) {
//        quickSortHelp(&nums, 0, nums.count-1)
        countSort(&nums)
    }
    
    private func quickSortHelp(_ nums: inout [Int], _ left: Int, _ right: Int) {
        if left >= right {
            return
        }
        
        let sign = partition(&nums, left, right)
        
        quickSortHelp(&nums, left, sign-1)
        quickSortHelp(&nums, sign+1, right)
    }
    
    private func partition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
        let sign = nums[right]
        
        var vLeft = left
        for i in left..<right {
            if sign >= nums[i] {
                nums.swapAt(vLeft, i)
                vLeft += 1
            }
        }
        
        nums.swapAt(vLeft, right)
        return vLeft
    }
    
    private func countSort(_ nums: inout [Int]) {
        var tempList = [Int](repeating: 0, count: 3)

        for num in nums {
            tempList[num] += 1
        }
        
        var resList = [Int]()
        for (index, num) in tempList.enumerated() {
            for _ in 0..<num {
                resList.append(index)
            }
        }
        nums = resList
    }
    
    private func threeQuickSort(_ nums: inout [Int]) {
        
    }
    
    private func mpSort(_ nums: inout [Int]) {
        let count = nums.count
        
        for i in 0..<count {
            for j in 0..<count-1-i {
                if nums[j] >= nums[j + 1] {
                    nums.swapAt(j, j + 1)
                }
            }
        }
    }
    
    private func insertSort(_ nums: inout [Int]) {
        for (index, num) in nums.enumerated() {
            for i in (0..<index).reversed() {
                if nums[i] >= num {
                    nums.swapAt(i, i + 1)
                }
            }
        }
    }
    
    private func selectSort(_ nums: inout [Int]) {
        for (index, _) in nums.enumerated() {
            
            var tempIndex = index
            
            for j in index+1..<nums.count {
                if nums[tempIndex] >= nums[j] {
                    tempIndex = j
                }
            }
            
            if tempIndex != index {
                nums.swapAt(tempIndex, index)
            }
        }
    }
    
    var heapCount = 0
    private func heapSort(_ nums: inout [Int]) {
        heapCount = nums.count
        
        buildHeap(&nums)
        
        for i in (0..<nums.count).reversed() {
            nums.swapAt(0, i)
            heapCount -= 1
            heapify(&nums, 0)
        }
    }
    
    private func buildHeap(_ nums: inout [Int]) {
        for i in (0..<heapCount/2).reversed() {
            heapify(&nums, i)
        }
    }
    
    private func heapify(_ nums: inout [Int], _ i: Int) {
        var left = i * 2 + 1,
        right = i * 2 + 2,
        center = i
        if left < heapCount && nums[left] >= nums[center] {
            center = left
        }
        
        if right < heapCount && nums[right] >= nums[center] {
            center = right
        }
        
        if center != i {
            nums.swapAt(i, center)
            heapify(&nums, center)
        }
    }
    
    class func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
    
        for num in nums {
            for (index, list) in res.enumerated() {
                var vList = list
                vList.append(num)
                res.remove(at: index)
                res.insert(vList, at: index)
            }
            
            res.append([num])
        }
        res.append([])
        return res
    }
    
    class func minimumTotal(_ triangle: [[Int]]) -> Int {
        var total = 0
        if (triangle.isEmpty) {
            return 0
        }
        
        var tempIndex = 0
        
        for (_, list) in triangle.enumerated() {
            var tempNum = -1
            
            for i in tempIndex...tempIndex+1 {
                if i < list.count {
                    let num = list[i]
                    if (tempNum == -1) {
                        tempNum = num
                        tempIndex = i
                    } else {
                        if tempNum > num {
                            tempNum = num
                            tempIndex = i
                        }
                    }
                }
            }
            
            total += tempNum
        }
        
        return total
    }
    
    //MARK: - LeetCode 1133
    class Solution {
        func largestUniqueNumber(_ A: [Int]) -> Int {
            var M:[Int:Int] = [Int:Int]()
            var ans:Int = -1
            for num in A
            {
                M[num,default:0] += 1
            }
            for (key,val) in M
            {
                if val == 1
                {
                     ans = max(ans,key)
                }
            }
            return ans
        }
    }
    
    /*
     179. 最大数
     给定一组非负整数，重新排列它们的顺序使之组成一个最大的整数。

     示例 1:

     输入: [10,2]
     输出: 210
     示例 2:

     输入: [3,30,34,5,9]
     输出: 9534330
     说明: 输出结果可能非常大，所以你需要返回一个字符串而不是整数。
     */
    class func largestNumber(_ nums: [Int]) -> String {
//        let sorded = nums.map{ "\($0)" }.sorted{ $0+$1 > $1+$0 }
//        if sorded[0].isEqual("0") { return "0" }
//        return sorded.joined()
        
        var sorted = nums.map { (num) -> String in
            return String(num)
        }
        
        sorted = sorted.sorted { (s1, s2) -> Bool in
            return s1 + s2 > s2 + s1
        }
        
        if sorted[0].isEqual("0") {
            return "0"
        }
        
        let s1 = sorted.joined()
        return s1
    }
    
    
}


