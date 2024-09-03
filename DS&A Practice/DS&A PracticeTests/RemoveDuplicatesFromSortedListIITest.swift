//
//  RemoveDuplicatesFromSortedListIITest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/3/24.
//

/*
 Given the head of a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list. Return the linked list sorted as well.

 Example 1:
 Input: head = [1,2,3,3,4,4,5]
 Output: [1,2,5]

 Example 2:
 Input: head = [1,1,1,2,3]
 Output: [2,3]

 Constraints:
 The number of nodes in the list is in the range [0, 300].
 -100 <= Node.val <= 100
 The list is guaranteed to be sorted in ascending order.
 */

// TODO: FIX
class ListNode {
    var val: Int
    var next: ListNode?
    init() { self.val = 0; self.next = nil; }
    init(_ val: Int) { self.val = val; self.next = nil; }
    init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

import Testing

struct RemoveDuplicatesFromSortedListIITest {

    class Solution {
        func deleteDuplicates(_ head: ListNode?) -> ListNode? {
            // If the list is empty or has only one node, return it
            if head == nil || head?.next == nil {
                return head
            }

            // Dummy node to handle cases where the head needs to be removed
            let dummy = ListNode(0)
            dummy.next = head
            var prev: ListNode? = dummy
            var current = head

            while current != nil {
                var nextDistinct: ListNode? = current?.next

                // Check for duplicates
                while nextDistinct != nil && nextDistinct?.val == current?.val {
                    nextDistinct = nextDistinct?.next
                }

                // If current node has duplicates, skip to the next distinct node
                if nextDistinct?.val != current?.val {
                    prev?.next = current
                    prev = current
                }

                current = nextDistinct
            }

            // Terminate the list
            prev?.next = nil

            return dummy.next
        }

        func linkedListToArray(_ head: ListNode?) -> [Int] {
            var result = [Int]()
            var current: ListNode? = head
            while let node = current {
                result.append(node.val)
                current = node.next
            }
            return result
        }

        @Test func example1() {
            let solution = Solution()

            let head = ListNode(1)
            head.next = ListNode(2)
            head.next?.next = ListNode(3)
            head.next?.next?.next = ListNode(3)
            head.next?.next?.next?.next = ListNode(4)
            head.next?.next?.next?.next?.next = ListNode(4)
            head.next?.next?.next?.next?.next?.next = ListNode(5)

            // Call the method to delete duplicates
            let result = solution.deleteDuplicates(head)

            // Convert the result (which is a linked list) to an array for comparison
            let resultArray = linkedListToArray(result)

            // Expected result as an array
            let expectedArray = [1, 2, 5]

            // Compare the arrays
            #expect(resultArray == expectedArray)
        }
    }

}
