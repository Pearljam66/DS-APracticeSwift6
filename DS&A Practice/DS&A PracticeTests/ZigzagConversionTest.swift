//
//  ZigzagConversionTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/14/24.
//

/*
 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"
 Write the code that will take a string and make this conversion given a number of rows:
 string convert(string s, int numRows);

 Example 1:
 Input: s = "PAYPALISHIRING", numRows = 3
 Output: "PAHNAPLSIIGYIR"

 Example 2:
 Input: s = "PAYPALISHIRING", numRows = 4
 Output: "PINALSIGYAHRPI"
 Explanation:
 P     I    N
 A   L S  I G
 Y A   H R
 P     I

 Example 3:
 Input: s = "A", numRows = 1
 Output: "A"

 Constraints:
 1 <= s.length <= 1000
 s consists of English letters (lower-case and upper-case), ',' and '.'.
 1 <= numRows <= 1000
 */

import Testing

struct ZigzagConversionTest {

    class Solution {
        func convert(_ s: String, _ numRows: Int) -> String {
            // If numRows is 1 or greater than or equal to string length, return the string as is
            if numRows == 1 || numRows >= s.count {
                return s
            }

            // Array to hold each row's characters
            var rows: [String] = Array(repeating: "", count: min(numRows, s.count))
            var currentRow = 0
            var goingDown = false

            // Character array for easy manipulation
            for char in s {
                rows[currentRow].append(char)

                // Change direction if we hit the top or bottom row
                if currentRow == 0 || currentRow == numRows - 1 {
                    goingDown.toggle()
                }

                // Move to next row
                currentRow += goingDown ? 1 : -1
            }

            // Combine all rows into one string
            return rows.joined()
        }
    }

    @Test func example1() {
        #expect(Solution().convert("PAYPALISHIRING", 3) == "PAHNAPLSIIGYIR")
    }

    @Test func example2() {
        #expect(Solution().convert("PAYPALISHIRING", 4) == "PINALSIGYAHRPI")
    }

    @Test func example3() {
        #expect(Solution().convert("A", 1) == "A")
    }

}
