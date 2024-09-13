//
//  KthLargest ElementInArrayTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/13/24.
//

/*
 Given an integer array nums and an integer k, return the kth largest element in the array.
 Note that it is the kth largest element in the sorted order, not the kth distinct element.
 Can you solve it without sorting?

 Example 1:
 Input: nums = [3,2,1,5,6,4], k = 2
 Output: 5

 Example 2:
 Input: nums = [3,2,3,1,2,4,5,5,6], k = 4
 Output: 4

 Constraints:
 1 <= k <= nums.length <= 105
 -104 <= nums[i] <= 104
 */

import Testing

struct KthLargestElementInArrayTest {

    class Solution {
        func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
            var nums = nums
            let n = nums.count
            let targetIndex = n - k

            func partition(_ left: Int, _ right: Int) -> Int {
                let pivot = nums[right]
                var i = left - 1

                for j in left..<right {
                    if nums[j] <= pivot {
                        i += 1
                        nums.swapAt(i, j)
                    }
                }

                nums.swapAt(i + 1, right)
                return i + 1
            }

            func quickSelect(_ left: Int, _ right: Int) -> Int {
                if left == right {
                    return nums[left]
                }

                let pivotIndex = partition(left, right)

                if pivotIndex == targetIndex {
                    return nums[pivotIndex]
                } else if pivotIndex < targetIndex {
                    return quickSelect(pivotIndex + 1, right)
                } else {
                    return quickSelect(left, pivotIndex - 1)
                }
            }

            return quickSelect(0, n - 1)
        }
    }

    @Test func example1() {
        #expect(Solution().findKthLargest([3, 2, 1, 5, 6, 4], 2) == 5)
    }

    @Test func example2() {
        #expect(Solution().findKthLargest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4) == 4)
    }

}
