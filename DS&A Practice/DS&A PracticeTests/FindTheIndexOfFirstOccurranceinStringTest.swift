//
//  FindTheIndexOfFirstOccurranceinStringTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/15/24.
//

/*
 Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

 Example 1:
 Input: haystack = "sadbutsad", needle = "sad"
 Output: 0
 Explanation: "sad" occurs at index 0 and 6.
 The first occurrence is at index 0, so we return 0.

 Example 2:
 Input: haystack = "leetcode", needle = "leeto"
 Output: -1
 Explanation: "leeto" did not occur in "leetcode", so we return -1.

 Constraints:
 1 <= haystack.length, needle.length <= 104
 haystack and needle consist of only lowercase English characters.
 */

import Testing

struct FindTheIndexOfFirstOccurranceinStringTest {

    class Solution {
        func strStr(_ haystack: String, _ needle: String) -> Int {
            if needle.isEmpty {
                return 0
            }

            let haystackChars = Array(haystack)
            let needleChars = Array(needle)

            if needleChars.count > haystackChars.count {
                return -1
            }

            for i in 0...haystackChars.count - needleChars.count {
                var j = 0

                while j < needleChars.count && haystackChars[i + j] == needleChars[j] {
                    j += 1
                }

                if j == needleChars.count {
                    return i
                }
            }
            return -1
        }
    }

    @Test func example1() {
        #expect(Solution().strStr("sadbutsad", "sad") == 0)
    }

    @Test func example2() {
        #expect(Solution().strStr("leetcode", "leeto") == -1)
    }

}
