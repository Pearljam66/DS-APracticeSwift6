//
//  MinimumWindowSubstringTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 8/4/24.
//

/*
 Given two strings s and t of lengths m and n respectively, return the minimum window
 substring of s such that every character in t (including duplicates) is included in the window.
 If there is no such substring, return the empty string "".
 The test cases will be generated such that the answer is unique.

 Example 1:
 Input: s = "ADOBECODEBANC", t = "ABC"
 Output: "BANC"
 Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.

 Example 2:
 Input: s = "a", t = "a"
 Output: "a"
 Explanation: The entire string s is the minimum window.

 Example 3:
 Input: s = "a", t = "aa"
 Output: ""
 Explanation: Both 'a's from t must be included in the window.
 Since the largest window of s only has one 'a', return empty string.

 Constraints:

 m == s.length
 n == t.length
 1 <= m, n <= 105
 s and t consist of uppercase and lowercase English letters.
 */

import Testing

struct MinimumWindowSubstringTest {

    class Solution {
        func minWindow(_ s: String, _ t: String) -> String {
            guard !t.isEmpty else { return "" }

            var needCount = [Character: Int]()
            for char in t {
                needCount[char, default: 0] += 1
            }

            var windowCount = [Character: Int]()
            var have = 0
            let need = needCount.count

            var result = (0, -1)  // (start, length)
            var left = 0
            let sChars = Array(s)

            for right in 0..<sChars.count {
                let rightChar = sChars[right]

                if let count = needCount[rightChar] {
                    windowCount[rightChar, default: 0] += 1
                    if windowCount[rightChar] == count {
                        have += 1
                    }
                }

                while have == need {
                    // Update result if current window is smaller
                    if result.1 == -1 || right - left + 1 < result.1 {
                        result = (left, right - left + 1)
                    }

                    let leftChar = sChars[left]
                    if let count = needCount[leftChar] {
                        windowCount[leftChar]! -= 1
                        if windowCount[leftChar]! < count {
                            have -= 1
                        }
                    }

                    left += 1
                }
            }

            return result.1 == -1 ? "" : String(sChars[result.0..<(result.0 + result.1)])
        }
    }

    @Test func testExample1() {
        let solution = Solution()
        let s = "ADOBECODEBANC"
        let t = "ABC"
        let output = "BANC"

        #expect(solution.minWindow(s, t) == output)
    }

    @Test func testExample2() {
        let solution = Solution()
        let s = "a"
        let t = "a"
        let output = "a"

        #expect(solution.minWindow(s, t) == output)
    }

    @Test func testExample3() {
        let solution = Solution()
        let s = "a"
        let t = "aa"
        let output = ""

        #expect(solution.minWindow(s, t) == output)
    }
}
