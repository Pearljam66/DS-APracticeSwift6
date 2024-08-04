//
//  SubstringWithConcatenationOfAllWordsTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 8/3/24.
//

/*
 You are given a string s and an array of strings words. All the strings of words are of the same length.
 A concatenated string is a string that exactly contains all the strings of any permutation of words concatenated.
 For example, if words = ["ab","cd","ef"], then "abcdef", "abefcd", "cdabef", "cdefab", "efabcd", and "efcdab" are all concatenated strings. "acdbef" is not a concatenated string because it is not the concatenation of any permutation of words.
 Return an array of the starting indices of all the concatenated substrings in s. You can return the answer in any order.

 Example 1:
 Input: s = "barfoothefoobarman", words = ["foo","bar"]
 Output: [0,9]
 Explanation:
 The substring starting at 0 is "barfoo". It is the concatenation of ["bar","foo"] which is a permutation of words.
 The substring starting at 9 is "foobar". It is the concatenation of ["foo","bar"] which is a permutation of words.

 Example 2:
 Input: s = "wordgoodgoodgoodbestword", words = ["word","good","best","word"]
 Output: []
 Explanation:
 There is no concatenated substring.

 Example 3:
 Input: s = "barfoofoobarthefoobarman", words = ["bar","foo","the"]
 Output: [6,9,12]
 Explanation:
 The substring starting at 6 is "foobarthe". It is the concatenation of ["foo","bar","the"].
 The substring starting at 9 is "barthefoo". It is the concatenation of ["bar","the","foo"].
 The substring starting at 12 is "thefoobar". It is the concatenation of ["the","foo","bar"].

 Constraints:

 1 <= s.length <= 104
 1 <= words.length <= 5000
 1 <= words[i].length <= 30
 s and words[i] consist of lowercase English letters.
 */

import Testing

struct SubstringWithConcatenationOfAllWordsTest {

    class Solution {
        func findSubstring(_ s: String, _ words: [String]) -> [Int] {
            guard !words.isEmpty else { return [] }

            let wordLength = words[0].count
            let totalLength = wordLength * words.count
            guard s.count >= totalLength else { return [] }

            var wordCounts = [String: Int]()
            for word in words {
                wordCounts[word, default: 0] += 1
            }

            var result = [Int]()
            let sArray = Array(s)

            for i in 0..<wordLength {
                var seenWords = [String: Int]()
                var start = i
                var count = 0

                for j in stride(from: i, to: sArray.count - wordLength + 1, by: wordLength) {
                    let word = String(sArray[j..<j+wordLength])

                    if let targetCount = wordCounts[word] {
                        seenWords[word, default: 0] += 1
                        count += 1

                        while seenWords[word]! > targetCount {
                            let firstWord = String(sArray[start..<start+wordLength])
                            seenWords[firstWord]! -= 1
                            start += wordLength
                            count -= 1
                        }

                        if count == words.count {
                            result.append(start)
                            let firstWord = String(sArray[start..<start+wordLength])
                            seenWords[firstWord]! -= 1
                            start += wordLength
                            count -= 1
                        }
                    } else {
                        seenWords.removeAll()
                        start = j + wordLength
                        count = 0
                    }
                }
            }

            return result
        }
    }

    @Test func testExample1() {
        let solution = Solution()
        let s = "barfoothefoobarman"
        let words = ["foo", "bar"]
        let output = [0, 9]

        #expect(solution.findSubstring(s, words) == output)
    }

    @Test func testExample2() {
        let solution = Solution()
        let s = "wordgoodgoodgoodbestword"
        let words = ["word", "good", "best", "word"]
        let output:[Int] = []

        #expect(solution.findSubstring(s, words) == output)
    }

    @Test func testExample3() {
        let solution = Solution()
        let s = "barfoofoobarthefoobarman"
        let words = ["bar", "foo", "the"]
        let output = [6, 9, 12]

        #expect(solution.findSubstring(s, words) == output)
    }

}
