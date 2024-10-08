//
//  JumpGameTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/8/24.
//

/*
 You are given an integer array nums. You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position.
 Return true if you can reach the last index, or false otherwise.

 Example 1:
 Input: nums = [2,3,1,1,4]
 Output: true
 Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.

 Example 2:
 Input: nums = [3,2,1,0,4]
 Output: false
 Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.

 Constraints:
 1 <= nums.length <= 104
 0 <= nums[i] <= 105
 */

import Testing

struct JumpGameTest {

    class Solution {
        func canJump(_ nums: [Int]) -> Bool {
            var maxReach = 0
            let n = nums.count

            // Iterate through the array up to the second last element
            for i in 0..<n {
                // If current index is beyond maxReach, we can't move forward
                if i > maxReach {
                    return false
                }

                // Update the farthest we can reach
                maxReach = max(maxReach, i + nums[i])

                // If maxReach is at least the last index, we can reach the end
                if maxReach >= n - 1 {
                    return true
                }
            }

            // This return should never be reached if the logic above is correct,
            // but it's here for completeness.
            return false
        }
    }

    @Test func example1() {
        #expect(Solution().canJump([2,3,1,1,4]))
    }

    @Test func example2() {
        #expect(!Solution().canJump([3,2,1,0,4]))
    }

}
