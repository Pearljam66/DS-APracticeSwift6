//
//  MajorityElementTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/5/24.
//

/*
 Given an array nums of size n, return the majority element.
 The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

 Example 1:
 Input: nums = [3,2,3]
 Output: 3

 Example 2:
 Input: nums = [2,2,1,1,1,2,2]
 Output: 2

 Constraints:
 n == nums.length
 1 <= n <= 5 * 104
 -109 <= nums[i] <= 109
 */

import Testing

struct MajorityElementTest {

    class Solution {
        func majorityElement(_ nums: [Int]) -> Int {
            // Using Boyer-Moore Voting Algorithm
            var candidate: Int?
            var count = 0

            for num in nums {
                // If count is 0, we set the current number as the candidate
                if count == 0 {
                    candidate = num
                    count = 1
                } else if num == candidate {
                    // If the number matches the candidate, increment the count
                    count += 1
                } else {
                    // If the number is different from the candidate, decrease the count
                    count -= 1
                }
            }

            // The Boyer-Moore algorithm guarantees that at this point, 'candidate' is the majority element
            return candidate!
        }
    }

    @Test func example1() {
        #expect(Solution().majorityElement([3, 2, 3]) == 3)
    }

    @Test func example2() {
        #expect(Solution().majorityElement([2,2,1,1,1,2,2]) == 2)
    }

}
