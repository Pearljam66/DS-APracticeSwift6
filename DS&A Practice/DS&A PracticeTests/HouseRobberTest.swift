//
//  HouseRobberTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/28/24.
//

/*
 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and it will automatically contact the police if two adjacent houses were broken into on the same night.
 Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

 Example 1:
 Input: nums = [1,2,3,1]
 Output: 4
 Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
 Total amount you can rob = 1 + 3 = 4.

 Example 2:
 Input: nums = [2,7,9,3,1]
 Output: 12
 Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
 Total amount you can rob = 2 + 9 + 1 = 12.

 Constraints:

 1 <= nums.length <= 100
 0 <= nums[i] <= 400
 */
import Testing

struct HouseRobberTest {

    class Solution {
        func rob(_ nums: [Int]) -> Int {
            let n = nums.count
            if n == 0 {
                return 0
            }
            if n == 1 {
                return nums[0]
            }
            if n == 2 {
                return max(nums[0], nums[1])
            }

            // dp[i] represents the maximum amount of money that can be robbed up to house i
            var dp = [Int](repeating: 0, count: n)

            // Initialization
            dp[0] = nums[0]
            dp[1] = max(nums[0], nums[1])

            // Fill the dp array
            for i in 2..<n {
                // Max amount at house i is either:
                // 1. The amount robbed excluding the current house (dp[i-1])
                // 2. The amount including the current house plus the max from two houses back (nums[i] + dp[i-2])
                dp[i] = max(dp[i-1], nums[i] + dp[i-2])
            }

            return dp[n-1]
        }
    }

    @Test func example1() {
        #expect(Solution().rob([1, 2, 3, 1]) == 4)
    }

    @Test func example2() {
        #expect(Solution().rob([2, 7, 9, 3, 1]) == 12)
    }

}
