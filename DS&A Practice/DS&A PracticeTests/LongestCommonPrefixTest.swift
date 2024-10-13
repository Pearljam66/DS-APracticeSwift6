//
//  LongestCommonPrefixTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/13/24.
//

/*
 Write a function to find the longest common prefix string amongst an array of strings.
 If there is no common prefix, return an empty string "".

 Example 1:
 Input: strs = ["flower","flow","flight"]
 Output: "fl"

 Example 2:
 Input: strs = ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.

 Constraints:
 1 <= strs.length <= 200
 0 <= strs[i].length <= 200
 strs[i] consists of only lowercase English letters.
 */

import Testing

struct LongestCommonPrefixTest {

    class Solution {
        func longestCommonPrefix(_ strs: [String]) -> String {
            // If the array is empty, return an empty string
            guard !strs.isEmpty else { return "" }

            // Sort the array to ensure the shortest string is first; this can optimize the comparison process
            let sortedStrs = strs.sorted { $0.count < $1.count }
            let firstString = sortedStrs.first!

            // Iterate through each character of the first string
            for (index, char) in firstString.enumerated() {
                // Check this character against all other strings
                for string in sortedStrs.dropFirst() {
                    if string.count <= index || string[string.index(string.startIndex, offsetBy: index)] != char {
                        // If the character doesn't match or we've gone past the end of a string, return the prefix up to this point
                        return String(firstString.prefix(index))
                    }
                }
            }

            // If we've made it through the loop, the entire first string is the common prefix
            return firstString
        }
    }

    @Test func example1() {
        #expect(Solution().longestCommonPrefix(["flower", "flow", "flight"]) == "fl")
    }

    @Test func example2() {
        #expect(Solution().longestCommonPrefix(["dog", "racecar", "car"]) == "")
    }

}
