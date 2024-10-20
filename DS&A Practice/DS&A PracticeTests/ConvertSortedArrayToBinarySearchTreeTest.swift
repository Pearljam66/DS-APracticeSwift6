//
//  ConvertSortedArrayToBinarySearchTreeTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/20/24.
//

/*
 Given an integer array nums where the elements are sorted in ascending order, convert it to a
 height-balanced binary search tree.

 Example 1:
 Input: nums = [-10,-3,0,5,9]
 Output: [0,-3,9,-10,null,5]
 Explanation: [0,-10,5,null,-3,null,9] is also accepted:

 Example 2:
 Input: nums = [1,3]
 Output: [3,1]
 Explanation: [1,null,3] and [3,1] are both height-balanced BSTs.

 Constraints:
 1 <= nums.length <= 104
 -104 <= nums[i] <= 104
 nums is sorted in a strictly increasing order.
 */

import Testing

struct ConvertSortedArrayToBinarySearchTreeTest {

    // Definition for a binary tree node.
    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init() { self.val = 0; self.left = nil; self.right = nil; }
        public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
        public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }
    }

    class Solution {
        func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
            // Helper function to recursively construct the BST
            func helper(_ left: Int, _ right: Int) -> TreeNode? {
                if left > right {
                    return nil
                }

                // Choose the middle element as root to ensure balance
                let mid = left + (right - left) / 2
                let root = TreeNode(nums[mid])

                // Recursively construct left and right subtree
                root.left = helper(left, mid - 1)
                root.right = helper(mid + 1, right)

                return root
            }

            // Start the recursion with the full range of the array
            return helper(0, nums.count - 1)
        }
    }

    func inorderTraversal(_ node: TreeNode?) -> [Int?] {
        guard let node = node else { return [nil] } // Representing null nodes for comparison
        return inorderTraversal(node.left) + [node.val] + inorderTraversal(node.right)
    }

    @Test func example1() {
        let nums = [-10, -3, 0, 5, 9]
        let solution = Solution()
        let root = solution.sortedArrayToBST(nums)
        let expectedTreeArray = [0,-3,9,-10, nil,5]
        let expectedArray = expectedTreeArray.compactMap { $0 }
        let resultArray = inorderTraversal(root).compactMap { $0 }

        #expect(resultArray == expectedArray.sorted())
    }


}
