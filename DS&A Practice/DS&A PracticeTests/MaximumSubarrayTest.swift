//
//  MaximumSubarrayTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/18/24.
//

/*
 Given an integer array nums, find the subarray with the largest sum, and return its sum.

 Example 1:
 Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
 Output: 6
 Explanation: The subarray [4,-1,2,1] has the largest sum 6.

 Example 2:
 Input: nums = [1]
 Output: 1
 Explanation: The subarray [1] has the largest sum 1.

 Example 3:
 Input: nums = [5,4,-1,7,8]
 Output: 23
 Explanation: The subarray [5,4,-1,7,8] has the largest sum 23.

 Constraints:
 1 <= nums.length <= 105
 -104 <= nums[i] <= 104
 */

import Testing

struct MaximumSubarrayTest {

    class Solution {
        func maxSubArray(_ nums: [Int]) -> Int {
            if nums.isEmpty { return 0 }

            var maxSum = nums[0]
            var currentSum = nums[0]

            for i in 1..<nums.count {
                currentSum = max(nums[i], currentSum + nums[i])
                maxSum = max(maxSum, currentSum)
            }
            return maxSum
        }
    }

    @Test func example1() {
        #expect(Solution().maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6)
    }

    @Test func example2() {
        #expect(Solution().maxSubArray([1]) == 1)
    }

    @Test func example3() {
        #expect(Solution().maxSubArray([5, 4, -1, 7, 8]) == 23)
    }

}
