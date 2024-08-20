//
//  GameOfLifeTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 8/20/24.
//

/*
 According to Wikipedia's article: "The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970."
 The board is made up of an m x n grid of cells, where each cell has an initial state: live (represented by a 1) or dead (represented by a 0). Each cell interacts with its eight neighbors (horizontal, vertical, diagonal) using the following four rules (taken from the above Wikipedia article):
 Any live cell with fewer than two live neighbors dies as if caused by under-population.
 Any live cell with two or three live neighbors lives on to the next generation.
 Any live cell with more than three live neighbors dies, as if by over-population.
 Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.
 The next state is created by applying the above rules simultaneously to every cell in the current state, where births and deaths occur simultaneously. Given the current state of the m x n grid board, return the next state.

 Example 1:
 Input: board = [[0,1,0],[0,0,1],[1,1,1],[0,0,0]]
 Output: [[0,0,0],[1,0,1],[0,1,1],[0,1,0]]

 Example 2:
 Input: board = [[1,1],[1,0]]
 Output: [[1,1],[1,1]]

 Constraints:

 m == board.length
 n == board[i].length
 1 <= m, n <= 25
 board[i][j] is 0 or 1.
 */

import Testing

struct GameOfLifeTest {

 class Solution {
     func gameOfLife(_ board: inout [[Int]]) {
         let rows = board.count
         let cols = board[0].count

         // Directions for the 8 neighbors (top, top-right, right, bottom-right, bottom, bottom-left, left, top-left)
         let directions = [(-1, -1), (-1, 0), (-1, 1), (0, 1), (1, 1), (1, 0), (1, -1), (0, -1)]

         // Create a copy of the original board to reference the original state while updating the board
         let copyBoard = board

         // Iterate through each cell in the board
         for row in 0..<rows {
             for col in 0..<cols {
                 var liveNeighbors = 0

                 // Count the live neighbors
                 for direction in directions {
                     let newRow = row + direction.0
                     let newCol = col + direction.1

                     // Check if the neighbor is within bounds and is a live cell
                     if newRow >= 0 && newRow < rows && newCol >= 0 && newCol < cols && copyBoard[newRow][newCol] == 1 {
                         liveNeighbors += 1
                     }
                 }

                 // Apply the Game of Life rules
                 if copyBoard[row][col] == 1 && (liveNeighbors < 2 || liveNeighbors > 3) {
                     // Rule 1 or 3: Live cell dies
                     board[row][col] = 0
                 } else if copyBoard[row][col] == 0 && liveNeighbors == 3 {
                     // Rule 4: Dead cell becomes live
                     board[row][col] = 1
                 }
                 // Rule 2 is implicitly handled: live cell with 2 or 3 live neighbors lives on
             }
         }
     }

    }

    @Test func example1() {
        let solution = Solution()
        var board = [[0,1,0],[0,0,1],[1,1,1],[0,0,0]]
        let expected: [[Int]] = [[0,0,0],[1,0,1],[0,1,1],[0,1,0]]
        solution.gameOfLife(&board)
        #expect(board == expected)
    }

    @Test func example2() {
        let solution = Solution()
        var board = [[1,1],[1,0]]
        let expected: [[Int]] = [[1,1],[1,1]]
        solution.gameOfLife(&board)
        #expect(board == expected)
    }

}
