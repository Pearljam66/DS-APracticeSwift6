//
//  BestTimeToBuyAndSellStockIVTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/2/24.
//

/*
 You are given an integer array prices where prices[i] is the price of a given stock on the ith day, and an integer k.
 Find the maximum profit you can achieve. You may complete at most k transactions: i.e. you may buy at most k times and sell at most k times.
 Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

 Example 1:
 Input: k = 2, prices = [2,4,1]
 Output: 2
 Explanation: Buy on day 1 (price = 2) and sell on day 2 (price = 4), profit = 4-2 = 2.

 Example 2:
 Input: k = 2, prices = [3,2,6,5,0,3]
 Output: 7
 Explanation: Buy on day 2 (price = 2) and sell on day 3 (price = 6), profit = 6-2 = 4. Then buy on day 5 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.

 Constraints:
 1 <= k <= 100
 1 <= prices.length <= 1000
 0 <= prices[i] <= 1000
 */

import Testing

struct BestTimeToBuyAndSellStockIVTest {

    class Solution {
        func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
            if prices.isEmpty || k == 0 { return 0 }

            // If k is large enough, we can make transactions on all profitable days
            if k >= prices.count / 2 {
                return quickSolve(prices)
            }

            var dp = [[Int]](repeating: [Int](repeating: Int.min / 2, count: k + 1), count: prices.count)

            for i in 0..<prices.count {
                dp[i][0] = 0 // No transactions make no profit
                for j in 1...k {
                    if i == 0 {
                        dp[i][j] = -prices[i]
                    } else {
                        // Max profit by either:
                        // - Not doing anything new on this day (carry over from yesterday)
                        // - Or selling today (profit of this sale plus max profit from up to j-1 transactions before buying this stock)
                        dp[i][j] = max(dp[i-1][j], dp[i-1][j-1] + prices[i] - prices[i-1])
                        // Here, the subtraction `prices[i] - prices[i-1]` is incorrect for multiple transactions,
                        // we should instead compare with the max profit of buying at any previous price:
                        if i > 0 {
                            for prev in 0..<i {
                                let buyPrice = prices[prev]
                                dp[i][j] = max(dp[i][j], (dp[prev][j-1] - buyPrice) + prices[i])
                            }
                        }
                    }
                }
            }

            return dp[prices.count - 1].max() ?? 0
        }

        func quickSolve(_ prices: [Int]) -> Int {
            var totalProfit = 0
            for i in 1..<prices.count {
                if prices[i] > prices[i-1] {
                    totalProfit += prices[i] - prices[i-1]
                }
            }
            return totalProfit
        }

    }

    @Test func example1() {
        #expect(Solution().maxProfit(2, [2, 4, 1]) == 2)
    }

    @Test func example2() {
        #expect(Solution().maxProfit(2, [3, 2, 6, 5, 0, 3]) == 7)
    }

}
