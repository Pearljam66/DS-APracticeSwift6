//
//  CoinChangeTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/29/24.
//

/*
 You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.
 Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.
 You may assume that you have an infinite number of each kind of coin.

 Example 1:
 Input: coins = [1,2,5], amount = 11
 Output: 3
 Explanation: 11 = 5 + 5 + 1

 Example 2:
 Input: coins = [2], amount = 3
 Output: -1

 Example 3:
 Input: coins = [1], amount = 0
 Output: 0

 Constraints:
 1 <= coins.length <= 12
 1 <= coins[i] <= 231 - 1
 0 <= amount <= 104
 */

import Testing

struct CoinChangeTest {

    class Solution {
        func coinChange(_ coins: [Int], _ amount: Int) -> Int {
            // Check if amount is less than or equal to 0
            if amount <= 0 {
                return amount == 0 ? 0 : -1  // If amount is 0, we need 0 coins; otherwise, it's impossible
            }

            // Initialize dp array with amount + 1 to represent an impossible number of coins
            var dp = [Int](repeating: amount + 1, count: amount + 1)
            dp[0] = 0  // Base case: 0 coins needed to make amount 0

            // Iterate over all amounts from 1 up to the target amount
            for currentAmount in 1...amount {
                for coin in coins {
                    // If this coin can be used (its value is less than or equal to the current amount)
                    if coin <= currentAmount {
                        // Choose the minimum between:
                        // 1. Not using this coin (dp[currentAmount])
                        // 2. Using this coin (1 + dp[currentAmount - coin])
                        dp[currentAmount] = min(dp[currentAmount], 1 + dp[currentAmount - coin])
                    }
                }
            }

            // If dp[amount] has not changed, it means we couldn't make up the amount
            return dp[amount] > amount ? -1 : dp[amount]
        }
    }

    @Test func example1() {
        #expect(Solution().coinChange([1, 2, 5], 11) == 3)
    }

    @Test func example2() {
        #expect(Solution().coinChange([2], 3) == -1)
    }

    @Test func example3() {
        #expect(Solution().coinChange([1], 0) == 0)
    }

}
