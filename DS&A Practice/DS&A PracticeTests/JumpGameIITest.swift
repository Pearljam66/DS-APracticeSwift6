//
//  JumpGameIITest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/9/24.
//

/*
 You are given a 0-indexed array of integers nums of length n. You are initially positioned at nums[0].
 Each element nums[i] represents the maximum length of a forward jump from index i. In other words, if you are at nums[i], you can jump to any nums[i + j] where:
 0 <= j <= nums[i] and
 i + j < n
 Return the minimum number of jumps to reach nums[n - 1]. The test cases are generated such that you can reach nums[n - 1].

 Example 1:
 Input: nums = [2,3,1,1,4]
 Output: 2
 Explanation: The minimum number of jumps to reach the last index is 2. Jump 1 step from index 0 to 1, then 3 steps to the last index.

 Example 2:
 Input: nums = [2,3,0,1,4]
 Output: 2

 Constraints:
 1 <= nums.length <= 104
 0 <= nums[i] <= 1000
 It's guaranteed that you can reach nums[n - 1].
 */

import Testing

struct JumpGameIITest {

    class Solution {
        func jump(_ nums: [Int]) -> Int {
            // If the length is 1 or less, no jumps are needed
            if nums.count <= 1 {
                return 0
            }

            // Variables to keep track of current maximum reach, the end of current jump range, and number of jumps
            var currentMaxReach = 0
            var jumpEnd = 0
            var steps = 0

            // Iterate through the array, but we don't need to go to the last element since we're only concerned with reaching it
            for i in 0..<nums.count - 1 {
                // Update the farthest we can reach from this position
                currentMaxReach = max(currentMaxReach, i + nums[i])

                // If we've reached the end of our current jump, we need to make another jump
                if i == jumpEnd {
                    steps += 1
                    jumpEnd = currentMaxReach

                    // If jumpEnd already reaches or exceeds the last index, we're done or one more jump will do
                    if jumpEnd >= nums.count - 1 {
                        break
                    }
                }
            }

            return steps
        }
    }

    @Test func example1() {
        #expect(Solution().jump([2,3,1,1,4]) == 2)
    }

    @Test func example2() {
        #expect(Solution().jump([2,3,0,1,4]) == 2)
    }

}
