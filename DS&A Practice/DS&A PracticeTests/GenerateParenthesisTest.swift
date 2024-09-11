//
//  GenerateParenthesisTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/11/24.
//

/*
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

 Example 1:
 Input: n = 3
 Output: ["((()))","(()())","(())()","()(())","()()()"]

 Example 2:
 Input: n = 1
 Output: ["()"]

 Constraints:
 1 <= n <= 8
 */

import Testing

struct GenerateParenthesisTest {

    class Solution {
        func generateParenthesis(_ n: Int) -> [String] {
            var result: [String] = []

            func backtrack(_ current: String, _ open: Int, _ close: Int) {
                if current.count == n * 2 {
                    result.append(current)
                    return
                }

                if open < n {
                    backtrack(current + "(", open + 1, close)
                }

                if close < open {
                    backtrack(current + ")", open, close + 1)
                }
            }

            backtrack("", 0, 0)
            return result
        }
    }

    @Test func example1() {
        #expect(Solution().generateParenthesis(3) == ["((()))","(()())","(())()","()(())","()()()"])
    }

    @Test func example2() {
        #expect(Solution().generateParenthesis(1) == ["()"])
    }

}
