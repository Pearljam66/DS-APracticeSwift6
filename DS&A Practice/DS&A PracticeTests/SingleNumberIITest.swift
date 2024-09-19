//
//  SingleNumberIITest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/19/24.
//

/*
 Given an integer array nums where every element appears three times except for one, which appears exactly once. Find the single element and return it.
 You must implement a solution with a linear runtime complexity and use only constant extra space.

 Example 1:
 Input: nums = [2,2,3,2]
 Output: 3

 Example 2:
 Input: nums = [0,1,0,1,0,1,99]
 Output: 99

 Constraints:
 1 <= nums.length <= 3 * 104
 -231 <= nums[i] <= 231 - 1
 Each element in nums appears exactly three times except for one element which appears once.
 */

import Testing

struct SingleNumberIITest {

    class Solution {
        func singleNumber(_ nums: [Int]) -> Int {
            var ones = 0
            var twos = 0

            for num in nums {
                ones = (ones ^ num) & ~twos
                twos = (twos ^ num) & ~ones
            }
            return ones
        }
    }

    @Test func example1() {
        #expect(Solution().singleNumber([2, 2, 3, 2]) == 3)
    }

    @Test func example2() {
        #expect(Solution().singleNumber([0, 1, 0, 1, 0, 1, 99]) == 99)
    }

}
