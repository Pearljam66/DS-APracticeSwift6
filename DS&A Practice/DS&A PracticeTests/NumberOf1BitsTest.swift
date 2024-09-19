//
//  NumberOf1BitsTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/19/24.
//

/*
 Write a function that takes the binary representation of a positive integer and returns the number of
 set bits it has (also known as the Hamming weight).

 Example 1:
 Input: n = 11
 Output: 3
 Explanation:
 The input binary string 1011 has a total of three set bits.

 Example 2:
 Input: n = 128
 Output: 1
 Explanation:
 The input binary string 10000000 has a total of one set bit.

 Example 3:
 Input: n = 2147483645
 Output: 30
 Explanation:
 The input binary string 1111111111111111111111111111101 has a total of thirty set bits.

 Constraints:
 1 <= n <= 231 - 1
 */


import Testing

struct NumberOf1BitsTest {

    class Solution {
        func hammingWeight(_ n: Int) -> Int {
            var count = 0
            var num = n

            while num != 0 {
                count += num & 1
                num = num >> 1
            }

            return count
        }
    }

    @Test func example1() {
        #expect(Solution().hammingWeight(11) == 3)
    }

    @Test func example2() {
        #expect(Solution().hammingWeight(128) == 1)
    }

    @Test func example3() {
        #expect(Solution().hammingWeight(2147483645) == 30)
    }

}
