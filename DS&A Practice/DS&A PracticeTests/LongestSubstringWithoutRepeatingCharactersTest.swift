//
//  LongestSubstringWithoutRepeatingCharactersTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 8/1/24.
//

/*
 Given a string s, find the length of the longest
 substring
 without repeating characters.

 Example 1:
 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.

 Example 2:
 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.

 Example 3:
 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

 Constraints:
 0 <= s.length <= 5 * 104
 s consists of English letters, digits, symbols and spaces.
 */

import Testing

struct LongestSubstringWithoutRepeatingCharactersTest {

    class Solution {
        func lengthOfLongestSubstring(_ s: String) -> Int {
            var charIndexMap = [Character: Int]()
            var maxLength = 0
            var start = 0

            for (end, char) in s.enumerated() {
                if let lastSeen = charIndexMap[char] {
                    start = max(start, lastSeen + 1)
                }

                charIndexMap[char] = end
                maxLength = max(maxLength, end - start + 1)
            }

            return maxLength
        }
    }

    @Test func testExample1() async throws {
        let solution = Solution()
        let s = "abcabcbb"
        let output = 3

        #expect(solution.lengthOfLongestSubstring(s) == output)
    }

    @Test func testExample2() async throws {
        let solution = Solution()
        let s = "bbbbb"
        let output = 1

        #expect(solution.lengthOfLongestSubstring(s) == output)
    }

    @Test func testExample3() async throws {
        let solution = Solution()
        let s = "pwwkew"
        let output = 3

        #expect(solution.lengthOfLongestSubstring(s) == output)
    }

}
