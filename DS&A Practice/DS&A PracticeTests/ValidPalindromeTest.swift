//
//  ValidPalindromeTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/15/24.
//

/*
 A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.
 Given a string s, return true if it is a palindrome, or false otherwise.

 Example 1:
 Input: s = "A man, a plan, a canal: Panama"
 Output: true
 Explanation: "amanaplanacanalpanama" is a palindrome.

 Example 2:
 Input: s = "race a car"
 Output: false
 Explanation: "raceacar" is not a palindrome.

 Example 3:
 Input: s = " "
 Output: true
 Explanation: s is an empty string "" after removing non-alphanumeric characters.
 Since an empty string reads the same forward and backward, it is a palindrome.

 Constraints:
 1 <= s.length <= 2 * 105
 s consists only of printable ASCII characters.
 */


import Foundation
import Testing

struct ValidPalindromeTest {

    class Solution {
        func isPalindrome(_ s: String) -> Bool {
            // Convert the string to lowercase and filter out non-alphanumeric characters
            let cleanedString = s.lowercased().filter { $0.isLetter || $0.isNumber }

            // Convert string to array for easier two-pointer technique
            let chars = Array(cleanedString)
            var left = 0
            var right = chars.count - 1

            // Compare characters from both ends moving towards the center
            while left < right {
                if chars[left] != chars[right] {
                    return false
                }
                left += 1
                right -= 1
            }
            return true
        }
    }

    @Test func example1() {
        #expect(Solution().isPalindrome("A man, a plan, a canal: Panama"))
    }

    @Test func example2() {
        #expect(!Solution().isPalindrome("race a car"))
    }

    @Test func example3() {
        #expect(Solution().isPalindrome(" "))
    }
}
