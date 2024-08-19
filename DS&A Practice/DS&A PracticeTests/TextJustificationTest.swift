//
//  TextJustificationTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 8/19/24.
//

/*
 Given an array of strings words and a width maxWidth, format the text such that each line has exactly maxWidth characters and is fully (left and right) justified.
 You should pack your words in a greedy approach; that is, pack as many words as you can in each line. Pad extra spaces ' ' when necessary so that each line has exactly maxWidth characters.
 Extra spaces between words should be distributed as evenly as possible. If the number of spaces on a line does not divide evenly between words, the empty slots on the left will be assigned more spaces than the slots on the right.
 For the last line of text, it should be left-justified, and no extra space is inserted between words.

 Note:
 A word is defined as a character sequence consisting of non-space characters only.
 Each word's length is guaranteed to be greater than 0 and not exceed maxWidth.
 The input array words contains at least one word.

 Example 1:
 Input: words = ["This", "is", "an", "example", "of", "text", "justification."], maxWidth = 16
 Output:
 [
 "This    is    an",
 "example  of text",
 "justification.  "
 ]

 Example 2:
 Input: words = ["What","must","be","acknowledgment","shall","be"], maxWidth = 16
 Output:
 [
 "What   must   be",
 "acknowledgment  ",
 "shall be        "
 ]
 Explanation: Note that the last line is "shall be    " instead of "shall     be", because the last line must be left-justified instead of fully-justified.
 Note that the second line is also left-justified because it contains only one word.

 Example 3:
 Input: words = ["Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"], maxWidth = 20
 Output:
 [
 "Science  is  what we",
 "understand      well",
 "enough to explain to",
 "a  computer.  Art is",
 "everything  else  we",
 "do                  "
 ]

 Constraints:
 1 <= words.length <= 300
 1 <= words[i].length <= 20
 words[i] consists of only English letters and symbols.
 1 <= maxWidth <= 100
 words[i].length <= maxWidth
 */

import Testing

struct TextJustificationTest {

    class Solution {
        func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
            var result = [String]()
            var currentLine = [String]()
            var currentLineLength = 0

            for word in words {
                // Check if adding the current word would exceed maxWidth
                if currentLineLength + word.count + currentLine.count > maxWidth {
                    // Distribute spaces as evenly as possible
                    for i in 0..<maxWidth - currentLineLength {
                        currentLine[i % (currentLine.count - 1 == 0 ? 1 : currentLine.count - 1)] += " "
                    }
                    result.append(currentLine.joined())
                    currentLine = []
                    currentLineLength = 0
                }
                // Add the current word to the line
                currentLine.append(word)
                currentLineLength += word.count
            }

            // Handle the last line (left-justified)
            let lastLine = currentLine.joined(separator: " ")
            let lastLinePadded = lastLine + String(repeating: " ", count: maxWidth - lastLine.count)
            result.append(lastLinePadded)

            return result
        }

    }

    @Test func example1() {
        let solution = Solution()
        let result = solution.fullJustify(["This", "is", "an", "example", "of", "text", "justification."], 16)
        #expect(result == [
            "This    is    an",
            "example  of text",
            "justification.  "
        ])
    }

    @Test func example2() {
        let solution = Solution()
        let result = solution.fullJustify(["What", "must", "be", "acknowledgment", "shall", "be"], 16)
        #expect(result == [
            "What   must   be",
            "acknowledgment  ",
            "shall be        "
        ])
    }

    @Test func example3() {
        let solution = Solution()
        let result = solution.fullJustify(["Science", "is", "what", "we", "understand", "well", "enough", "to", "explain", "to", "a", "computer.", "Art", "is", "everything", "else", "we", "do"], 20)
        #expect(result ==  [
            "Science  is  what we",
            "understand      well",
            "enough to explain to",
            "a  computer.  Art is",
            "everything  else  we",
            "do                  "
        ])
    }
}
