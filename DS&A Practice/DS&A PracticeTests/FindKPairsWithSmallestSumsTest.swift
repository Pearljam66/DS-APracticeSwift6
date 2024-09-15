//
//  FindKPairsWithSmallestSumsTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/15/24.
//

/*
 You are given two integer arrays nums1 and nums2 sorted in non-decreasing order and an integer k.
 Define a pair (u, v) which consists of one element from the first array and one element from the second array.
 Return the k pairs (u1, v1), (u2, v2), ..., (uk, vk) with the smallest sums.

 Example 1:
 Input: nums1 = [1,7,11], nums2 = [2,4,6], k = 3
 Output: [[1,2],[1,4],[1,6]]
 Explanation: The first 3 pairs are returned from the sequence: [1,2],[1,4],[1,6],[7,2],[7,4],[11,2],[7,6],[11,4],[11,6]

 Example 2:
 Input: nums1 = [1,1,2], nums2 = [1,2,3], k = 2
 Output: [[1,1],[1,1]]
 Explanation: The first 2 pairs are returned from the sequence: [1,1],[1,1],[1,2],[2,1],[1,2],[2,2],[1,3],[1,3],[2,3]

 Constraints:
 1 <= nums1.length, nums2.length <= 105
 -109 <= nums1[i], nums2[i] <= 109
 nums1 and nums2 both are sorted in non-decreasing order.
 1 <= k <= 104
 k <= nums1.length * nums2.length
 */

import Testing

struct FindKPairsWithSmallestSumsTest {

    class Solution {
        func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
            guard !nums1.isEmpty && !nums2.isEmpty else { return [] }

            var result: [[Int]] = []
            var minHeap = MinHeap<(sum: Int, i: Int, j: Int)>() { $0.sum < $1.sum }

            // Start with the smallest sum possible (first element of each array)
            minHeap.insert((nums1[0] + nums2[0], 0, 0))

            // Use a set to keep track of indices we've already added to avoid duplicates
            var visited = Set<[Int]>()
            visited.insert([0, 0])

            while result.count < k && !minHeap.isEmpty {
                let (_, i, j) = minHeap.remove()!
                result.append([nums1[i], nums2[j]])

                // Try to add the next pair in nums1
                if i + 1 < nums1.count && !visited.contains([i + 1, j]) {
                    minHeap.insert((nums1[i + 1] + nums2[j], i + 1, j))
                    visited.insert([i + 1, j])
                }

                // Try to add the next pair in nums2
                if j + 1 < nums2.count && !visited.contains([i, j + 1]) {
                    minHeap.insert((nums1[i] + nums2[j + 1], i, j + 1))
                    visited.insert([i, j + 1])
                }
            }

            return result
        }
    }

    // MinHeap implementation
    struct MinHeap<T> {
        private var elements: [T] = []
        private let priorityFunction: (T, T) -> Bool

        init(priorityFunction: @escaping (T, T) -> Bool) {
            self.priorityFunction = priorityFunction
        }

        var isEmpty: Bool { return elements.isEmpty }

        mutating func insert(_ element: T) {
            elements.append(element)
            siftUp(from: elements.count - 1)
        }

        mutating func remove() -> T? {
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
            while child > 0 && priorityFunction(elements[child], elements[parent]) {
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
                if leftChild < elements.count && priorityFunction(elements[leftChild], elements[candidate]) {
                    candidate = leftChild
                }
                if rightChild < elements.count && priorityFunction(elements[rightChild], elements[candidate]) {
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
        let solution = Solution()
        let result = solution.kSmallestPairs([1, 7, 11], [2, 4, 6], 3)
        let expected = [[1, 2], [1, 4], [1, 6]]
        #expect(result == expected)
    }

    @Test func example2() {
        let solution = Solution()
        let nums1 = [1, 1, 2]
        let nums2 = [1, 2, 3]
        let k = 2

        let result = solution.kSmallestPairs(nums1, nums2, k)
        let expected = [[1, 1], [1, 1]]

        #expect(result == expected)
        #expect(result.count == k)
        #expect(result.allSatisfy { $0.count == 2 } == true)
    }

}
