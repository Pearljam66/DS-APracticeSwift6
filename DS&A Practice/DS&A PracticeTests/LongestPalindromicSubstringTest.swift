//
//  LongestPalindromicSubstringTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/19/24.
//

/*
 Given a string s, return the longest palindromic substring in s.

 Example 1:
 Input: s = "babad"
 Output: "bab"
 Explanation: "aba" is also a valid answer.

 Example 2:
 Input: s = "cbbd"
 Output: "bb"

 Constraints:
 1 <= s.length <= 1000
 s consist of only digits and English letters.
 */

import Testing

struct LongestPalindromicSubstringTest {

    class Solution {
        func longestPalindrome(_ s: String) -> String {
            if s.count < 2 {
                return s
            }

            let chars = Array(s)
            var start = 0
            var maxLength = 1

            func expandAroundCenter(_ left: Int, _ right: Int) -> Int {
                var L = left
                var R = right
                while L >= 0 && R < chars.count && chars[L] == chars[R] {
                    if (R - L + 1) > maxLength {
                        start = L
                        maxLength = R - L + 1
                    }
                    L -= 1
                    R += 1
                }
                return R - L - 1  // Return the length of palindrome found around this center
            }

            // Check for odd and even length palindromes
            for i in 0..<chars.count {
                _ = expandAroundCenter(i, i)       // Odd length palindromes
                _ = expandAroundCenter(i, i + 1)   // Even length palindromes
            }

            return String(chars[start..<start + maxLength])
        }
    }

    @Test func example1() {
        #expect(Solution().longestPalindrome("babad") == "bab")
    }

    @Test func example2() {
        #expect(Solution().longestPalindrome("cbbd") == "bb")
    }

}
