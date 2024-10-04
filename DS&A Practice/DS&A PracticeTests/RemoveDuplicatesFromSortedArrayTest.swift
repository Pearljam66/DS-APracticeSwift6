//
//  RemoveDuplicatesFromSortedArrayTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/4/24.
//

/*
 Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same. Then return the number of unique elements in nums.
 Consider the number of unique elements of nums to be k, to get accepted, you need to do the following things:
 Change the array nums such that the first k elements of nums contain the unique elements in the order they were present in nums initially. The remaining elements of nums are not important as well as the size of nums.
 Return k.
 Custom Judge:
 The judge will test your solution with the following code:

 int[] nums = [...]; // Input array
 int[] expectedNums = [...]; // The expected answer with correct length
 int k = removeDuplicates(nums); // Calls your implementation
 assert k == expectedNums.length;
 for (int i = 0; i < k; i++) {
 assert nums[i] == expectedNums[i];
 }
 If all assertions pass, then your solution will be accepted.

 Example 1:
 Input: nums = [1,1,2]
 Output: 2, nums = [1,2,_]
 Explanation: Your function should return k = 2, with the first two elements of nums being 1 and 2 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).

 Example 2:
 Input: nums = [0,0,1,1,1,2,2,3,3,4]
 Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]
 Explanation: Your function should return k = 5, with the first five elements of nums being 0, 1, 2, 3, and 4 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).

 Constraints:
 1 <= nums.length <= 3 * 104
 -100 <= nums[i] <= 100
 nums is sorted in non-decreasing order.
 */

import Testing

struct RemoveDuplicatesFromSortedArrayTest {

    class Solution {

        func removeDuplicates(_ nums: inout [Int]) -> Int {
            // If the array is empty or has only one element, no duplicates to remove
            if nums.count <= 1 {
                return nums.count
            }

            // k keeps track of where to place the next unique element
            var k = 1

            // Start from the second element since the first one is always unique
            for i in 1..<nums.count {
                // If the current number is different from the previous unique number
                if nums[i] != nums[i - 1] {
                    // Place this unique number at position k
                    nums[k] = nums[i]
                    k += 1
                }
            }
            return k
        }
    }

    @Test func example1() {
        var nums: [Int] = [1, 1, 2]
        let expectedNums: [Int] = [1, 2, 0]
        let solution = Solution()
        #expect(solution.removeDuplicates(&nums) == 2)
        #expect(nums == expectedNums)
    }

    @Test func example2() {
        var nums: [Int] = [0,0,1,1,1,2,2,3,3,4]
        let expectedNums: [Int] = [0,1,2,3,4,0,0,0,0,0]
        let solution = Solution()
        #expect(solution.removeDuplicates(&nums) == 5)
        #expect(nums == expectedNums)

    }

}
