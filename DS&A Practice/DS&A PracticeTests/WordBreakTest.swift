//
//  WordBreakTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/29/24.
//

/*
 Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words.
 Note that the same word in the dictionary may be reused multiple times in the segmentation.

 Example 1:
 Input: s = "leetcode", wordDict = ["leet","code"]
 Output: true
 Explanation: Return true because "leetcode" can be segmented as "leet code".

 Example 2:
 Input: s = "applepenapple", wordDict = ["apple","pen"]
 Output: true
 Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
 Note that you are allowed to reuse a dictionary word.

 Example 3:
 Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
 Output: false

 Constraints:
 1 <= s.length <= 300
 1 <= wordDict.length <= 1000
 1 <= wordDict[i].length <= 20
 s and wordDict[i] consist of only lowercase English letters.
 All the strings of wordDict are unique.
 */

import Testing

struct WordBreakTest {

    class Solution {
        func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
            let n = s.count
            // Convert string to array of characters for easier indexing
            let characters = Array(s)
            var dp = [Bool](repeating: false, count: n + 1)
            dp[0] = true  // Empty string can always be segmented

            // Convert wordDict to a Set for O(1) lookup time
            let wordSet = Set(wordDict)

            for i in 1...n {
                for j in 0..<i {
                    if dp[j] {
                        // If the substring from j to i exists in wordSet
                        let substring = String(characters[j..<i])
                        if wordSet.contains(substring) {
                            dp[i] = true
                            break  // No need to check further for this i
                        }
                    }
                }
            }
            return dp[n]
        }
    }

    @Test func example1() {
        #expect(Solution().wordBreak("leetcode", ["leet", "code"]))
    }

    @Test func example2() {
        #expect(Solution().wordBreak("applepenapple", ["apple", "pen"]))
    }

    @Test func example3() {
        #expect(!Solution().wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]))
    }

}
