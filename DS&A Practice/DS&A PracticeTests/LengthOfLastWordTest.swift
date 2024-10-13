//
//  LengthOfLastWordTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/13/24.
//

/*
 Given a string s consisting of words and spaces, return the length of the last word in the string.
 A word is a maximal
 substring
 consisting of non-space characters only.

 Example 1:
 Input: s = "Hello World"
 Output: 5
 Explanation: The last word is "World" with length 5.

 Example 2:
 Input: s = "   fly me   to   the moon  "
 Output: 4
 Explanation: The last word is "moon" with length 4.

 Example 3:
 Input: s = "luffy is still joyboy"
 Output: 6
 Explanation: The last word is "joyboy" with length 6.

 Constraints:
 1 <= s.length <= 104
 s consists of only English letters and spaces ' '.
 There will be at least one word in s.
 */

import Testing

struct LengthOfLastWordTest {

    class Solution {
        func lengthOfLastWord(_ s: String) -> Int {
            // Convert the string into an array of characters for easier manipulation
            let characters = Array(s)

            // Start from the end of the string and move backwards
            var length = 0
            var i = characters.count - 1

            // Skip trailing spaces
            while i >= 0 && characters[i] == " " {
                i -= 1
            }

            // Count the characters in the last word
            while i >= 0 && characters[i] != " " {
                length += 1
                i -= 1
            }

            return length
        }
    }

    @Test func example1() {
        #expect(Solution().lengthOfLastWord("Hello World") == 5)
    }

    @Test func example2() {
        #expect(Solution().lengthOfLastWord("   fly me   to   the moon  ") == 4)
    }

    @Test func example3() {
        #expect(Solution().lengthOfLastWord("luffy is still joyboy") == 6)
    }

}
