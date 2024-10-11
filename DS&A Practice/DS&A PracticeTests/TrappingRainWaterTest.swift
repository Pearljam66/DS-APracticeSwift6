//
//  TrappingRainWaterTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/11/24.
//

/*
 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.

 Example 1:
 Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
 Output: 6
 Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.

 Example 2:
 Input: height = [4,2,0,3,2,5]
 Output: 9

 Constraints:
 n == height.length
 1 <= n <= 2 * 104
 0 <= height[i] <= 105
 */

import Testing

struct TrappingRainWaterTest {

    class Solution {
        func trap(_ height: [Int]) -> Int {
            if height.count < 3 {
                return 0
            }

            var totalWater = 0

            var left = 0
            var right = height.count - 1
            var maxLeft = 0
            var maxRight = 0

            while left < right {
                // Ensure we always process the side with the lower height to guarantee water can be trapped
                if height[left] < height[right] {
                    // If the current height is greater than maxLeft, update maxLeft because no water can be trapped here
                    if height[left] > maxLeft {
                        maxLeft = height[left]
                    } else {
                        totalWater += maxLeft - height[left]
                    }
                    left += 1
                } else {
                    // Similar logic for the right side
                    if height[right] > maxRight {
                        maxRight = height[right]
                    } else {
                        totalWater += maxRight - height[right]
                    }
                    right -= 1
                }
            }
            return totalWater
        }
    }

    @Test func example1() {
        #expect(Solution().trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]) == 6)
    }

    @Test func example2() {
        #expect(Solution().trap([4, 2, 0, 3, 2, 5]) == 9)
    }

}
