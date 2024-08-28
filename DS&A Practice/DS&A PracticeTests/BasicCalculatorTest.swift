//
//  BasicCalculatorTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 8/28/24.
//

/*
 Given a string s representing a valid expression, implement a basic calculator to evaluate it, and return the result of the evaluation.
 Note: You are not allowed to use any built-in function which evaluates strings as mathematical expressions, such as eval().

 Example 1:
 Input: s = "1 + 1"
 Output: 2

 Example 2:
 Input: s = " 2-1 + 2 "
 Output: 3

 Example 3:
 Input: s = "(1+(4+5+2)-3)+(6+8)"
 Output: 23

 Constraints:
 1 <= s.length <= 3 * 105
 s consists of digits, '+', '-', '(', ')', and ' '.
 s represents a valid expression.
 '+' is not used as a unary operation (i.e., "+1" and "+(2 + 3)" is invalid).
 '-' could be used as a unary operation (i.e., "-1" and "-(2 + 3)" is valid).
 There will be no two consecutive operators in the input.
 Every number and running calculation will fit in a signed 32-bit integer.
 */

import Testing

struct BasicCalculatorTest {

    class Solution {
        func calculate(_ s: String) -> Int {
            var stack = [Int]()
            var num = 0
            var sign = 1 // 1 for +, -1 for -
            var result = 0

            for char in s {
                if char.isNumber {
                    num = num * 10 + Int(String(char))!
                } else if char == "+" || char == "-" {
                    result += sign * num
                    num = 0
                    sign = char == "+" ? 1 : -1
                } else if char == "(" {
                    stack.append(result)
                    stack.append(sign)
                    result = 0
                    sign = 1
                } else if char == ")" {
                    result += sign * num
                    result *= stack.removeLast() // The sign before the parenthesis
                    result += stack.removeLast() // The result calculated before the parenthesis
                    num = 0
                }
                // If char is ' ', we just continue
            }

            // Add the last number to result, in case there's no trailing operator
            return result + sign * num
        }
    }

    @Test func example1() {
        #expect(Solution().calculate("1 + 1") == 2)
    }

    @Test func example2() {
        #expect(Solution().calculate(" 2 - 1 + 2 ") == 3)
    }

    @Test func example3() {
        #expect(Solution().calculate("(1 + (4 + 5 + 2) - 3) + (6 + 8)") == 23)
    }

}
