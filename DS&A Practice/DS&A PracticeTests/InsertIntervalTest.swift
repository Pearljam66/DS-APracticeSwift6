//
//  InsertIntervalTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 8/26/24.
//

/*
 You are given an array of non-overlapping intervals intervals where intervals[i] = [starti, endi] represent the start and the end of the ith interval and intervals is sorted in ascending order by starti. You are also given an interval newInterval = [start, end] that represents the start and end of another interval.
 Insert newInterval into intervals such that intervals is still sorted in ascending order by starti and intervals still does not have any overlapping intervals (merge overlapping intervals if necessary).
 Return intervals after the insertion.
 Note that you don't need to modify intervals in-place. You can make a new array and return it.

 Example 1:
 Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
 Output: [[1,5],[6,9]]

 Example 2:
 Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
 Output: [[1,2],[3,10],[12,16]]
 Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].

 Constraints:
 0 <= intervals.length <= 104
 intervals[i].length == 2
 0 <= starti <= endi <= 105
 intervals is sorted by starti in ascending order.
 newInterval.length == 2
 0 <= start <= end <= 105
 */

import Testing

struct InsertIntervalTest {

    class Solution {

        func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
            var result: [[Int]] = []
            var newInt = newInterval
            var i = 0

            // Add all intervals that come before newInterval
            while i < intervals.count && intervals[i][1] < newInt[0] {
                result.append(intervals[i])
                i += 1
            }

            // Merge overlapping intervals
            while i < intervals.count && intervals[i][0] <= newInt[1] {
                newInt[0] = min(newInt[0], intervals[i][0])
                newInt[1] = max(newInt[1], intervals[i][1])
                i += 1
            }

            // Add the merged interval
            result.append(newInt)

            // Add remaining intervals
            while i < intervals.count {
                result.append(intervals[i])
                i += 1
            }

            return result
        }
    }


    @Test func example1() {
        #expect(Solution().insert([[1, 3], [6, 9]], [2, 5]) == [[1, 5], [6, 9]])
    }

    @Test func example2() {
        #expect(Solution().insert([[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]], [4, 8]) == [[1, 2], [3, 10], [12, 16]])
    }

}
