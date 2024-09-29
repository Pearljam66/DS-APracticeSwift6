//
//  LongestIncreasingSubsequenceTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/29/24.
//

/*
 Given an integer array nums, return the length of the longest strictly increasing
 subsequence.

 Example 1:
 Input: nums = [10,9,2,5,3,7,101,18]
 Output: 4
 Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.

 Example 2:
 Input: nums = [0,1,0,3,2,3]
 Output: 4

 Example 3:
 Input: nums = [7,7,7,7,7,7,7]
 Output: 1

 Constraints:
 1 <= nums.length <= 2500
 -104 <= nums[i] <= 104
 */

import Testing

struct LongestIncreasingSubsequenceTest {

    class Solution {
        func lengthOfLIS(_ nums: [Int]) -> Int {
            guard !nums.isEmpty else { return 0 }

            var dp = [Int](repeating: 1, count: nums.count)

            for i in 1..<nums.count {
                for j in 0..<i {
                    if nums[i] > nums[j] {
                        dp[i] = max(dp[i], dp[j] + 1)
                    }
                }
            }
            return dp.max() ?? 0
        }
    }

    @Test func example1() {
        #expect(Solution().lengthOfLIS([10, 9, 2, 5, 3, 7, 101, 18]) == 4)
    }

    @Test func example2() {
        #expect(Solution().lengthOfLIS([0, 1, 0, 3, 2, 3]) == 4)
    }

    @Test func example3() {
        #expect(Solution().lengthOfLIS([7,7,7,7,7,7,7]) == 1)
    }

}
