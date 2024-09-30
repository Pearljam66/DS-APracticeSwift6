//
//  MinimumPathSumTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/30/24.
//

/*
 Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right, which minimizes the sum of all numbers along its path.
 Note: You can only move either down or right at any point in time.

 Example 1:
 Input: grid = [[1,3,1],[1,5,1],[4,2,1]]
 Output: 7
 Explanation: Because the path 1 → 3 → 1 → 1 → 1 minimizes the sum.

 Example 2:
 Input: grid = [[1,2,3],[4,5,6]]
 Output: 12

 Example 3:
 Input: grid = [[1,2],[1,1]]
 Output: 3

 Constraints:
 m == grid.length
 n == grid[i].length
 1 <= m, n <= 200
 0 <= grid[i][j] <= 200
 */

import Testing

struct MinimumPathSumTest {

    class Solution {
        func minPathSum(_ grid: [[Int]]) -> Int {
            let m = grid.count
            if m == 0 { return 0 }
            let n = grid[0].count
            if n == 0 { return 0 }

            var dp = grid

            // Initialize the first cell
            // This step is already correct but mentioned here for clarity
            // dp[0][0] remains as is since there's no previous sum to add

            // Initialize first row
            for j in 1..<n {
                dp[0][j] += dp[0][j-1]
            }

            // Initialize first column
            for i in 1..<m {
                dp[i][0] += dp[i-1][0]
            }

            // Fill the dp table
            for i in 1..<m {
                for j in 1..<n {
                    dp[i][j] += min(dp[i-1][j], dp[i][j-1])
                }
            }

            return dp[m-1][n-1]
        }
    }

    @Test func example1() {
        #expect(Solution().minPathSum([[1,3,1],[1,5,1],[4,2,1]]) == 7)
    }

    @Test func example2() {
        #expect(Solution().minPathSum([[1,2,3],[4,5,6]]) == 12)
    }

    @Test func example3() {
        #expect(Solution().minPathSum([[1,2],[1,1]]) == 3)
    }

}
