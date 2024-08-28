//
//  MinStackTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 8/28/24.
//

/*
 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
 Implement the MinStack class:
 MinStack() initializes the stack object.
 void push(int val) pushes the element val onto the stack.
 void pop() removes the element on the top of the stack.
 int top() gets the top element of the stack.
 int getMin() retrieves the minimum element in the stack.
 You must implement a solution with O(1) time complexity for each function.

 Example 1:
 Input
 ["MinStack","push","push","push","getMin","pop","top","getMin"]
 [[],[-2],[0],[-3],[],[],[],[]]
 Output
 [null,null,null,null,-3,null,0,-2]
 Explanation
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin(); // return -3
 minStack.pop();
 minStack.top();    // return 0
 minStack.getMin(); // return -2


 Constraints:
 -231 <= val <= 231 - 1
 Methods pop, top and getMin operations will always be called on non-empty stacks.
 At most 3 * 104 calls will be made to push, pop, top, and getMin.
 */

import Testing

struct MinStackTest {

    class MinStack {
        private var stack: [Int]
        private var minStack: [Int]

        init() {
            stack = []
            minStack = []
        }

        func push(_ val: Int) {
            stack.append(val)
            if minStack.isEmpty || val <= minStack.last! {
                minStack.append(val)
            }
        }

        func pop() {
            if let top = stack.last, top == minStack.last {
                minStack.removeLast()
            }
            stack.removeLast()
        }

        func top() -> Int {
            guard let top = stack.last else {
                fatalError("Stack is empty")
            }
            return top
        }

        func getMin() -> Int {
            guard let min = minStack.last else {
                fatalError("Stack is empty")
            }
            return min
        }
    }

    @Test func example1() {
        let minStack = MinStack()

        // Push -2
        minStack.push(-2)
        #expect(minStack.top() == -2)
        #expect(minStack.getMin() == -2)

        // Push 0
        minStack.push(0)
        #expect(minStack.top() == 0)
        #expect(minStack.getMin() == -2)

        // Push -3
        minStack.push(-3)
        #expect(minStack.top() == -3)
        #expect(minStack.getMin() == -3)

        // GetMin should return -3
        #expect(minStack.getMin() == -3)

        // Pop
        minStack.pop()
        #expect(minStack.top() == 0)

        // Top should return 0
        #expect(minStack.top() == 0)

        // GetMin should return -2
        #expect(minStack.getMin() == -2)
    }

}
