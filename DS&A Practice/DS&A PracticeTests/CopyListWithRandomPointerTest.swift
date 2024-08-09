//
//  CopyListWithRandomPointerTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 8/9/24.
//

/*
 A linked list of length n is given such that each node contains an additional random pointer, which could point to any node in the list, or null.
 Construct a deep copy of the list. The deep copy should consist of exactly n brand new nodes, where each new node has its value set to the value of its corresponding original node. Both the next and random pointer of the new nodes should point to new nodes in the copied list such that the pointers in the original list and copied list represent the same list state. None of the pointers in the new list should point to nodes in the original list.
 For example, if there are two nodes X and Y in the original list, where X.random --> Y, then for the corresponding two nodes x and y in the copied list, x.random --> y.
 Return the head of the copied linked list.
 The linked list is represented in the input/output as a list of n nodes. Each node is represented as a pair of [val, random_index] where:
 val: an integer representing Node.val
 random_index: the index of the node (range from 0 to n-1) that the random pointer points to, or null if it does not point to any node.
 Your code will only be given the head of the original linked list.

 Example 1:
 Input: head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
 Output: [[7,null],[13,0],[11,4],[10,2],[1,0]]

 Example 2:
 Input: head = [[1,1],[2,1]]
 Output: [[1,1],[2,1]]

 Example 3:
 Input: head = [[3,null],[3,0],[3,null]]
 Output: [[3,null],[3,0],[3,null]]

 Constraints:

 0 <= n <= 1000
 -104 <= Node.val <= 104
 Node.random is null or is pointing to some node in the linked list.
 */

import Testing

struct CopyListWithRandomPointerTest {

    class Node {
        var val: Int
        var next: Node?
        var random: Node?

        init(_ val: Int) {
            self.val = val
            self.next = nil
            self.random = nil
        }
    }

    class Solution {
        func copyRandomList(_ head: Node?) -> Node? {
            guard head != nil else { return nil }

            // Step 1: Create a copy of each node and insert it after the original node
            var curr = head
            while curr != nil {
                let copy = Node(curr!.val)
                copy.next = curr!.next
                curr!.next = copy
                curr = copy.next
            }

            // Step 2: Assign random pointers for the copy nodes
            curr = head
            while curr != nil {
                if curr!.random != nil {
                    curr!.next!.random = curr!.random!.next
                }
                curr = curr!.next!.next
            }

            // Step 3: Separate the original list from the copied list
            let dummy = Node(0)
            var copy: Node? = dummy
            curr = head
            while curr != nil {
                copy!.next = curr!.next
                curr!.next = curr!.next!.next
                copy = copy!.next
                curr = curr!.next
            }

            return dummy.next
        }
    }

        @Test func example1() {
            let solution = Solution()
            let node1 = Node(7)
            let node2 = Node(13)
            let node3 = Node(11)
            let node4 = Node(10)
            let node5 = Node(1)

            node1.next = node2
            node2.next = node3
            node3.next = node4
            node4.next = node5

            node2.random = node1
            node3.random = node5
            node4.random = node3
            node5.random = node1

            let result = solution.copyRandomList(node1)

            // Verify the structure and values of the copied list
            #expect(result?.val == 7)
            #expect(result?.next?.val == 13)
            #expect(result?.next?.next?.val == 11)
            #expect(result?.next?.next?.next?.val == 10)
            #expect(result?.next?.next?.next?.next?.val == 1)

            #expect(result?.random == nil)
            #expect(result?.next?.random === result)
            #expect(result?.next?.next?.random === result?.next?.next?.next?.next)
            #expect(result?.next?.next?.next?.random === result?.next?.next)
            #expect(result?.next?.next?.next?.next?.random === result)

            // Ensure the copied list is separate from the original
            #expect(result !== node1)
            #expect(result?.next !== node2)
            #expect(result?.next?.next !== node3)
            #expect(result?.next?.next?.next !== node4)
            #expect(result?.next?.next?.next?.next !== node5)
        }

        @Test func example2() {
            let solution = Solution()
            let node1 = Node(1)
            let node2 = Node(2)

            node1.next = node2
            node1.random = node2
            node2.random = node2

            let result = solution.copyRandomList(node1)

            #expect(result?.val == 1)
            #expect(result?.next?.val == 2)
            #expect(result?.random === result?.next)
            #expect(result?.next?.random === result?.next)

            // Ensure the copied list is separate from the original
            #expect(result !== node1)
            #expect(result?.next !== node2)
        }

        @Test func example3() {
            let solution = Solution()
            let node1 = Node(3)
            let node2 = Node(3)
            let node3 = Node(3)

            node1.next = node2
            node2.next = node3
            node2.random = node1

            let result = solution.copyRandomList(node1)

            #expect(result?.val == 3)
            #expect(result?.next?.val == 3)
            #expect(result?.next?.next?.val == 3)
            #expect(result?.random == nil)
            #expect(result?.next?.random === result)
            #expect(result?.next?.next?.random == nil)

            // Ensure the copied list is separate from the original
            #expect(result !== node1)
            #expect(result?.next !== node2)
            #expect(result?.next?.next !== node3)
        }

        @Test func testEmptyList() {
            let solution = Solution()
            let result = solution.copyRandomList(nil)
            #expect(result == nil)
        }
}
