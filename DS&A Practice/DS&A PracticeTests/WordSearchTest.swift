//
//  WordSearchTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/12/24.
//

/*
 Given an m x n grid of characters board and a string word, return true if word exists in the grid.
 The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.

 Example 1:
 Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
 Output: true

 Example 2:
 Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
 Output: true

 Example 3:
 Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
 Output: false

 Constraints:
 m == board.length
 n = board[i].length
 1 <= m, n <= 6
 1 <= word.length <= 15
 board and word consists of only lowercase and uppercase English letters.
 */

import Testing

struct WordSearchTest {

    class Solution {
        func exist(_ board: [[Character]], _ word: String) -> Bool {
            let m = board.count
            let n = board[0].count
            let wordArray = Array(word)
            var visited = Array(repeating: Array(repeating: false, count: n), count: m)

            func dfs(_ i: Int, _ j: Int, _ k: Int) -> Bool {
                if k == wordArray.count {
                    return true
                }

                if i < 0 || i >= m || j < 0 || j >= n || visited[i][j] || board[i][j] != wordArray[k] {
                    return false
                }

                visited[i][j] = true

                let result = dfs(i+1, j, k+1) || dfs(i-1, j, k+1) || dfs(i, j+1, k+1) || dfs(i, j-1, k+1)

                visited[i][j] = false

                return result
            }

            for i in 0..<m {
                for j in 0..<n {
                    if dfs(i, j, 0) {
                        return true
                    }
                }
            }

            return false
        }
    }

    @Test func example1() {
        #expect(Solution().exist([["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]], "ABCCED") == true)
    }

    @Test func example2() {
        #expect(Solution().exist([["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]], "SEE") == true)
    }

    @Test func example3() {
        #expect(Solution().exist([["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]], "ABCB") == false)
    }

}
