//
//  ReverseNodesInKGroupTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 8/11/24.
//

// TODO: Fix

/*
 Given the head of a linked list, reverse the nodes of the list k at a time, and return the modified list.
 k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes, in the end, should remain as it is.
 You may not alter the values in the list's nodes, only nodes themselves may be changed.

 Example 1:
 Input: head = [1,2,3,4,5], k = 2
 Output: [2,1,4,3,5]

 Example 2:
 Input: head = [1,2,3,4,5], k = 3
 Output: [3,2,1,4,5]

 Constraints:

 The number of nodes in the list is n.
 1 <= k <= n <= 5000
 0 <= Node.val <= 1000
 */

import Testing

struct ReverseNodesInKGroupTest {

    class ListNode {
        let val: Int
        var next: ListNode?

        init() {
            self.val = 0
            self.next = nil
        }

        init(_ val: Int) {
            self.val = val
            self.next = nil
        }

        init (_ val: Int, _ next: ListNode?) {
            self.val = val
            self.next = next
        }
    }

    class Solution {
        func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
            // If k is 1, no reversal needed
            guard k > 1, let head = head else { return head }

            let dummy = ListNode(0)
            dummy.next = head
            var prev: ListNode? = dummy

            while true {
                let kth = getKth(prev, k)

                // If there are fewer than k nodes left, we're done
                guard let kthNode = kth else { break }

                let nextGroup = kthNode.next

                // Reverse the group
                var curr = prev?.next
                var nxt: ListNode? = nil
                for _ in 0..<k {
                    nxt = curr?.next
                    curr?.next = nxt?.next
                    nxt?.next = prev?.next
                    prev?.next = nxt
                }

                prev = curr
                prev?.next = nextGroup
            }

            return dummy.next
        }

        private func getKth(_ curr: ListNode?, _ k: Int) -> ListNode? {
            var curr = curr
            for _ in 0..<k {
                curr = curr?.next
                if curr == nil {
                    return nil
                }
            }
            return curr
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
        let solution = Solution()
        let head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
        let k = 2

        let expected = ListNode(2, ListNode(1, ListNode(4, ListNode(3, ListNode(5)))))
        let result = solution.reverseKGroup(head, k)

        #expect(linkedListToArray(result) == linkedListToArray(expected))
    }

    @Test func example2() {
        let solution = Solution()
        let head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
        let k = 3

        let expected = ListNode(3, ListNode(2, ListNode(1, ListNode(4, ListNode(5)))))
        let result = solution.reverseKGroup(head, k)

        #expect(linkedListToArray(result) == linkedListToArray(expected))
    }

}
