//
//  MaxPointsOnALineTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/27/24.
//

/*
 Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane, return the maximum number of points that lie on the same straight line.

 Example 1:
 Input: points = [[1,1],[2,2],[3,3]]
 Output: 3

 Example 2:
 Input: points = [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
 Output: 4

 Constraints:
 1 <= points.length <= 300
 points[i].length == 2
 -104 <= xi, yi <= 104
 All the points are unique.
 */

import Testing

struct MaxPointsOnALineTest {

    class Solution {
        func maxPoints(_ points: [[Int]]) -> Int {
            guard !points.isEmpty else { return 0 }
            if points.count <= 2 { return points.count }  // If there are 0, 1, or 2 points, they all lie on the same line.

            var maxCount = 0

            for i in 0..<points.count {
                var samePoint = 1  // Count the current point itself
                var localMax = 0
                var slopes = [Double: Int]()

                for j in (i + 1)..<points.count {
                    if points[i] == points[j] {
                        samePoint += 1
                    } else {
                        // Calculate slope with care for vertical lines and division by zero
                        let dy = points[j][1] - points[i][1]
                        let dx = points[j][0] - points[i][0]
                        let slope: Double

                        if dx == 0 {
                            slope = Double.infinity  // Represent vertical line as infinity
                        } else {
                            slope = Double(dy) / Double(dx)
                        }

                        slopes[slope, default: 0] += 1
                        localMax = max(localMax, slopes[slope]!)
                    }
                }

                // Update maxCount with the maximum number of points on a line through point i
                maxCount = max(maxCount, localMax + samePoint)
            }

            return maxCount
        }
    }

    @Test func example1() {
        #expect(Solution().maxPoints([[1, 1], [2, 2], [3, 3]]) == 3)
    }

    @Test func example2() {
        #expect(Solution().maxPoints([[1, 1], [3, 2], [5, 3], [4, 1], [2, 3], [1, 4]]) == 4)
    }

}
