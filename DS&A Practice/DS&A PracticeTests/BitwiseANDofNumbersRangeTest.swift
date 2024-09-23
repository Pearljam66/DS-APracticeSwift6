//
//  BitwiseANDofNumbersRangeTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/23/24.
//

/*
 Given two integers left and right that represent the range [left, right], return the bitwise AND of all numbers in this range, inclusive.

 Example 1:
 Input: left = 5, right = 7
 Output: 4

 Example 2:
 Input: left = 0, right = 0
 Output: 0

 Example 3:
 Input: left = 1, right = 2147483647
 Output: 0

 Constraints:
 0 <= left <= right <= 231 - 1
 */

import Testing

struct BitwiseANDofNumbersRangeTest {

    class Solution {
        func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
            var m = left
            var n = right
            var shift = 0

            // Find the common prefix of left and right
            while m != n {
                m >>= 1
                n >>= 1
                shift += 1
            }

            // Shift back to get the result
            return m << shift
        }
    }

    @Test func example1() {
        #expect(Solution().rangeBitwiseAnd(5, 7) == 4)
    }

    @Test func example2() {
        #expect(Solution().rangeBitwiseAnd(0, 0) == 0)
    }

    @Test func example3() {
        #expect(Solution().rangeBitwiseAnd(1, 2147483647) == 0)
    }

}
