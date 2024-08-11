//
//  ReverseLinkedListIITest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 8/11/24.
//

/*
 Topics
 Companies
 Given the head of a singly linked list and two integers left and right where left <= right, reverse the nodes of the list from position left to position right, and return the reversed list.

 Example 1:
 Input: head = [1,2,3,4,5], left = 2, right = 4
 Output: [1,4,3,2,5]

 Example 2:
 Input: head = [5], left = 1, right = 1
 Output: [5]

 Constraints:
 The number of nodes in the list is n.
 1 <= n <= 500
 -500 <= Node.val <= 500
 1 <= left <= right <= n
 */

import Testing

struct ReverseLinkedListIITest {

    class ListNode {
        var val: Int
        var next: ListNode?

        init() {
            self.val = 0
            self.next = nil
        }

        init(_ val: Int) {
            self.val = val
            self.next = nil
        }

        init(_ val: Int, _ next: ListNode?)
        {
            self.val = val
            self.next = next
        }
    }

    class Solution {
        func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
            // If the list is empty or left equals right, no reversal needed
            guard head != nil, left < right else { return head }

            let dummy = ListNode(0)
            dummy.next = head
            var prev: ListNode? = dummy

            // Move prev to the node just before the left position
            for _ in 0..<left-1 {
                prev = prev?.next
            }

            // Start is the first node to be reversed
            guard let start = prev?.next else { return head }
            var then = start.next

            // Reverse the sublist from left to right
            for _ in 0..<right-left {
                start.next = then?.next
                then?.next = prev?.next
                prev?.next = then
                then = start.next
            }

            return dummy.next
        }
    }

    func linkedListToArray(_ head: ListNode?) -> [Int] {
        var array = [Int]()
        var current = head
        while current != nil {
            array.append(current!.val)
            current = current?.next
        }
        return array
    }

    @Test func example1() {
        let head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
        let left = 2
        let right = 4

        let expected = ListNode(1, ListNode(4, ListNode(3, ListNode(2, ListNode(5)))))
        let result = Solution().reverseBetween(head, left, right)

        #expect(linkedListToArray(result) == linkedListToArray(expected))
    }

    @Test func example2() {
        let head = ListNode(5)
        let left = 1
        let right = 1

        let expected = ListNode(5)
        let result = Solution().reverseBetween(head, left, right)

        #expect(linkedListToArray(result) == linkedListToArray(expected))
    }

}
