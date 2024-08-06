//
//  SetMatrixZeroesTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 8/6/24.
//

/*
 Given an m x n integer matrix matrix, if an element is 0, set its entire row and column to 0's.
 You must do it in place.

 Example 1:
 Input: matrix = [[1,1,1],[1,0,1],[1,1,1]]
 Output: [[1,0,1],[0,0,0],[1,0,1]]

 Example 2:
 Input: matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
 Output: [[0,0,0,0],[0,4,5,0],[0,3,1,0]]

 Constraints:
 m == matrix.length
 n == matrix[0].length
 1 <= m, n <= 200
 -231 <= matrix[i][j] <= 231 - 1
 */

import Testing

struct SetMatrixZeroesTest {
    class Solution {
        func setZeroes(_ matrix: inout [[Int]]) {
            let m = matrix.count
            let n = matrix[0].count
            var firstRowZero = false
            var firstColumnZero = false

            // Check if first row contains zero
            for j in 0..<n {
                if matrix[0][j] == 0 {
                    firstRowZero = true
                    break
                }
            }

            // Check if first column contains zero
            for i in 0..<m {
                if matrix[i][0] == 0 {
                    firstColumnZero = true
                    break
                }
            }

            // Use first row and column as markers
            for i in 1..<m {
                for j in 1..<n {
                    if matrix[i][j] == 0 {
                        matrix[i][0] = 0
                        matrix[0][j] = 0
                    }
                }
            }

            // Set zeros based on markers
            for i in 1..<m {
                for j in 1..<n {
                    if matrix[i][0] == 0 || matrix[0][j] == 0 {
                        matrix[i][j] = 0
                    }
                }
            }

            // Set first row to zero if needed
            if firstRowZero {
                for j in 0..<n {
                    matrix[0][j] = 0
                }
            }

            // Set first column to zero if needed
            if firstColumnZero {
                for i in 0..<m {
                    matrix[i][0] = 0
                }
            }
        }
    }

    @Test func example1() {
        let solution = Solution()
        var matrix: [[Int]] = [[1,1,1],[1,0,1],[1,1,1]]
        let output = [[1,0,1],[0,0,0],[1,0,1]]

        solution.setZeroes(&matrix)

        #expect(matrix == output)
    }

    @Test func example2() {
        let solution = Solution()
        var matrix: [[Int]] = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
        let output = [[0,0,0,0],[0,4,5,0],[0,3,1,0]]

        solution.setZeroes(&matrix)

        #expect(matrix == output)
    }

    @Test func singleElementMatrix() {
        let solution = Solution()
        var matrix: [[Int]] = [[1]]
        let output = [[1]]

        solution.setZeroes(&matrix)

        #expect(matrix == output)
    }

    @Test func allZeroesMatrix() {
        let solution = Solution()
        var matrix: [[Int]] = [[0,0],[0,0]]
        let output = [[0,0],[0,0]]

        solution.setZeroes(&matrix)

        #expect(matrix == output)
    }
}
