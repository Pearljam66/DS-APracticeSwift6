//
//  FindMedianFromDataScreenTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/17/24.
//

/*
 The median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value, and the median is the mean of the two middle values.
 For example, for arr = [2,3,4], the median is 3.
 For example, for arr = [2,3], the median is (2 + 3) / 2 = 2.5.
 Implement the MedianFinder class:
 MedianFinder() initializes the MedianFinder object.
 void addNum(int num) adds the integer num from the data stream to the data structure.
 double findMedian() returns the median of all elements so far. Answers within 10-5 of the actual answer will be accepted.

 Example 1:
 Input
 ["MedianFinder", "addNum", "addNum", "findMedian", "addNum", "findMedian"]
 [[], [1], [2], [], [3], []]
 Output
 [null, null, null, 1.5, null, 2.0]

 Explanation
 MedianFinder medianFinder = new MedianFinder();
 medianFinder.addNum(1);    // arr = [1]
 medianFinder.addNum(2);    // arr = [1, 2]
 medianFinder.findMedian(); // return 1.5 (i.e., (1 + 2) / 2)
 medianFinder.addNum(3);    // arr[1, 2, 3]
 medianFinder.findMedian(); // return 2.0

 Constraints:
 -105 <= num <= 105
 There will be at least one element in the data structure before calling findMedian.
 At most 5 * 104 calls will be made to addNum and findMedian.
 */

import Testing

struct FindMedianFromDataScreenTest {

    class Heap<T: Comparable> {
        var items = [T]()
        let sort: (T, T) -> Bool

        init(sort: @escaping (T, T) -> Bool) {
            self.sort = sort
        }

        var isEmpty: Bool { items.isEmpty }
        var count: Int { items.count }

        func peek() -> T? {
            items.first
        }

        func insert(_ item: T) {
            items.append(item)
            siftUp(from: items.count - 1)
        }

        func extract() -> T? {
            guard !items.isEmpty else { return nil }
            let item = items.first

            if items.count > 1 {
                items[0] = items.removeLast()
                siftDown(from: 0)
            } else {
                items.removeLast()
            }
            return item
        }

        private func siftUp(from index: Int) {
            var child = index
            var parent = parentIndex(of: child)

            while child > 0 && sort(items[child], items[parent]) {
                items.swapAt(child, parent)
                child = parent
                parent = parentIndex(of: child)
            }
        }

        private func siftDown(from index: Int) {
            var parent = index
            while true {
                let left = leftChildIndex(of: parent)
                let right = rightChildIndex(of: parent)
                var candidate = parent
                if left < items.count && sort(items[left], items[candidate]) {
                    candidate = left
                }
                if right < items.count && sort(items[right], items[candidate]) {
                    candidate = right
                }
                if candidate == parent {
                    return
                }
                items.swapAt(parent, candidate)
                parent = candidate
            }
        }

        private func parentIndex(of index: Int) -> Int {
            (index - 1) / 2
        }

        private func leftChildIndex(of index: Int) -> Int {
            2 * index + 1
        }

        private func rightChildIndex(of index: Int) -> Int {
            2 * index + 2
        }
    }

    /**
     * Your MedianFinder object will be instantiated and called as such:
     * let obj = MedianFinder()
     * obj.addNum(num)
     * let ret_2: Double = obj.findMedian()
     */

    // Initializes the MedianFinder object
    class MedianFinder {
        // Stores the larger half of the numbers.
        var minHeap = Heap<Int>(sort: <)
        // Stores the smaller half of the numbers.
        var maxHeap = Heap<Int>(sort: >)

        init() {}

        // Adds the integer num from the data stream to the data structure.
        func addNum(_ num: Int) {
            maxHeap.insert(num)

            // Balance the heap.
            if !minHeap.isEmpty && maxHeap.peek()! > minHeap.peek()! {
                let value = maxHeap.extract()!
                minHeap.insert(value)
            }

            // Ensure size balance.
            if maxHeap.count > minHeap.count + 1 {
                minHeap.insert(maxHeap.extract()!)
            } else if minHeap.count > maxHeap.count {
                maxHeap.insert(minHeap.extract()!)
            }
        }

        // Returns the median of all elements so far. Answers within 10-5 of the actual answer will be accepted.
        func findMedian() -> Double {
            if maxHeap.count == minHeap.count {
                return Double(maxHeap.peek()! + minHeap.peek()!) / 2.0
            } else {
                return Double(maxHeap.peek()!)
            }
        }
    }

    @Test func example1() {
        let medianFinder = MedianFinder()
        medianFinder.addNum(1)
        medianFinder.addNum(2)
        #expect(medianFinder.findMedian() == 1.5)
        medianFinder.addNum(3)
        #expect(medianFinder.findMedian() == 2.0)
    }

}
