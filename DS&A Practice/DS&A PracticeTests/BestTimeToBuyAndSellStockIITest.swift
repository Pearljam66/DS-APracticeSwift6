//
//  BestTimeToBuyAndSellStockIITest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/7/24.
//

/*
 You are given an integer array prices where prices[i] is the price of a given stock on the ith day.
 On each day, you may decide to buy and/or sell the stock. You can only hold at most one share of the stock at any time. However, you can buy it then immediately sell it on the same day.
 Find and return the maximum profit you can achieve.

 Example 1:
 Input: prices = [7,1,5,3,6,4]
 Output: 7
 Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
 Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
 Total profit is 4 + 3 = 7.

 Example 2:
 Input: prices = [1,2,3,4,5]
 Output: 4
 Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
 Total profit is 4.

 Example 3:
 Input: prices = [7,6,4,3,1]
 Output: 0
 Explanation: There is no way to make a positive profit, so we never buy the stock to achieve the maximum profit of 0.

 Constraints:
 1 <= prices.length <= 3 * 104
 0 <= prices[i] <= 104
 */

import Testing

struct BestTimeToBuyAndSellStockIITest {

    class Solution {
        func maxProfit(_ prices: [Int]) -> Int {
            var totalProfit = 0

            // We iterate through all prices except the last one because we compare current day with next day
            for i in 0..<prices.count - 1 {
                // If tomorrow's price is greater than today's price, we make a profit
                if prices[i + 1] > prices[i] {
                    totalProfit += prices[i + 1] - prices[i]
                }
            }
            return totalProfit
        }
    }

    @Test func example1() {
        #expect(Solution().maxProfit([7, 1, 5, 3, 6, 4]) == 7)
    }

    @Test func example2() {
        #expect(Solution().maxProfit([1, 2, 3, 4, 5]) == 4)
    }

    @Test func example3() {
        #expect(Solution().maxProfit([7, 6, 4, 3, 1]) == 0)
    }

}
