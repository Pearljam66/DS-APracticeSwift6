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
            guard !t.isEmpty else {
                return ""
            }
            // Convert strings to character arrays for easier indexing
            let sChars = Array(s)
            let tChars = Array(t)

            // Create frequency maps
            var tFreq = [Character: Int]()
            for char in tChars {
                tFreq[char, default: 0] += 1
            }

            var windowFreq = [Character: Int]()
            var have = 0
            let need = tFreq.count

            var result = ""
            var minLength = Int.max
            var left = 0

            for right in 0..<sChars.count {
                let rightChar = sChars[right]

                if tFreq[rightChar] != nil {
                    windowFreq[rightChar, default: 0] += 1
                    if windowFreq[rightChar] == tFreq[rightChar] {
                        have += 1
                    }
                }

                while have == need {
                    // Update result if current window is smaller
                    if right - left + 1 < minLength {
                        minLength = right - left + 1
                        result = String(sChars[left...right])
                    }

                    let leftChar = sChars[left]
                    if tFreq[leftChar] != nil {
                        windowFreq[leftChar]! -= 1
                        if windowFreq[leftChar]! < tFreq[leftChar]! {
                            have -= 1
                        }
                    }

                    left += 1
                }
            }
            return result
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
