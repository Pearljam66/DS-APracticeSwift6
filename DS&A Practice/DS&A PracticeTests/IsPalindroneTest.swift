//
//  IsPalindroneTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/24/24.
//

/*
 Given an integer x, return true if x is a
 palindrome, and false otherwise.

 Example 1:
 Input: x = 121
 Output: true
 Explanation: 121 reads as 121 from left to right and from right to left.

 Example 2:
 Input: x = -121
 Output: false
 Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.

 Example 3:
 Input: x = 10
 Output: false
 Explanation: Reads 01 from right to left. Therefore it is not a palindrome.

 Constraints:
 -231 <= x <= 231 - 1
 */

import Testing

struct IsPalindroneTest {

    class Solution {
        func isPalindrome(_ x: Int) -> Bool {
            // Negative numbers are not palindromes
            if x < 0 {
                return false
            }

            // Single digit numbers are palindromes
            if x < 10 {
                return true
            }

            // Convert the integer to a string
            let str = String(x)

            // Compare characters from start and end
            var left = str.startIndex
            var right = str.index(before: str.endIndex)

            while left < right {
                if str[left] != str[right] {
                    return false
                }
                left = str.index(after: left)
                right = str.index(before: right)
            }

            return true
        }
    }

    @Test func example1() {
        #expect(Solution().isPalindrome(121) == true)
    }

    @Test func example2() {
        #expect(Solution().isPalindrome(-121) == false)
    }

    @Test func example3() {
        #expect(Solution().isPalindrome(10) == false)
    }

    

}
