//
//  CandyTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/10/24.
//

/*
 There are n children standing in a line. Each child is assigned a rating value given in the integer array ratings.
 You are giving candies to these children subjected to the following requirements:

 - Each child must have at least one candy.
 - Children with a higher rating get more candies than their neighbors.
 Return the minimum number of candies you need to have to distribute the candies to the children.

 Example 1:
 Input: ratings = [1,0,2]
 Output: 5
 Explanation: You can allocate to the first, second and third child with 2, 1, 2 candies respectively.

 Example 2:
 Input: ratings = [1,2,2]
 Output: 4
 Explanation: You can allocate to the first, second and third child with 1, 2, 1 candies respectively.
 The third child gets 1 candy because it satisfies the above two conditions.

 Constraints:
 n == ratings.length
 1 <= n <= 2 * 104
 0 <= ratings[i] <= 2 * 104
 */

import Testing

struct CandyTest {

    class Solution {
        func candy(_ ratings: [Int]) -> Int {
            let n = ratings.count
            var candies = [Int](repeating: 1, count: n) // Start with 1 candy for each child

            // Left to right pass: ensure children with higher ratings get more candies than their left neighbor
            for i in 1..<n {
                if ratings[i] > ratings[i-1] {
                    candies[i] = candies[i-1] + 1
                }
            }

            // Right to left pass: ensure children with higher ratings get more candies than their right neighbor,
            // but only if it's not already satisfied from the left pass
            for i in (0..<n-1).reversed() {
                if ratings[i] > ratings[i+1] && candies[i] <= candies[i+1] {
                    candies[i] = candies[i+1] + 1
                }
            }

            // Sum up all the candies
            return candies.reduce(0, +)
        }
    }

    @Test func example1() {
        #expect(Solution().candy([1, 0, 2]) == 5)
    }

    @Test func example2() {
        #expect(Solution().candy([1, 2, 2]) == 4)
    }

}
