//
//  LetterCombinationsOfPhoneNumberTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/4/24.
//

/*
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.
 A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

 Example 1:
 Input: digits = "23"
 Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]

 Example 2:
 Input: digits = ""
 Output: []

 Example 3:
 Input: digits = "2"
 Output: ["a","b","c"]

 Constraints:
 0 <= digits.length <= 4
 digits[i] is a digit in the range ['2', '9'].
 */

import Testing

struct LetterCombinationsOfPhoneNumberTest {

    class Solution {
        // Dictionary to map digits to letters
        let digitToLetters: [Character: [Character]] = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"]
        ]

        func letterCombinations(_ digits: String) -> [String] {
            // If the input is empty, return an empty array
            guard !digits.isEmpty else { return [] }

            var result = [String]()

            func backtrack(_ index: Int, _ path: [Character]) {
                // If the path length equals the digits length, we have a complete combination
                if path.count == digits.count {
                    result.append(String(path))
                    return
                }

                // Get the letters that the current digit maps to, and loop through them
                if let letters = digitToLetters[digits[digits.index(digits.startIndex, offsetBy: index)]] {
                    for letter in letters {
                        // Append the current letter to the path and move to the next digit
                        backtrack(index + 1, path + [letter])
                    }
                }
            }

            // Start the backtracking with index 0 and an empty path
            backtrack(0, [])

            return result
        }
    }

    @Test func example1() {
        #expect(Solution().letterCombinations("23") == ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"])
    }

    @Test func example2() {
        #expect(Solution().letterCombinations("") == [])
    }

    @Test func example3() {
        #expect(Solution().letterCombinations("2") == ["a", "b", "c"])
    }

}
