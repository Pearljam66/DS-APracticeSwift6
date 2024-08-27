//
//  SimplifyPathTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 8/27/24.
//

/*
 Given an absolute path for a Unix-style file system, which begins with a slash '/', transform this path into its simplified canonical path.
 In Unix-style file system context, a single period '.' signifies the current directory, a double period ".." denotes moving up one directory level, and multiple slashes such as "//" are interpreted as a single slash. In this problem, treat sequences of periods not covered by the previous rules (like "...") as valid names for files or directories.
 The simplified canonical path should adhere to the following rules:
 It must start with a single slash '/'.
 Directories within the path should be separated by only one slash '/'.
 It should not end with a slash '/', unless it's the root directory.
 It should exclude any single or double periods used to denote current or parent directories.
 Return the new path.

 Example 1:
 Input: path = "/home/"
 Output: "/home"
 Explanation:
 The trailing slash should be removed.

 Example 2:
 Input: path = "/home//foo/"
 Output: "/home/foo"
 Explanation:
 Multiple consecutive slashes are replaced by a single one.

 Example 3:
 Input: path = "/home/user/Documents/../Pictures"
 Output: "/home/user/Pictures"
 Explanation:
 A double period ".." refers to the directory up a level.

 Example 4:
 Input: path = "/../"
 Output: "/"
 Explanation:
 Going one level up from the root directory is not possible.

 Example 5:
 Input: path = "/.../a/../b/c/../d/./"
 Output: "/.../b/d"
 Explanation:
 "..." is a valid name for a directory in this problem.

 Constraints:
 1 <= path.length <= 3000
 path consists of English letters, digits, period '.', slash '/' or '_'.
 path is a valid absolute Unix path.
 */

import Testing

struct SimplifyPathTest {

    class Solution {

        func simplifyPath(_ path: String) -> String {
            // Split the path into components using '/' as the delimiter
            let components = path.split(separator: "/")
            var stack = [String]()

            for component in components {
                let dir = String(component)
                if dir == ".." {
                    // If we encounter '..', pop from the stack if it's not empty
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                    // If stack is empty, we do nothing since we're already at root
                } else if dir != "." && !dir.isEmpty {
                    // Push all directories except '.' and empty strings (which represent '//')
                    stack.append(dir)
                }
                // We ignore '.' and empty strings
            }

            // Join the stack back into a path string
            return "/" + stack.joined(separator: "/")
        }

    }

    @Test func example1() {
        #expect(Solution().simplifyPath("/home/") == "/home")
    }

    @Test func example2() {
        #expect(Solution().simplifyPath("/home//foo/") == "/home/foo")
    }

    @Test func example3() {
        #expect(Solution().simplifyPath("/home/user/Documents/../Pictures") == "/home/user/Pictures")
    }

    @Test func example4() {
        #expect(Solution().simplifyPath("/../") == "/")
    }

    @Test func example5() {
        #expect(Solution().simplifyPath("/.../a/../b/c/../d/./") == "/.../b/d")
    }

}
