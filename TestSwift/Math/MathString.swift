//
//  MathString.swift
//  TestSwift
//
//  Created by darren on 2020/6/6.
//  Copyright © 2020 杜璇. All rights reserved.
//

import UIKit

class MathString: NSObject {
    //MARK: - 无重复字符的最长子串
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var count = 0
        var left = 0
        var right = 0
        var strList = [Character]()
        
        for (_, str) in s.enumerated() {
            if !strList.isEmpty {
                while strList.contains(str) && !strList.isEmpty {
                    strList.removeFirst()
                    left += 1
                }
            }
            
            strList.append(str)
            right += 1
            
            count = max(count, strList.count)
        }
        
        return count
    }
    
    //MARK: - 5. 字符串相乘
    func multiply(_ num1: String, _ num2: String) -> String {
        let n1 = num1.count-1
        let n2 = num2.count-1
        if n1 < 0 || n2 < 0 {
            return ""
        }
        
        var list = [Int](repeating: 0, count: n1 + n2 + 2)
        for i in (0...n1).reversed() {
            for j in (0...n2).reversed() {
                
                let s1 = num1[num1.index(num1.startIndex, offsetBy: i)]
                let s2 = num2[num2.index(num2.startIndex, offsetBy: j)]
                var num = Int(String(s1))! * Int(String(s2))!
                num += list[i+j+1]
                
                list[i+j] += num/10
                list[i+j+1] = num%10
            }
        }
        
        let count = list.count-1
        for _ in 0..<count {
            if list.first == 0 {
                list.removeFirst()
            } else {
                break
            }
        }
        
        var res = ""
        
        for i in list {
            res.append(String(i))
        }
        
        return res
    }
    
    /*
     写一个函数 StrToInt，实现把字符串转换成整数这个功能。不能使用 atoi 或者其他类似的库函数。
     
     首先，该函数会根据需要丢弃无用的开头空格字符，直到寻找到第一个非空格的字符为止。

     当我们寻找到的第一个非空字符为正或者负号时，则将该符号与之后面尽可能多的连续数字组合起来，作为该整数的正负号；假如第一个非空字符是数字，则直接将其与之后连续的数字字符组合起来，形成整数。

     该字符串除了有效的整数部分之后也可能会存在多余的字符，这些字符可以被忽略，它们对于函数不应该造成影响。

     注意：假如该字符串中的第一个非空格字符不是一个有效整数字符、字符串为空或字符串仅包含空白字符时，则你的函数不需要进行转换。

     在任何情况下，若函数不能进行有效的转换时，请返回 0。
     */
    
    //MARK: - 剑指 Offer 67. 把字符串转换成整数
    func strToInt(_ str: String) -> Int {

        return 0
    }
    
    /*
     给定一个非空的字符串，判断它是否可以由它的一个子串重复多次构成。给定的字符串只含有小写英文字母，并且长度不超过10000。

     示例 1:
     输入: "abab"
     输出: True
     解释: 可由子字符串 "ab" 重复两次构成。
     示例 2:
     输入: "aba"

     输出: False
     示例 3:
     输入: "abcabcabcabc"
     输出: True
     解释: 可由子字符串 "abc" 重复四次构成。 (或者子字符串 "abcabc" 重复两次构成。)

     */
    //MARK: - 给定一个非空的字符串，判断它是否可以由它的一个子串重复多次构成。给定的字符串只含有小写英文字母，并且长度不超过10000。
    func repeatedSubstringPattern(_ s: String) -> Bool {
        if s.count <= 1 { return false }
        var result = s + s;
        result = String(result[result.index(result.startIndex, offsetBy: 1)..<result.index(result.endIndex, offsetBy: -1)])
        return result.contains(s)

    }
}
