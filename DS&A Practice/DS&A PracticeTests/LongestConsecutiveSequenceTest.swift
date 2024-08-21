//
//  LongestConsecutiveSequenceTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 8/21/24.
//

/*
 Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.
 You must write an algorithm that runs in O(n) time.

 Example 1:
 Input: nums = [100,4,200,1,3,2]
 Output: 4
 Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.

 Example 2:
 Input: nums = [0,3,7,2,5,8,4,6,0,1]
 Output: 9

 Constraints:
 0 <= nums.length <= 105
 -109 <= nums[i] <= 109
 */

import Testing

struct LongestConsecutiveSequenceTest {

 class Solution {

        func findLongestConsecutiveSequence(_ nums: [Int]) -> Int {
            var set: Set<Int> = []
            var maxLength: Int = 0

            for num in nums {
                set.insert(num)
            }

            for num in nums {
                if set.contains(num - 1) {
                    continue
                }

                var length: Int = 1
                while set.contains(num + length) {
                    length += 1
                }

                maxLength = max(maxLength, length)
            }
            return maxLength
        }

    }

    @Test func example1() {
        let solution = Solution()
        #expect(solution.findLongestConsecutiveSequence([100, 4, 200, 1, 3, 2]) == 4)
    }

    @Test func example2() {
        let solution = Solution()
        #expect(solution.findLongestConsecutiveSequence([0, 3, 7, 2, 5, 8, 4, 6, 0, 1]) == 9)
    }

}
