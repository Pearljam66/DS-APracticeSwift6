//
//  CombinationSumTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/7/24.
//

/*
 Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.
 The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the
 frequency
 of at least one of the chosen numbers is different.
 The test cases are generated such that the number of unique combinations that sum up to target is less than 150 combinations for the given input.

 Example 1:
 Input: candidates = [2,3,6,7], target = 7
 Output: [[2,2,3],[7]]
 Explanation:
 2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
 7 is a candidate, and 7 = 7.
 These are the only two combinations.

 Example 2:
 Input: candidates = [2,3,5], target = 8
 Output: [[2,2,2,2],[2,3,3],[3,5]]

 Example 3:
 Input: candidates = [2], target = 1
 Output: []

 Constraints:
 1 <= candidates.length <= 30
 2 <= candidates[i] <= 40
 All elements of candidates are distinct.
 1 <= target <= 40
 */

import Testing

struct CombinationSumTest {

    class Solution {
        func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
            var candidates = candidates.sorted()
            var result: [[Int]] = []

            func backtrack(_ combination: [Int], _ start: Int, _ target: Int) {
                if target == 0 {
                    result.append(combination)
                    return
                }

                for i in start..<candidates.count {
                    // If the current number is greater than the remaining target, skip it
                    if candidates[i] > target { break }

                    // Include the current number in the combination
                    var newCombination = combination + [candidates[i]]
                    backtrack(newCombination, i, target - candidates[i])
                }
            }

            backtrack([], 0, target)
            return result
        }
    }

    @Test func example1() {
        #expect(Solution().combinationSum([2, 3, 6, 7], 7) == [[2, 2, 3], [7]])

    }

    @Test func example2() {
        #expect(Solution().combinationSum([2, 3, 5], 8) == [[2, 2, 2, 2], [2, 3, 3], [3, 5]])
    }

    @Test func example3() {
        #expect(Solution().combinationSum([2], 1) == [])
    }

}
