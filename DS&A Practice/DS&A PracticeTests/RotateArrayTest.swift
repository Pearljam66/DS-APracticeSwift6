//
//  RotateArrayTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/6/24.
//

/*
 Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.

 Example 1:
 Input: nums = [1,2,3,4,5,6,7], k = 3
 Output: [5,6,7,1,2,3,4]
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]

 Example 2:
 Input: nums = [-1,-100,3,99], k = 2
 Output: [3,99,-1,-100]
 Explanation:
 rotate 1 steps to the right: [99,-1,-100,3]
 rotate 2 steps to the right: [3,99,-1,-100]

 Constraints:
 1 <= nums.length <= 105
 -231 <= nums[i] <= 231 - 1
 0 <= k <= 105
 */

import Testing

struct RotateArrayTest {

    class Solution {
        func rotate(_ nums: inout [Int], _ k: Int) {
            let n = nums.count
            // Normalize k to be within the array length
            let k = k % n

            // If k is 0 or if k is equal to n, no need to rotate
            if k == 0 || k == n {
                return
            }

            // Function to reverse a portion of the array
            func reverse(from start: Int, to end: Int) {
                var start = start
                var end = end
                while start < end {
                    nums.swapAt(start, end)
                    start += 1
                    end -= 1
                }
            }

            // 1. Reverse the entire array
            reverse(from: 0, to: n - 1)

            // 2. Reverse the first k elements
            reverse(from: 0, to: k - 1)

            // 3. Reverse the remaining n-k elements
            reverse(from: k, to: n - 1)
        }
    }

    @Test func example1() {
        var nums: [Int] = [1, 2, 3, 4, 5, 6, 7]
        let k: Int = 3
        let solution = Solution()
        solution.rotate(&nums, k)
        #expect(nums == [5, 6, 7, 1, 2, 3, 4])
    }

    @Test func example2() {
        var nums: [Int] = [-1, -100, 3, 99]
        let k: Int = 2
        let solution = Solution()
        solution.rotate(&nums, k)
        #expect(nums == [3, 99, -1, -100])
    }

}
