//
//  MinimumSizeSubarraySumTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 7/31/24.
//

/*
 Given an array of positive integers nums and a positive integer target, return the minimal length of a
 subarray
 whose sum is greater than or equal to target. If there is no such subarray, return 0 instead.

 Example 1:
 Input: target = 7, nums = [2,3,1,2,4,3]
 Output: 2
 Explanation: The subarray [4,3] has the minimal length under the problem constraint.

 Example 2:
 Input: target = 4, nums = [1,4,4]
 Output: 1

 Example 3:
 Input: target = 11, nums = [1,1,1,1,1,1,1,1]
 Output: 0

 Constraints:
 1 <= target <= 109
 1 <= nums.length <= 105
 1 <= nums[i] <= 104

 Follow up: If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log(n)).
 */

import Testing

struct MinimumSizeSubarraySumTest {

    class Solution {
        func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
            guard !nums.isEmpty else {
                return 0
            }

            var left = 0
            var sum = 0
            var minLength = Int.max

            for right in 0..<nums.count {
                sum += nums[right]

                while sum >= target {
                    minLength = min(minLength, right - left + 1)
                    sum -= nums[left]
                    left += 1
                }
            }
            return minLength == Int.max ? 0 : minLength
        }
    }

    @Test func testExample1() async throws {
        let solution = Solution()
        let target = 7
        let nums = [2, 3, 1, 2, 4, 3]
        let output = 2

        #expect(solution.minSubArrayLen(target, nums) == output)
    }

    @Test func testExample2() async throws {
        let solution = Solution()
        let target = 4
        let nums = [1, 4, 4]
        let output = 1

        #expect(solution.minSubArrayLen(target, nums) == output)
    }

    @Test func testExample3() async throws {
        let solution = Solution()
        let target = 11
        let nums = [1,1,1,1,1,1,1,1]
        let output = 0

        #expect(solution.minSubArrayLen(target, nums) == output)
    }

}
