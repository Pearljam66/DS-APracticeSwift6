//
//  N-QueensIITest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/10/24.
//

/*
 The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other.
 Given an integer n, return the number of distinct solutions to the n-queens puzzle.

 Example 1:
 Input: n = 4
 Output: 2
 Explanation: There are two distinct solutions to the 4-queens puzzle as shown.

 Example 2:
 Input: n = 1
 Output: 1

 Constraints:
 1 <= n <= 9
 */

import Testing

struct N_QueensIITest {

    class Solution {
        func totalNQueens(_ n: Int) -> Int {
            var count = 0
            var queens = [Int]() // Represents the column position for each row
            var cols = Set<Int>()
            var diagonals1 = Set<Int>() // r - c
            var diagonals2 = Set<Int>() // r + c

            func backtrack(_ row: Int) {
                if row == n {
                    count += 1
                    return
                }

                for col in 0..<n {
                    if !cols.contains(col) &&
                        !diagonals1.contains(row - col) &&
                        !diagonals2.contains(row + col) {

                        // Place queen
                        queens.append(col)
                        cols.insert(col)
                        diagonals1.insert(row - col)
                        diagonals2.insert(row + col)

                        // Move to the next row
                        backtrack(row + 1)

                        // Remove queen (backtrack)
                        queens.removeLast()
                        cols.remove(col)
                        diagonals1.remove(row - col)
                        diagonals2.remove(row + col)
                    }
                }
            }

            backtrack(0)
            return count
        }
    }

    @Test func example1() {
        #expect(Solution().totalNQueens(4) == 2)
    }

    @Test func example2() {
        #expect(Solution().totalNQueens(1) == 1)
    }

}
