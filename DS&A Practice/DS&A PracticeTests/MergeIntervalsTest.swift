//
//  MergeIntervalsTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 8/24/24.
//

/*
 Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

 Example 1:
 Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].

 Example 2:
 Input: intervals = [[1,4],[4,5]]
 Output: [[1,5]]
 Explanation: Intervals [1,4] and [4,5] are considered overlapping.

 Constraints:
 1 <= intervals.length <= 104
 intervals[i].length == 2
 0 <= starti <= endi <= 104
 */

import Testing

struct MergeIntervalsTest {

    class Solution {

        func merge(_ intervals: [[Int]]) -> [[Int]] {
            // If there are no intervals, return an empty list
            guard !intervals.isEmpty else { return [] }

            // Sort intervals based on starting time
            let sortedIntervals = intervals.sorted { $0[0] < $1[0] }

            var merged = [sortedIntervals[0]] // Start with the first interval

            for current in sortedIntervals.dropFirst() {
                let currentStart = current[0]
                let currentEnd = current[1]

                let lastInterval = merged.last!
                let lastStart = lastInterval[0]
                let lastEnd = lastInterval[1]

                if currentStart <= lastEnd { // Overlapping intervals
                                             // Merge the current interval with the last interval in merged list
                    merged[merged.count - 1] = [lastStart, max(lastEnd, currentEnd)]
                } else {
                    // No overlap, just add the current interval to the list
                    merged.append(current)
                }
            }
            return merged
        }
    }

    @Test func example1() {
        let input: [[Int]] = [[1, 3], [2, 6], [8, 10], [15, 18]]
        let expected: [[Int]] = [[1, 6], [8, 10], [15, 18]]
        #expect(Solution().merge(input) == expected)
    }

    @Test func example2() {
        let input: [[Int]] = [[1, 4], [4, 5]]
        let expected: [[Int]] = [[1, 5]]
        #expect(Solution().merge(input) == expected)
    }

}
