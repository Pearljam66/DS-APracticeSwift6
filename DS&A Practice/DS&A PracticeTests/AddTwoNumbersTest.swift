//
//  AddTwoNumbersTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 8/8/24.
//

/*
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 Example 1:
 Input: l1 = [2,4,3], l2 = [5,6,4]
 Output: [7,0,8]
 Explanation: 342 + 465 = 807.

 Example 2:
 Input: l1 = [0], l2 = [0]
 Output: [0]

 Example 3:
 Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 Output: [8,9,9,9,0,0,0,1]

 Constraints:

 The number of nodes in each linked list is in the range [1, 100].
 0 <= Node.val <= 9
 It is guaranteed that the list represents a number that does not have leading zeros.
 */

import Testing

struct AddTwoNumbersTest {

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
        func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            let dummyHead = ListNode(0)
            var p = l1, q = l2, current = dummyHead
            var carry = 0

            while p != nil || q != nil {
                let x = p?.val ?? 0
                let y = q?.val ?? 0
                let sum = carry + x + y
                carry = sum / 10
                current.next = ListNode(sum % 10)
                current = current.next!
                if p != nil { p = p?.next }
                if q != nil { q = q?.next }
            }

            if carry > 0 {
                current.next = ListNode(carry)
            }

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

    @Test func testExample1() {
        let solution = Solution()
        let l1 = ListNode(2, ListNode(4, ListNode(3)))
        let l2 = ListNode(5, ListNode(6, ListNode(4)))
        let result = solution.addTwoNumbers(l1, l2)

        #expect(linkedListToArray(result) == [7, 0, 8])
    }

    @Test func testExample2() {
        let solution = Solution()
        let l1 = ListNode(0)
        let l2 = ListNode(0)
        let result = solution.addTwoNumbers(l1, l2)

        #expect(linkedListToArray(result) == [0])
    }

    @Test func testExample3() {
        let solution = Solution()
        let l1 = ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9)))))))
        let l2 = ListNode(9, ListNode(9, ListNode(9, ListNode(9))))
        let result = solution.addTwoNumbers(l1, l2)

        #expect(linkedListToArray(result) == [8, 9, 9, 9, 0, 0, 0, 1])
    }

}
