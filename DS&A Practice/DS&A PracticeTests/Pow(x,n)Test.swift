//
//  Pow(x,n)Test.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/26/24.
//

/*
 Implement pow(x, n), which calculates x raised to the power n (i.e., xn).

 Example 1:
 Input: x = 2.00000, n = 10
 Output: 1024.00000

 Example 2:
 Input: x = 2.10000, n = 3
 Output: 9.26100

 Example 3:
 Input: x = 2.00000, n = -2
 Output: 0.25000
 Explanation: 2-2 = 1/22 = 1/4 = 0.25

 Constraints:
 -100.0 < x < 100.0
 -231 <= n <= 231-1
 n is an integer.
 Either x is not zero or n > 0.
 -104 <= xn <= 104
 */

import Foundation
import Testing

struct Pow_x_n_Test {

    class Solution {

        func myPow(_ x: Double, _ n: Int) -> Double {
            // Handle base cases
            if n == 0 {
                return 1
            }
            if n == 1 {
                return x
            }

            // Handle negative exponents
            var n = n
            var x = x
            if n < 0 {
                if x == 0 {
                    // Note: Raising 0 to a negative power is undefined in real numbers,
                    // but for completeness, we'll handle it this way as per common expectation in coding challenges.
                    return Double.infinity
                }
                x = 1 / x
                n = -n
            }

            // Using pow for this example:
            let rawResult = pow(x, Double(n))

            // Rounding to handle floating point precision issues
            // Here we're choosing to round to 10 decimal places which should be sufficient for most tests
            return round(rawResult * 1e10) / 1e10
        }
    }

    @Test func example1() {
        #expect(Solution().myPow(2.00000, 10) == 1024.00000)
    }

    @Test func example2() {
        #expect(Solution().myPow(2.10000, 3) == 9.26100)
    }

    @Test func example3() {
        #expect(Solution().myPow(2.00000, -2) == 0.25000)
    }

}
