//
//  CombinationsTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/4/24.
//

/*
 Given two integers n and k, return all possible combinations of k numbers chosen from the range [1, n].
 You may return the answer in any order.

 Example 1:
 Input: n = 4, k = 2
 Output: [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
 Explanation: There are 4 choose 2 = 6 total combinations.
 Note that combinations are unordered, i.e., [1,2] and [2,1] are considered to be the same combination.

 Example 2:
 Input: n = 1, k = 1
 Output: [[1]]
 Explanation: There is 1 choose 1 = 1 total combination.

 Constraints:
 1 <= n <= 20
 1 <= k <= n
 */

import Testing

struct CombinationsTest {

    class Solution {
        func combine(_ n: Int, _ k: Int) -> [[Int]] {
            var result = [[Int]]()
            var combination = [Int]()

            func backtrack(_ start: Int) {
                if combination.count == k {
                    result.append(combination)
                    return
                }

                // Here we ensure we only go up to n, and we only need to go as far as necessary to complete the combination
                for i in start...n {
                    // Optimization: if there aren't enough numbers left to complete a combination of size k, break
                    if n - i + 1 < k - combination.count {
                        break
                    }

                    combination.append(i)
                    backtrack(i + 1)
                    combination.removeLast()
                }
            }

            backtrack(1)
            return result        }
    }

    func arrayToString(_ array: [[Int]]) -> [String] {
        return array.map { $0.sorted().map(String.init).joined() }.sorted()
    }

    let solution = Solution()

    @Test func example1() {
        let expected = [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]].map { $0.sorted().map(String.init).joined() }.sorted()
        let result = arrayToString(solution.combine(4, 2))
        #expect(result == expected)
    }

    @Test func example2() {
        let expected = ["1"]
        let result = arrayToString(solution.combine(1, 1))
        #expect(result == expected)
    }

}
