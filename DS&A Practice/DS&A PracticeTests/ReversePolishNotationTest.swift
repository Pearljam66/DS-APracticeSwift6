//
//  ReversePolishNotationTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 8/28/24.
//

/*
 You are given an array of strings tokens that represents an arithmetic expression in a Reverse Polish Notation.
 Evaluate the expression. Return an integer that represents the value of the expression.
 Note that:
 The valid operators are '+', '-', '*', and '/'.
 Each operand may be an integer or another expression.
 The division between two integers always truncates toward zero.
 There will not be any division by zero.
 The input represents a valid arithmetic expression in a reverse polish notation.
 The answer and all the intermediate calculations can be represented in a 32-bit integer.

 Example 1:
 Input: tokens = ["2","1","+","3","*"]
 Output: 9
 Explanation: ((2 + 1) * 3) = 9

 Example 2:
 Input: tokens = ["4","13","5","/","+"]
 Output: 6
 Explanation: (4 + (13 / 5)) = 6

 Example 3:
 Input: tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
 Output: 22
 Explanation: ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
 = ((10 * (6 / (12 * -11))) + 17) + 5
 = ((10 * (6 / -132)) + 17) + 5
 = ((10 * 0) + 17) + 5
 = (0 + 17) + 5
 = 17 + 5
 = 22

 Constraints:
 1 <= tokens.length <= 104
 tokens[i] is either an operator: "+", "-", "*", or "/", or an integer in the range [-200, 200].
 */

import Testing

struct ReversePolishNotationTest {

    class Solution {
        func evalRPN(_ tokens: [String]) -> Int {
            var stack: [Int] = []

            for token in tokens {
                switch token {
                    case "+":
                        guard stack.count >= 2 else { fatalError("Invalid RPN expression") }
                        let b = stack.removeLast()
                        let a = stack.removeLast()
                        stack.append(a + b)
                    case "-":
                        guard stack.count >= 2 else { fatalError("Invalid RPN expression") }
                        let b = stack.removeLast()
                        let a = stack.removeLast()
                        stack.append(a - b)
                    case "*":
                        guard stack.count >= 2 else { fatalError("Invalid RPN expression") }
                        let b = stack.removeLast()
                        let a = stack.removeLast()
                        stack.append(a * b)
                    case "/":
                        guard stack.count >= 2 else { fatalError("Invalid RPN expression") }
                        let b = stack.removeLast()
                        let a = stack.removeLast()
                        // Swift's division truncates towards zero by default for integers
                        stack.append(a / b)
                    default:
                        // Convert token to integer and push onto stack
                        guard let number = Int(token) else { fatalError("Invalid token") }
                        stack.append(number)
                }
            }

            // The result should be the only item left in the stack
            guard stack.count == 1 else { fatalError("Invalid RPN expression") }
            return stack[0]
        }
    }

    @Test func example1() {
        #expect(Solution().evalRPN(["2", "1", "+", "3", "*"]) == 9)
    }

    @Test func example2() {
        #expect(Solution().evalRPN(["4", "13", "5", "/", "+"]) == 6)
    }

    @Test func example3() {
        #expect(Solution().evalRPN(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]) == 22)
    }

}
