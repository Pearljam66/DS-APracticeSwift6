//
//  SingleNumberTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/19/24.
//

/*
 Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
 You must implement a solution with a linear runtime complexity and use only constant extra space.

 Example 1:
 Input: nums = [2,2,1]
 Output: 1

 Example 2:
 Input: nums = [4,1,2,1,2]
 Output: 4

 Example 3:
 Input: nums = [1]
 Output: 1

 Constraints:
 1 <= nums.length <= 3 * 104
 -3 * 104 <= nums[i] <= 3 * 104
 Each element in the array appears twice except for one element which appears only once.
 */

import Testing

struct SingleNumberTest {

    class Solution {
        func singleNumber(_ nums: [Int]) -> Int {
            var result = 0

            for num in nums {
                result ^= num
            }

            return result
        }
    }

    @Test func example1() {
        #expect(Solution().singleNumber([2, 2, 1]) == 1)
    }

    @Test func example2() {
        #expect(Solution().singleNumber([4, 1, 2, 1, 2]) == 4)
    }

    @Test func example3() {
        #expect(Solution().singleNumber([1]) == 1)
    }

}
