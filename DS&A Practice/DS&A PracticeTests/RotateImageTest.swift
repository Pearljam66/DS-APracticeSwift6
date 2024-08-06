//
//  RotateImageTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 8/5/24.
//

/*
 You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).
 You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.

 Example 1:
 Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
 Output: [[7,4,1],[8,5,2],[9,6,3]]

 Example 2:
 Input: matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
 Output: [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]

 Constraints:
 n == matrix.length == matrix[i].length
 1 <= n <= 20
 -1000 <= matrix[i][j] <= 1000
 */

import Testing

struct RotateImageTest {

    class Solution {
        func rotate(_ matrix: inout [[Int]]) {
            guard matrix.count > 1 else {
                return
            }

            let n = matrix.count

            for i in 0..<n {
                for j in i..<n {
                    let temp = matrix[i][j]
                    matrix[i][j] = matrix[j][i]
                    matrix[j][i] = temp
                }
            }

            for i in 0..<n {
                matrix[i].reverse()
            }
        }
    }

    @Test func exampleOne() {
        let solution = Solution()
        var matrix = [[1,2,3],[4,5,6],[7,8,9]]
        let expected = [[7,4,1],[8,5,2],[9,6,3]]

        solution.rotate(&matrix)

        #expect(matrix == expected)
    }

    @Test func exampleTwo() {
        let solution = Solution()
        var matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
        let expected = [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]

        solution.rotate(&matrix)

        #expect(matrix == expected)
    }

    @Test func singleElementMatrix() {
        let solution = Solution()
        var matrix = [[1]]
        let expected = [[1]]

        solution.rotate(&matrix)

        #expect(matrix == expected)
    }

    @Test func emptyMatrix() {
        let solution = Solution()
        var matrix: [[Int]] = []
        let expected: [[Int]] = []

        solution.rotate(&matrix)

        #expect(matrix == expected)
    }

}
