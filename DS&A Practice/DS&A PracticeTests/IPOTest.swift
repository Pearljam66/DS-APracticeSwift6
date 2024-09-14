//
//  IPOTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/14/24.
//

/*
 Suppose LeetCode will start its IPO soon. In order to sell a good price of its shares to Venture Capital, LeetCode would like to work on some projects to increase its capital before the IPO. Since it has limited resources, it can only finish at most k distinct projects before the IPO. Help LeetCode design the best way to maximize its total capital after finishing at most k distinct projects.
 You are given n projects where the ith project has a pure profit profits[i] and a minimum capital of capital[i] is needed to start it.
 Initially, you have w capital. When you finish a project, you will obtain its pure profit and the profit will be added to your total capital.
 Pick a list of at most k distinct projects from given projects to maximize your final capital, and return the final maximized capital.
 The answer is guaranteed to fit in a 32-bit signed integer.

 Example 1:
 Input: k = 2, w = 0, profits = [1,2,3], capital = [0,1,1]
 Output: 4
 Explanation: Since your initial capital is 0, you can only start the project indexed 0.
 After finishing it you will obtain profit 1 and your capital becomes 1.
 With capital 1, you can either start the project indexed 1 or the project indexed 2.
 Since you can choose at most 2 projects, you need to finish the project indexed 2 to get the maximum capital.
 Therefore, output the final maximized capital, which is 0 + 1 + 3 = 4.

 Example 2:
 Input: k = 3, w = 0, profits = [1,2,3], capital = [0,1,2]
 Output: 6

 Constraints:
 1 <= k <= 105
 0 <= w <= 109
 n == profits.length
 n == capital.length
 1 <= n <= 105
 0 <= profits[i] <= 104
 0 <= capital[i] <= 109
 */

import Testing

struct IPOTest {

    class Solution {
        func findMaximizedCapital(_ k: Int, _ w: Int, _ profits: [Int], _ capital: [Int]) -> Int {
            var availableProjects = Array(zip(capital, profits)).sorted { $0.0 < $1.0 }
            var maxProfit = MaxHeap<Int>()
            var currentCapital = w
            var projectIndex = 0

            for _ in 0..<k {
                while projectIndex < availableProjects.count && availableProjects[projectIndex].0 <= currentCapital {
                    maxProfit.insert(availableProjects[projectIndex].1)
                    projectIndex += 1
                }

                if maxProfit.isEmpty {
                    break
                }

                currentCapital += maxProfit.remove()!
            }

            return currentCapital
        }
    }

    // MaxHeap implementation
    struct MaxHeap<Element: Comparable> {
        private var elements: [Element] = []

        var isEmpty: Bool { return elements.isEmpty }

        mutating func insert(_ element: Element) {
            elements.append(element)
            siftUp(from: elements.count - 1)
        }

        mutating func remove() -> Element? {
            guard !isEmpty else { return nil }
            elements.swapAt(0, elements.count - 1)
            let element = elements.removeLast()
            if !isEmpty {
                siftDown(from: 0)
            }
            return element
        }

        private mutating func siftUp(from index: Int) {
            var child = index
            var parent = parentIndex(of: child)
            while child > 0 && elements[child] > elements[parent] {
                elements.swapAt(child, parent)
                child = parent
                parent = parentIndex(of: child)
            }
        }

        private mutating func siftDown(from index: Int) {
            var parent = index
            while true {
                let leftChild = leftChildIndex(of: parent)
                let rightChild = rightChildIndex(of: parent)
                var candidate = parent
                if leftChild < elements.count && elements[leftChild] > elements[candidate] {
                    candidate = leftChild
                }
                if rightChild < elements.count && elements[rightChild] > elements[candidate] {
                    candidate = rightChild
                }
                if candidate == parent {
                    return
                }
                elements.swapAt(parent, candidate)
                parent = candidate
            }
        }

        private func parentIndex(of index: Int) -> Int {
            return (index - 1) / 2
        }

        private func leftChildIndex(of index: Int) -> Int {
            return 2 * index + 1
        }

        private func rightChildIndex(of index: Int) -> Int {
            return 2 * index + 2
        }
    }

    @Test func example1() {
        #expect(Solution().findMaximizedCapital(2, 0, [1, 2, 3], [0, 1, 1]) == 4)
    }

    @Test func example2() {
        #expect(Solution().findMaximizedCapital(3, 0, [1, 2, 3], [0, 1, 2]) == 6)
    }

}
