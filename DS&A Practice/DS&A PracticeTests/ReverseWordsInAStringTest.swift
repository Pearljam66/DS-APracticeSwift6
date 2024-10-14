//
//  ReverseWordsInAStringTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/14/24.
//

/*
 Given an input string s, reverse the order of the words.
 A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.
 Return a string of the words in reverse order concatenated by a single space.
 Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.

 Example 1:
 Input: s = "the sky is blue"
 Output: "blue is sky the"

 Example 2:
 Input: s = "  hello world  "
 Output: "world hello"
 Explanation: Your reversed string should not contain leading or trailing spaces.

 Example 3:
 Input: s = "a good   example"
 Output: "example good a"
 Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.

 Constraints:
 1 <= s.length <= 104
 s contains English letters (upper-case and lower-case), digits, and spaces ' '.
 There is at least one word in s.
 */

import Testing

struct ReverseWordsInAStringTest {

    class Solution {
        func reverseWords(_ s: String) -> String {
            let words = s.components(separatedBy: .whitespaces).filter { !$0.isEmpty }
            return words.reversed().joined(separator: " ")
        }
    }

    @Test func example1() {
        #expect(Solution().reverseWords("the sky is blue") == "blue is sky the")
    }

    @Test func example2() {
        #expect(Solution().reverseWords("  hello world  ") == "world hello")
    }

    @Test func example3() {
        #expect(Solution().reverseWords("a good   example") == "example good a")
    }

}
