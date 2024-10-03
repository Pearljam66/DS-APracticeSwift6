//
//  MaximalSquareTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/2/24.
//

/*
 Given an m x n binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.

 Example 1:
 Input: matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
 Output: 4

 Example 2:
 Input: matrix = [["0","1"],["1","0"]]
 Output: 1

 Example 3:
 Input: matrix = [["0"]]
 Output: 0

 Constraints:
 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 300
 matrix[i][j] is '0' or '1'.
 */

import Testing

struct MaximalSquareTest {

    class Solution {
        func maximalSquare(_ matrix: [[Character]]) -> Int {
            // Convert [[Character]] to [[String]] inside the function
            let stringMatrix = matrix.map { $0.map(String.init) }

            let rows = stringMatrix.count
            let cols = stringMatrix.first?.count ?? 0
            if rows == 0 || cols == 0 { return 0 }

            // Convert strings to integers, handling conversion issues
            var dp = stringMatrix.map { row in
                row.compactMap { string in
                    if let num = Int(string), num == 1 || num == 0 {
                        return num
                    } else if string == "1" {
                        return 1
                    } else if string == "0" {
                        return 0
                    } else {
                        return 0 // Treat anything else as 0 or handle as needed
                    }
                }
            }

            var maxSide = 0

            // Compute the size of the square sub-matrix with all 1s
            for i in 0..<rows {
                for j in 0..<cols {
                    if dp[i][j] == 1 {
                        if i == 0 || j == 0 {
                            dp[i][j] = 1
                        } else {
                            dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1
                        }
                        maxSide = max(maxSide, dp[i][j])
                    }
                    // If dp[i][j] == 0, it remains 0, not contributing to any square
                }
            }
            return maxSide * maxSide // Return the area of the largest square
        }
    }


    @Test func example1() {
        #expect(Solution().maximalSquare([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]) == 4)
    }

    @Test func example2() {
        #expect(Solution().maximalSquare([["0","1"],["1","0"]]) == 1)
    }

    @Test func example3() {
        #expect(Solution().maximalSquare([["0"]]) == 0)
    }

}
