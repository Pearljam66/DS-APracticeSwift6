//
//  ProductOfArrayExceptSelfTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/9/24.
//

/*
 Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
 You must write an algorithm that runs in O(n) time and without using the division operation.

 Example 1:
 Input: nums = [1,2,3,4]
 Output: [24,12,8,6]

 Example 2:
 Input: nums = [-1,1,0,-3,3]
 Output: [0,0,9,0,0]

 Constraints:
 2 <= nums.length <= 105
 -30 <= nums[i] <= 30
 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
 */

import Testing

struct ProductOfArrayExceptSelfTest {

    class Solution {
        func productExceptSelf(_ nums: [Int]) -> [Int] {
            let n = nums.count

            // Initialize the answer array with 1s
            var answer = Array(repeating: 1, count: n)

            // First pass: left products
            var leftProduct = 1
            for i in 0..<n {
                answer[i] = leftProduct
                leftProduct *= nums[i]
            }

            // Second pass: right products, combine with left products
            var rightProduct = 1
            for i in stride(from: n - 1, through: 0, by: -1) {
                answer[i] *= rightProduct
                rightProduct *= nums[i]
            }

            return answer
        }
    }

    @Test func example1() {
        #expect(Solution().productExceptSelf([1, 2, 3, 4]) == [24, 12, 8, 6])
    }

    @Test func example2() {
        #expect(Solution().productExceptSelf([-1, 1, 0, -3, 3]) == [0, 0, 9, 0, 0])
    }

    @Test func example3() {
        #expect(Solution().productExceptSelf([1]) == [1])
    }

}
