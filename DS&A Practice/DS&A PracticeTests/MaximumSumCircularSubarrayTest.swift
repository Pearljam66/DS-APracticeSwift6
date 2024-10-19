//
//  MaximumSumCircularSubarrayTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/19/24.
//

/*
 Given a circular integer array nums of length n, return the maximum possible sum of a non-empty subarray of nums.
 A circular array means the end of the array connects to the beginning of the array. Formally, the next element of nums[i] is nums[(i + 1) % n] and the previous element of nums[i] is nums[(i - 1 + n) % n].
 A subarray may only include each element of the fixed buffer nums at most once. Formally, for a subarray nums[i], nums[i + 1], ..., nums[j], there does not exist i <= k1, k2 <= j with k1 % n == k2 % n.

 Example 1:
 Input: nums = [1,-2,3,-2]
 Output: 3
 Explanation: Subarray [3] has maximum sum 3.

 Example 2:
 Input: nums = [5,-3,5]
 Output: 10
 Explanation: Subarray [5,5] has maximum sum 5 + 5 = 10.

 Example 3:
 Input: nums = [-3,-2,-3]
 Output: -2
 Explanation: Subarray [-2] has maximum sum -2.

 Constraints:
 n == nums.length
 1 <= n <= 3 * 104
 -3 * 104 <= nums[i] <= 3 * 104
 */

import Testing

struct MaximumSumCircularSubarrayTest {

    class Solution {
        func maxSubarraySumCircular(_ nums: [Int]) -> Int {
            // Helper function to find the maximum subarray sum using Kadane's algorithm
            func kadane(_ array: [Int]) -> Int {
                var currentSum = array[0]
                var maxSum = array[0]
                for i in 1..<array.count {
                    currentSum = max(array[i], currentSum + array[i])
                    maxSum = max(maxSum, currentSum)
                }
                return maxSum
            }

            // Case 1: The maximum sum subarray is not circular (standard Kadane)
            let maxSumNormal = kadane(nums)

            // If all numbers are negative, return the largest number (which is the least negative)
            if maxSumNormal < 0 {
                return maxSumNormal
            }

            // Case 2: The maximum sum subarray is circular
            // To find this, we invert the array and find the minimum subarray sum
            // Then, total sum of array minus this minimum sum gives us the max circular sum
            let totalSum = nums.reduce(0, +)
            let invertedNums = nums.map { -$0 }
            let minSumCircular = kadane(invertedNums)
            let maxSumCircular = totalSum + minSumCircular  // Here we add because minSumCircular is negative

            // Return the maximum of the two cases
            return max(maxSumNormal, maxSumCircular)
        }
    }

    @Test func example1() {
        #expect(Solution().maxSubarraySumCircular([1, -2, 3, -2]) == 3)
    }

    @Test func example2() {
        #expect(Solution().maxSubarraySumCircular([5, -3, 5]) == 10)
    }

    @Test func example3() {
        #expect(Solution().maxSubarraySumCircular([-3, -2, -3]) == -2)
    }

}
