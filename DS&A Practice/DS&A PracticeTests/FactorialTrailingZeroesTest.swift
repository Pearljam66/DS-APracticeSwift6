//
//  FactorialTrailingZeroesTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/25/24.
//

/*
 Given an integer n, return the number of trailing zeroes in n!.
 Note that n! = n * (n - 1) * (n - 2) * ... * 3 * 2 * 1.

 Example 1:
 Input: n = 3
 Output: 0
 Explanation: 3! = 6, no trailing zero.

 Example 2:
 Input: n = 5
 Output: 1
 Explanation: 5! = 120, one trailing zero.

 Example 3:
 Input: n = 0
 Output: 0

 Example 4:
 Input: n = 6
 Output: 1

 Constraints:
 0 <= n <= 104
 */

import Testing

struct FactorialTrailingZeroesTest {

    class Solution {

        func trailingZeroes(_ n: Int) -> Int {
            var count = 0
            var i = 5

            while i <= n {
                count += n/i
                i *= 5
            }
            return count
        }
    }

    @Test func example1() {
        #expect(Solution().trailingZeroes(3) == 0)
    }

    @Test func example2() {
        #expect(Solution().trailingZeroes(5) == 1)
    }

    @Test func example3() {
        #expect(Solution().trailingZeroes(0) == 0)
    }

    @Test func example4() {
        #expect(Solution().trailingZeroes(6) == 1)
    }
}
