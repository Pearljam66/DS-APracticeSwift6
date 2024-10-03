//
//  MergeSortedArrayTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/3/24.
//

/*
 You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.
 Merge nums1 and nums2 into a single array sorted in non-decreasing order.
 The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.

 Example 1:
 Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
 Output: [1,2,2,3,5,6]
 Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
 The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.

 Example 2:
 Input: nums1 = [1], m = 1, nums2 = [], n = 0
 Output: [1]
 Explanation: The arrays we are merging are [1] and [].
 The result of the merge is [1].

 Example 3:
 Input: nums1 = [0], m = 0, nums2 = [1], n = 1
 Output: [1]
 Explanation: The arrays we are merging are [] and [1].
 The result of the merge is [1].
 Note that because m = 0, there are no elements in nums1. The 0 is only there to ensure the merge result can fit in nums1.

 Constraints:
 nums1.length == m + n
 nums2.length == n
 0 <= m, n <= 200
 1 <= m + n <= 200
 -109 <= nums1[i], nums2[j] <= 109
 */

import Testing

struct MergeSortedArrayTest {

    class Solution {
        func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
            // Start from the end of both arrays
            var p1 = m - 1  // Last valid element in nums1
            var p2 = n - 1  // Last element in nums2
            var pMerge = m + n - 1  // Position to place the next element in nums1

            // Merge nums1 and nums2 from the end
            while p2 >= 0 {
                if p1 >= 0 && nums1[p1] > nums2[p2] {
                    // If current element in nums1 is larger, move it to the merge position
                    nums1[pMerge] = nums1[p1]
                    p1 -= 1
                } else {
                    // Otherwise, or if nums1 is exhausted, use nums2's element
                    nums1[pMerge] = nums2[p2]
                    p2 -= 1
                }
                pMerge -= 1
            }
            // Note: If there are remaining elements in nums1, they are already in place, so no need to do anything else
        }
    }

    func mergeToArray(_ nums1: [Int], _ m: Int, _ nums2: [Int], _ n: Int) -> [Int] {
        var nums1Copy = nums1 // Create a copy of nums1 to not modify the original
        var result = [Int]()

        // Call the original merge function to sort in-place
        Solution().merge(&nums1Copy, m, nums2, n)

        // Copy all elements to result, since nums1Copy now contains the merged array in the first m+n elements
        for i in 0..<(m + n) {
            result.append(nums1Copy[i])
        }

        return result
    }

    @Test func example1() {
        let nums1: [Int] = [1, 2, 3, 0, 0, 0]
        let m: Int = 3
        let nums2: [Int] = [2, 5, 6]
        let n: Int = 3
        let expected: [Int] = [1, 2, 2, 3, 5, 6]
        let convertedToArrayOfInts = mergeToArray(nums1, m, nums2, n)

        #expect(convertedToArrayOfInts == expected)
    }

    @Test func example2() {
        let nums1: [Int] = [1]
        let m: Int = 1
        let nums2: [Int] = []
        let n: Int = 0
        let expected: [Int] = [1]
        let convertedToArrayOfInts = mergeToArray(nums1, m, nums2, n)

        #expect(convertedToArrayOfInts == expected)
    }

    @Test func example3() {
        let nums1: [Int] = [0]
        let m: Int = 0
        let nums2: [Int] = [1]
        let n: Int = 1
        let expected: [Int] = [1]
        let convertedToArrayOfInts = mergeToArray(nums1, m, nums2, n)

        #expect(convertedToArrayOfInts == expected)
    }
}
