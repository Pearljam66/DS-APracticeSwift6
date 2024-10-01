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

// TODO: Fix, has memory issues
import Testing

struct InterleavingStringTest {

    class Solution {
        func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
            // Convert strings to arrays of characters for easier indexing
            let s1Chars = Array(s1), s2Chars = Array(s2), s3Chars = Array(s3)

            let len1 = s1Chars.count, len2 = s2Chars.count, len3 = s3Chars.count

            // If the lengths do not add up, return false immediately
            if len1 + len2 != len3 {
                return false
            }

            // dp[i][j] represents if s3 up to i+j can be formed by interleaving of s1 up to i and s2 up to j
            var dp = Array(repeating: Array(repeating: false, count: len2 + 1), count: len1 + 1)

            // Base case: empty strings interleave to form an empty string
            dp[0][0] = true

            // Fill first row (s1 is empty)
            for j in 1...len2 {
                dp[0][j] = dp[0][j-1] && (s2Chars[j-1] == s3Chars[j-1])
            }

            // Fill first column (s2 is empty)
            for i in 1...len1 {
                dp[i][0] = dp[i-1][0] && (s1Chars[i-1] == s3Chars[i-1])
            }

            // Fill the rest of the dp table
            for i in 1...len1 {
                for j in 1...len2 {
                    // If the current character in s3 matches with s1, we take the result from above
                    // or if it matches with s2, we take the result from left
                    dp[i][j] = (dp[i-1][j] && s3Chars[i+j-1] == s1Chars[i-1]) ||
                    (dp[i][j-1] && s3Chars[i+j-1] == s2Chars[j-1])
                }
            }

            // The result is in the bottom right corner of dp
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
