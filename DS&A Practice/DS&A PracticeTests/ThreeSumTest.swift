//
//  ThreeSumTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 7/31/24.
//

/*
 Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
 Notice that the solution set must not contain duplicate triplets.

 Example 1:
 Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 Explanation:
 nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
 nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
 nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
 The distinct triplets are [-1,0,1] and [-1,-1,2].
 Notice that the order of the output and the order of the triplets does not matter.

 Example 2:
 Input: nums = [0,1,1]
 Output: []
 Explanation: The only possible triplet does not sum up to 0.

 Example 3:
 Input: nums = [0,0,0]
 Output: [[0,0,0]]
 Explanation: The only possible triplet sums up to 0.

 Constraints:
 3 <= nums.length <= 3000
 -105 <= nums[i] <= 105
 */

import Testing

struct ThreeSumTest {

    class Solution {

        func threeSum(_ nums: [Int]) -> [[Int]] {
            guard nums.count >= 3 else { return [] }

            let sortedNums = nums.sorted()
            var result: [[Int]] = []

            for i in 0..<sortedNums.count - 2 {
                if i > 0 && sortedNums[i] == sortedNums[i - 1] { continue }

                var left = i + 1
                var right = sortedNums.count - 1

                while left < right {
                    let sum = sortedNums[i] + sortedNums[left] + sortedNums[right]

                    if sum == 0 {
                        result.append([sortedNums[i], sortedNums[left], sortedNums[right]])

                        while left < right && sortedNums[left] == sortedNums[left + 1] { left += 1 }
                        while left < right && sortedNums[right] == sortedNums[right - 1] { right -= 1 }

                        left += 1
                        right -= 1
                    } else if sum < 0 {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }

            return result
        }
    }

    @Test func testExample1() async throws {
        let solution = Solution()
        let nums = [-1, 0, 1, 2, -1, -4]
        let output = [[-1, -1, 2], [-1, 0, 1]]

        #expect(solution.threeSum(nums) == output)
    }

    @Test func testExample2() async throws {
        let solution = Solution()
        let nums = [0, 1, 1]
        let output: [[Int]] = []

        #expect(solution.threeSum(nums) == output)
    }

    @Test func testExample3() async throws {
        let solution = Solution()
        let nums = [0, 0, 0]
        let output = [[0, 0, 0]]

        #expect(solution.threeSum(nums) == output)
    }

}
