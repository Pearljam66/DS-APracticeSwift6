//
//  TriangleTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/29/24.
//

/*
 Given a triangle array, return the minimum path sum from top to bottom.
 For each step, you may move to an adjacent number of the row below. More formally, if you are on index i on the current row, you may move to either index i or index i + 1 on the next row.

 Example 1:
 Input: triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
 Output: 11
 Explanation: The triangle looks like:
 2
 3 4
 6 5 7
 4 1 8 3
 The minimum path sum from top to bottom is 2 + 3 + 5 + 1 = 11 (underlined above).

 Example 2:
 Input: triangle = [[-10]]
 Output: -10

 Constraints:
 1 <= triangle.length <= 200
 triangle[0].length == 1
 triangle[i].length == triangle[i - 1].length + 1
 -104 <= triangle[i][j] <= 104
 */

import Testing

struct TriangleTest {

    class Solution {
        func minimumTotal(_ triangle: [[Int]]) -> Int {
            guard !triangle.isEmpty else { return 0 }

            var dp = triangle.last!

            for i in (0..<triangle.count - 1).reversed() {
                for j in 0...i {
                    dp[j] = triangle[i][j] + min(dp[j], dp[j + 1])
                }
            }
            return dp[0]
        }
    }

    @Test func example1() {
        #expect(Solution().minimumTotal([[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]]) == 11)
    }

    @Test func example2() {
        #expect(Solution().minimumTotal([[-10]]) == -10)
    }

}
