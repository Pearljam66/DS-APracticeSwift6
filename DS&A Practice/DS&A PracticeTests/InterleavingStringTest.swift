//
//  InterleavingStringTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/1/24.
//

/*
 Given strings s1, s2, and s3, find whether s3 is formed by an interleaving of s1 and s2.
 An interleaving of two strings s and t is a configuration where s and t are divided into n and m
 substrings
 respectively, such that:

 s = s1 + s2 + ... + sn
 t = t1 + t2 + ... + tm
 |n - m| <= 1
 The interleaving is s1 + t1 + s2 + t2 + s3 + t3 + ... or t1 + s1 + t2 + s2 + t3 + s3 + ...
 Note: a + b is the concatenation of strings a and b.

 Example 1:
 Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
 Output: true
 Explanation: One way to obtain s3 is:
 Split s1 into s1 = "aa" + "bc" + "c", and s2 into s2 = "dbbc" + "a".
 Interleaving the two splits, we get "aa" + "dbbc" + "bc" + "a" + "c" = "aadbbcbcac".
 Since s3 can be obtained by interleaving s1 and s2, we return true.

 Example 2:
 Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbbaccc"
 Output: false
 Explanation: Notice how it is impossible to interleave s2 with any other string to obtain s3.

 Example 3:
 Input: s1 = "", s2 = "", s3 = ""
 Output: true

 Constraints:
 0 <= s1.length, s2.length <= 100
 0 <= s3.length <= 200
 s1, s2, and s3 consist of lowercase English letters.
 */

import Testing

struct InterleavingStringTest {

    class Solution {
        func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
            // Convert strings to arrays of characters for easier indexing
            let chars1 = Array(s1), chars2 = Array(s2), chars3 = Array(s3)
            let len1 = chars1.count, len2 = chars2.count, len3 = chars3.count

            // If s3 length does not match sum of s1 and s2 lengths, return false
            if len1 + len2 != len3 {
                return false
            }

            // Edge case: if all strings are empty or s2 is empty and s1 matches s3 or vice versa
            if len1 == 0 && len2 == 0 && len3 == 0 {
                return true
            }
            if len2 == 0 {
                return s1 == s3
            }
            if len1 == 0 {
                return s2 == s3
            }

            // 2D array for dynamic programming, we add 1 to lengths for base cases (empty string)
            var dp = [[Bool]](repeating: [Bool](repeating: false, count: len2 + 1), count: len1 + 1)

            // Base case - empty strings interleave to form an empty string
            dp[0][0] = true

            // Fill first row where s2 could be empty
            for j in 1...len2 {
                if chars2[j-1] == chars3[j-1] {
                    dp[0][j] = dp[0][j-1]
                } else {
                    break // No need to continue if we don't match
                }
            }

            // Fill first column where s1 could match with s3
            for i in 1...len1 {
                if chars1[i-1] == chars3[i-1] {
                    dp[i][0] = dp[i-1][0]
                } else {
                    break // No need to continue if we don't match
                }
            }

            // Fill the dp table
            for i in 1...len1 {
                for j in 1...len2 {
                    // Check if we can match with s1 or s2
                    if (chars1[i-1] == chars3[i+j-1] && dp[i-1][j]) ||
                        (chars2[j-1] == chars3[i+j-1] && dp[i][j-1]) {
                        dp[i][j] = true
                    }
                }
            }
            return dp[len1][len2]
        }
    }

    @Test func example1() {
        #expect(Solution().isInterleave("aabcc", "dbbca", "aadbbcbcac"))
    }

    @Test func example2() {
        #expect(!Solution().isInterleave("aabcc", "dbbca", "aadbbbccac"))
    }

    @Test func example3() {
        #expect(!Solution().isInterleave("", "", ""))
    }

}
