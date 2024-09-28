//
//  ClimbingStairsTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/28/24.
//

/*
 You are climbing a staircase. It takes n steps to reach the top.
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

 Example 1:
 Input: n = 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps

 Example 2:
 Input: n = 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step

 Constraints:
 1 <= n <= 45
 */

import Testing

struct ClimbingStairsTest {

    class Solution {
        func climbStairs(_ n: Int) -> Int {
            // Base cases
            if n <= 1 {
                return 1
            }

            // Array to store the number of ways to reach each step
            var dp = [Int](repeating: 0, count: n + 1)

            // There is one way to stay at step 0 (by doing nothing)
            dp[0] = 1
            // There is one way to reach the 1st step
            dp[1] = 1

            // Fill the dp array
            for i in 2...n {
                // Number of ways to reach current step is the sum of ways to
                // reach the previous step and the step before that
                dp[i] = dp[i - 1] + dp[i - 2]
            }

            // Return the number of ways to reach the nth step
            return dp[n]
        }
    }

    @Test func example1() {
        #expect(Solution().climbStairs(2) == 2)
    }

    @Test func example2() {
        #expect(Solution().climbStairs(3) == 3)
    }

}
