//
//  BestTimeToBuyAndSellStockIIITest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/1/24.
//

/*
 You are given an array prices where prices[i] is the price of a given stock on the ith day.
 Find the maximum profit you can achieve. You may complete at most two transactions.
 Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

 Example 1:
 Input: prices = [3,3,5,0,0,3,1,4]
 Output: 6
 Explanation: Buy on day 4 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
 Then buy on day 7 (price = 1) and sell on day 8 (price = 4), profit = 4-1 = 3.

 Example 2:
 Input: prices = [1,2,3,4,5]
 Output: 4
 Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
 Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are engaging multiple transactions at the same time. You must sell before buying again.

 Example 3:
 Input: prices = [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transaction is done, i.e. max profit = 0.

 Constraints:
 1 <= prices.length <= 105
 0 <= prices[i] <= 105
 */

import Testing

struct BestTimeToBuyAndSellStockIIITest {

    class Solution {
        func maxProfit(_ prices: [Int]) -> Int {
            // Edge case: if less than 2 prices, no profit can be made
            if prices.count < 2 {
                return 0
            }

            // Initialize variables for transactions
            // Buy1 and Buy2 represent the minimum price seen so far for first and second buy respectively
            var buy1 = Int.max
            var buy2 = Int.max
            // Profit1 and Profit2 represent profit from first and second transaction respectively
            var profit1 = 0
            var profit2 = 0

            for price in prices {
                // Update the lowest price to buy the first stock
                buy1 = min(buy1, price)
                // Update the profit if we sell the first stock today
                profit1 = max(profit1, price - buy1)
                // If we've made some profit from the first transaction,
                // this could be the buying point for the second transaction after accounting for the profit
                buy2 = min(buy2, price - profit1)
                // Update the total profit if we sell the second stock today
                profit2 = max(profit2, price - buy2)
            }

            return profit2
        }
    }

    @Test func example1() {
        #expect(Solution().maxProfit([3, 3, 5, 0, 0, 3, 1, 4]) == 6)
    }

    @Test func example2() {
        #expect(Solution().maxProfit([1, 2, 3, 4, 5]) == 4)
    }

    @Test func example3() {
        #expect(Solution().maxProfit([7, 6, 4, 3, 1]) == 0)
    }

}
