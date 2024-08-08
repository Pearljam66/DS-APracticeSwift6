//
//  GroupAnagramsTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 8/8/24.
//

/*
 Given an array of strings strs, group the anagrams together. You can return the answer in any order.
 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

 Example 1:
 Input: strs = ["eat","tea","tan","ate","nat","bat"]
 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

 Example 2:
 Input: strs = [""]
 Output: [[""]]

 Example 3:
 Input: strs = ["a"]
 Output: [["a"]]

 Constraints:
 1 <= strs.length <= 104
 0 <= strs[i].length <= 100
 strs[i] consists of lowercase English letters.
 */

import Testing

struct GroupAnagramsTest {

    class Solution {

        func groupAnagrams(_ strs: [String]) -> [[String]] {
            var anagramGroups = [String: [String]]()

            for word in strs {
                let sortedWord = String(word.sorted())
                if var group = anagramGroups[sortedWord] {
                    group.append(word)
                    anagramGroups[sortedWord] = group
                } else {
                    anagramGroups[sortedWord] = [word]
                }
            }

            return Array(anagramGroups.values)
        }

    }

    @Test func example1() {
        let solution = Solution()
        let strs = ["eat","tea","tan","ate","nat","bat"]
        let output = [["bat"],["nat","tan"],["ate","eat","tea"]]

        let result = solution.groupAnagrams(strs)

        // Need to sort otherwise the test will fail due to the order.
        let sortedResult = result.map { $0.sorted() }.sorted { $0[0] < $1[0] }
        let sortedOutput = output.map { $0.sorted() }.sorted { $0[0] < $1[0] }

        #expect(sortedResult == sortedOutput)
    }

    @Test func example2() {
        let solution = Solution()
        let strs = [""]
        let output = [[""]]

        #expect(solution.groupAnagrams(strs) == output)
    }

    @Test func example3() {
        let solution = Solution()
        let strs = ["a"]
        let output = [["a"]]

        #expect(solution.groupAnagrams(strs) == output)
    }

}
