//
//  IsSubsequenceTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/15/24.
//

/*
 Given two strings s and t, return true if s is a subsequence of t, or false otherwise.
 A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

 Example 1:
 Input: s = "abc", t = "ahbgdc"
 Output: true

 Example 2:
 Input: s = "axc", t = "ahbgdc"
 Output: false

 Constraints:
 0 <= s.length <= 100
 0 <= t.length <= 104
 s and t consist only of lowercase English letters.
 */

import Testing

struct IsSubsequenceTest {

    class Solution {
        func isSubsequence(_ s: String, _ t: String) -> Bool {
            // Convert strings to arrays of characters for easier manipulation
            let sChars = Array(s)
            let tChars = Array(t)

            var sIndex = 0

            // Iterate through each character in t
            for tChar in tChars {
                // If characters match, move to the next character in s
                if sIndex < sChars.count && tChar == sChars[sIndex] {
                    sIndex += 1
                }
            }

            // If we've gone through all characters in s, then s is a subsequence of t
            return sIndex == sChars.count
        }
    }

    @Test func example1() {
        #expect(Solution().isSubsequence("abc", "ahbgdc") == true)
    }

    @Test func example2() {
        #expect(Solution().isSubsequence("axc", "ahbgdc") == false)
    }

}
