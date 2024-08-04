//
//  ValidSudokiTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 8/4/24.
//

/*
 Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:
 Each row must contain the digits 1-9 without repetition.
 Each column must contain the digits 1-9 without repetition.
 Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
 Note:
 A Sudoku board (partially filled) could be valid but is not necessarily solvable.
 Only the filled cells need to be validated according to the mentioned rules.

 Example 1:
 Input: board =
 [["5","3",".",".","7",".",".",".","."]
 ,["6",".",".","1","9","5",".",".","."]
 ,[".","9","8",".",".",".",".","6","."]
 ,["8",".",".",".","6",".",".",".","3"]
 ,["4",".",".","8",".","3",".",".","1"]
 ,["7",".",".",".","2",".",".",".","6"]
 ,[".","6",".",".",".",".","2","8","."]
 ,[".",".",".","4","1","9",".",".","5"]
 ,[".",".",".",".","8",".",".","7","9"]]
 Output: true

 Example 2:
 Input: board =
 [["8","3",".",".","7",".",".",".","."]
 ,["6",".",".","1","9","5",".",".","."]
 ,[".","9","8",".",".",".",".","6","."]
 ,["8",".",".",".","6",".",".",".","3"]
 ,["4",".",".","8",".","3",".",".","1"]
 ,["7",".",".",".","2",".",".",".","6"]
 ,[".","6",".",".",".",".","2","8","."]
 ,[".",".",".","4","1","9",".",".","5"]
 ,[".",".",".",".","8",".",".","7","9"]]
 Output: false
 Explanation: Same as Example 1, except with the 5 in the top left corner being modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.

 Constraints:
 board.length == 9
 board[i].length == 9
 board[i][j] is a digit 1-9 or '.'.
 */
import Testing

struct ValidSudokiTest {

    class Solution {
        func isValidSudoku(_ board: [[Character]]) -> Bool {
            var rows = Array(repeating: Set<Character>(), count: 9)
            var columns = Array(repeating: Set<Character>(), count: 9)
            var boxes = Array(repeating: Set<Character>(), count: 9)

            for i in 0..<9 {
                for j in 0..<9 {
                    let cell = board[i][j]
                    guard cell != "." else { continue }

                    let boxIndex = (i / 3) * 3 + (j / 3)

                    if rows[i].contains(cell) || columns[j].contains(cell) || boxes[boxIndex].contains(cell) {
                        return false
                    }

                    rows[i].insert(cell)
                    columns[j].insert(cell)
                    boxes[boxIndex].insert(cell)
                }
            }
            return true
        }
    }

    @Test func testExample1() {
        let solution = Solution()
        let board:[[Character]] =  [["5","3",".",".","7",".",".",".","."]
                                  ,["6",".",".","1","9","5",".",".","."]
                                  ,[".","9","8",".",".",".",".","6","."]
                                  ,["8",".",".",".","6",".",".",".","3"]
                                  ,["4",".",".","8",".","3",".",".","1"]
                                  ,["7",".",".",".","2",".",".",".","6"]
                                  ,[".","6",".",".",".",".","2","8","."]
                                  ,[".",".",".","4","1","9",".",".","5"]
                                  ,[".",".",".",".","8",".",".","7","9"]]
        let output = true

        #expect(solution.isValidSudoku(board) == output)
    }

    @Test func testExample2() {
        let solution = Solution()
        let board:[[Character]] =  [["8","3",".",".","7",".",".",".","."]
                                  ,["6",".",".","1","9","5",".",".","."]
                                  ,[".","9","8",".",".",".",".","6","."]
                                  ,["8",".",".",".","6",".",".",".","3"]
                                  ,["4",".",".","8",".","3",".",".","1"]
                                  ,["7",".",".",".","2",".",".",".","6"]
                                  ,[".","6",".",".",".",".","2","8","."]
                                  ,[".",".",".","4","1","9",".",".","5"]
                                  ,[".",".",".",".","8",".",".","7","9"]]
        let output = false

        #expect(solution.isValidSudoku(board) == output)
    }

}
