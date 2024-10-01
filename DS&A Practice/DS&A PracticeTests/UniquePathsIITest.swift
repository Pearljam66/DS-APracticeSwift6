//
//  UniquePathsIITest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/1/24.
//

/*
 You are given an m x n integer array grid. There is a robot initially located at the top-left corner (i.e., grid[0][0]). The robot tries to move to the bottom-right corner (i.e., grid[m - 1][n - 1]). The robot can only move either down or right at any point in time.
 An obstacle and space are marked as 1 or 0 respectively in grid. A path that the robot takes cannot include any square that is an obstacle.
 Return the number of possible unique paths that the robot can take to reach the bottom-right corner.
 The testcases are generated so that the answer will be less than or equal to 2 * 109.

 Example 1:
 Input: obstacleGrid = [[0,0,0],[0,1,0],[0,0,0]]
 Output: 2
 Explanation: There is one obstacle in the middle of the 3x3 grid above.
 There are two ways to reach the bottom-right corner:
 1. Right -> Right -> Down -> Down
 2. Down -> Down -> Right -> Right

 Example 2:
 Input: obstacleGrid = [[0,1],[0,0]]
 Output: 1

 Constraints:
 m == obstacleGrid.length
 n == obstacleGrid[i].length
 1 <= m, n <= 100
 obstacleGrid[i][j] is 0 or 1.
 */

import Testing

struct UniquePathsIITest {

    class Solution {
        func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
            let m = obstacleGrid.count
            let n = obstacleGrid[0].count

            // If the start or end point is an obstacle, there's no way to reach the destination.
            if obstacleGrid[0][0] == 1 || obstacleGrid[m-1][n-1] == 1 {
                return 0
            }

            // Initialize an array for dynamic programming
            var dp = Array(repeating: Array(repeating: 0, count: n), count: m)

            // Set the starting point to 1 since there's only one way to be at the start if it's not blocked
            dp[0][0] = 1

            // Initialize first column
            for i in 1..<m {
                if obstacleGrid[i][0] == 0 {
                    dp[i][0] = dp[i-1][0]
                }
            }

            // Initialize first row
            for j in 1..<n {
                if obstacleGrid[0][j] == 0 {
                    dp[0][j] = dp[0][j-1]
                }
            }

            // Fill the dp table
            for i in 1..<m {
                for j in 1..<n {
                    if obstacleGrid[i][j] == 0 {
                        dp[i][j] = dp[i-1][j] + dp[i][j-1]
                    }
                    // If there's an obstacle, paths leading to here are 0, which it already is by initialization
                }
            }

            // The bottom right cell contains the number of unique paths
            return dp[m-1][n-1]
        }
    }

    @Test func example1() {
        #expect(Solution().uniquePathsWithObstacles([[0, 0, 0], [0, 1, 0], [0, 0, 0]]) == 2)
    }

    @Test func example2() {
        #expect(Solution().uniquePathsWithObstacles([[0, 1], [0, 0]]) == 1)
    }
}
