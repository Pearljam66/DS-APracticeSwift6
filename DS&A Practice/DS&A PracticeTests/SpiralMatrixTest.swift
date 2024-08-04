//
//  SpiralMatrixTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 8/4/24.
//

/*
 Given an m x n matrix, return all elements of the matrix in spiral order.

 Example 1:
 Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
 Output: [1,2,3,6,9,8,7,4,5]

 Example 2:
 Input: matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
 Output: [1,2,3,4,8,12,11,10,9,5,6,7]

 Constraints:

 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 10
 -100 <= matrix[i][j] <= 100
 */

import Testing

struct SpiralMatrixTest {

    class Solution {
        func spiralOrder(_ matrix: [[Int]]) -> [Int] {
            guard !matrix.isEmpty else { return [] }

            var result = [Int]()
            var top = 0
            var bottom = matrix.count - 1
            var left = 0
            var right = matrix[0].count - 1

            while top <= bottom && left <= right {
                // Traverse from left to right along the top row
                if top <= bottom && left <= right {
                    for col in left...right {
                        result.append(matrix[top][col])
                    }
                    top += 1
                }

                // Traverse from top to bottom along the right column
                if top <= bottom && left <= right {
                    for row in top...bottom {
                        result.append(matrix[row][right])
                    }
                    right -= 1
                }

                // Traverse from right to left along the bottom row
                if top <= bottom && left <= right {
                    for col in stride(from: right, through: left, by: -1) {
                        result.append(matrix[bottom][col])
                    }
                    bottom -= 1
                }

                // Traverse from bottom to top along the left column
                if top <= bottom && left <= right {
                    for row in stride(from: bottom, through: top, by: -1) {
                        result.append(matrix[row][left])
                    }
                    left += 1
                }
            }

            return result
        }
    }

    @Test func testExample1() async throws {
        let solution = Solution()
        let matrix = [[1,2,3],[4,5,6],[7,8,9]]
        let output = [1,2,3,6,9,8,7,4,5]

        #expect(solution.spiralOrder(matrix) == output)
    }

    @Test func testExample2() async throws {
        let solution = Solution()
        let matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
        let output = [1,2,3,4,8,12,11,10,9,5,6,7]

        #expect(solution.spiralOrder(matrix) == output)
    }

}
