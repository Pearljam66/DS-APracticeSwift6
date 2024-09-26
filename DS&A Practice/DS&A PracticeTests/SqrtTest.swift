//
//  SqrtTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/26/24.
//

/*
 Given a non-negative integer x, return the square root of x rounded down to the nearest integer. The returned integer should be non-negative as well.
 You must not use any built-in exponent function or operator.
 For example, do not use pow(x, 0.5) in c++ or x ** 0.5 in python.

 Example 1:
 Input: x = 4
 Output: 2
 Explanation: The square root of 4 is 2, so we return 2.

 Example 2:
 Input: x = 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since we round it down to the nearest integer, 2 is returned.

 Constraints:
 0 <= x <= 231 - 1
 */

import Testing

struct SqrtTest {

    class Solution {
        func mySqrt(_ x: Int) -> Int {
            // Handle edge case where x is 0 or 1
            if x < 2 {
                return x
            }

            // Using binary search to find the square root
            var left = 1
            var right = x / 2
            var result = 0

            while left <= right {
                let mid = left + (right - left) / 2  // To prevent potential integer overflow
                                                     // Check if mid * mid is equal to x or just below x
                if mid * mid == x {
                    return mid
                } else if mid * mid < x {
                    left = mid + 1
                    result = mid  // Store as potential result since we're looking to round down
                } else {
                    right = mid - 1
                }
            }

            return result
        }
    }

    @Test func example1() {
        #expect(Solution().mySqrt(4) == 2)
    }

    @Test func example2() {
        #expect(Solution().mySqrt(8) == 2)
    }

}
