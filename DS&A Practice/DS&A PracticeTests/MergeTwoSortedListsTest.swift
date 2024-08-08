//
//  MergeTwoSortedListsTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 8/8/24.
//

/*
 You are given the heads of two sorted linked lists list1 and list2.
 Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.
 Return the head of the merged linked list.

 Example 1:
 Input: list1 = [1,2,4], list2 = [1,3,4]
 Output: [1,1,2,3,4,4]

 Example 2:
 Input: list1 = [], list2 = []
 Output: []

 Example 3:
 Input: list1 = [], list2 = [0]
 Output: [0]
 */

import Testing

struct MergeTwoSortedListsTest {

    class ListNode {
        var val: Int
        var next: ListNode?
        init() { self.val = 0; self.next = nil; }
        init(_ val: Int) { self.val = val; self.next = nil; }
        init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }

    class Solution {

        func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
            let dummyHead = ListNode(0) // Dummy node to simplify the merge process
            var current = dummyHead
            var l1 = list1
            var l2 = list2

            // Traverse both lists and append the smaller node to the merged list
            while l1 != nil && l2 != nil {
                if l1!.val <= l2!.val {
                    current.next = l1
                    l1 = l1?.next
                } else {
                    current.next = l2
                    l2 = l2?.next
                }
                current = current.next!
            }

            // If any nodes are left in either list, append them
            current.next = l1 ?? l2

            // Return the head of the merged list
            return dummyHead.next
        }
    }

    // Convert result linked list to array for easy comparison
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
        let list1 = ListNode(1, ListNode(2, ListNode(4)))
        let list2 = ListNode(1, ListNode(3, ListNode(4)))

        let result = solution.mergeTwoLists(list1, list2)

        #expect(linkedListToArray(result) == [1,1,2,3,4,4])
    }

    @Test func example2() {
        let solution = Solution()
        let list1 = ListNode()
        let list2 = ListNode()

        let result = solution.mergeTwoLists(list1, list2)

        #expect(linkedListToArray(result) == [0,0])
    }

    @Test func example3() {
        let solution = Solution()
        let list1 = ListNode(1)
        let list2 = ListNode(2)

        let result = solution.mergeTwoLists(list1, list2)

        #expect(linkedListToArray(result) == [1,2])
    }

}
