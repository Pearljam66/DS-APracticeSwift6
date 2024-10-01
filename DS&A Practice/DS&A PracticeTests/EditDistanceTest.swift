//
//  EditDistanceTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/1/24.
//

/*
 Given two strings word1 and word2, return the minimum number of operations required to convert word1 to word2.
 You have the following three operations permitted on a word:
 Insert a character
 Delete a character
 Replace a character

 Example 1:
 Input: word1 = "horse", word2 = "ros"
 Output: 3
 Explanation:
 horse -> rorse (replace 'h' with 'r')
 rorse -> rose (remove 'r')
 rose -> ros (remove 'e')

 Example 2:
 Input: word1 = "intention", word2 = "execution"
 Output: 5
 Explanation:
 intention -> inention (remove 't')
 inention -> enention (replace 'i' with 'e')
 enention -> exention (replace 'n' with 'x')
 exention -> exection (replace 'n' with 'c')
 exection -> execution (insert 'u')

 Constraints:
 0 <= word1.length, word2.length <= 500
 word1 and word2 consist of lowercase English letters.
 */

import Testing

struct EditDistanceTest {

    class Solution {
        func minDistance(_ word1: String, _ word2: String) -> Int {
            // If one string is empty, the result is the length of the other string
            if word1.isEmpty {
                return word2.count
            }
            if word2.isEmpty {
                return word1.count
            }

            let m = word1.count
            let n = word2.count

            // Convert strings to arrays for easier character access
            let word1Chars = Array(word1)
            let word2Chars = Array(word2)

            // dp[i][j] represents the min edit distance between word1[0...i-1] and word2[0...j-1]
            var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)

            // Initialize the first row and column
            for i in 0...m {
                dp[i][0] = i  // Number of deletions needed for i characters
            }
            for j in 0...n {
                dp[0][j] = j  // Number of insertions needed for j characters
            }

            // Fill in the rest of the table
            for i in 1...m {
                for j in 1...n {
                    if word1Chars[i-1] == word2Chars[j-1] {
                        dp[i][j] = dp[i-1][j-1]  // If characters match, no new operation needed
                    } else {
                        // Minimum of insert, delete, or replace, add 1 for the current operation
                        dp[i][j] = 1 + min(dp[i-1][j],      // Delete
                                           dp[i][j-1],      // Insert
                                           dp[i-1][j-1])    // Replace
                    }
                }
            }

            return dp[m][n]
        }
    }

    @Test func example1() {
        #expect(Solution().minDistance("horse", "ros") == 3)
    }

    @Test func example2() {
        #expect(Solution().minDistance("intention", "execution") == 5)
    }

}
