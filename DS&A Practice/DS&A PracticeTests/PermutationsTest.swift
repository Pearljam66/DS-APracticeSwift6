//
//  PermutationsTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/5/24.
//

/*
 Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

 Example 1:
 Input: nums = [1,2,3]
 Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

 Example 2:
 Input: nums = [0,1]
 Output: [[0,1],[1,0]]

 Example 3:
 Input: nums = [1]
 Output: [[1]]

 Constraints:
 1 <= nums.length <= 6
 -10 <= nums[i] <= 10
 All the integers of nums are unique.
 */


import Testing

struct PermutationsTest {

    class Solution {
        func permute(_ nums: [Int]) -> [[Int]] {
            var result: [[Int]] = []
            var used = [Bool](repeating: false, count: nums.count)

            func backtrack(_ current: [Int]) {
                // Base case: if current permutation has all elements
                if current.count == nums.count {
                    result.append(current)
                    return
                }

                // Try adding each unused number to the current permutation
                for (index, num) in nums.enumerated() {
                    if !used[index] {
                        used[index] = true
                        backtrack(current + [num])
                        used[index] = false // Backtrack
                    }
                }
            }

            // Start the backtracking with an empty permutation
            backtrack([])
            return result
        }
    }

    @Test func example1() {
        let nums: [Int] = [1, 2, 3]
        let expected: [[Int]] = [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
        #expect(Solution().permute(nums) == expected)
    }

    @Test func example2() {
        let nums: [Int] = [0, 1]
        let expected: [[Int]] = [[0, 1], [1, 0]]
        #expect(Solution().permute(nums) == expected)
    }

    @Test func example3() {
        let nums: [Int] = [1]
        let expected: [[Int]] = [[1]]
        #expect(Solution().permute(nums) == expected)
    }

}
