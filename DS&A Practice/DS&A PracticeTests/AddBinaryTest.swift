//
//  AddBinaryTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/16/24.
//

/*
 Given two binary strings a and b, return their sum as a binary string.

 Example 1:
 Input: a = "11", b = "1"
 Output: "100"

 Example 2:
 Input: a = "1010", b = "1011"
 Output: "10101"

 Constraints:
 1 <= a.length, b.length <= 104
 a and b consist only of '0' or '1' characters.
 Each string does not contain leading zeros except for the zero itself.
 */

import Testing

struct AddBinaryTest {

    class Solution {
        func addBinary(_ a: String, _ b: String) -> String {
            var result = ""
            var carry = 0

            var aChars = Array(a.reversed())
            var bChars = Array(b.reversed())

            let maxLength = max(aChars.count, bChars.count)

            for i in 0..<maxLength {
                let digitA = i < aChars.count ? Int(String(aChars[i]))! : 0
                let digitB = i < bChars.count ? Int(String(bChars[i]))! : 0

                let sum = digitA + digitB + carry
                result = String(sum % 2) + result
                carry = sum / 2
            }

            if carry > 0 {
                result = "1" + result
            }

            return result
        }
    }

    @Test func example1() {
        #expect(Solution().addBinary("11", "1") == "100")
    }

    @Test func example2() {
        #expect(Solution().addBinary("1010", "1011") == "10101")
    }

}
