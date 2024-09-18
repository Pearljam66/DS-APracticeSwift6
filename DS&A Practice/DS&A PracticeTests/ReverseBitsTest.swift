//
//  ReverseBitsTest.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 9/18/24.
//

/*
 Reverse bits of a given 32 bits unsigned integer.

 Note:
 Note that in some languages, such as Java, there is no unsigned integer type. In this case, both input and output will be given as a signed integer type. They should not affect your implementation, as the integer's internal binary representation is the same, whether it is signed or unsigned.
 In Java, the compiler represents the signed integers using 2's complement notation. Therefore, in Example 2 above, the input represents the signed integer -3 and the output represents the signed integer -1073741825.

 Example 1:
 Input: n = 00000010100101000001111010011100
 Output:    964176192 (00111001011110000010100101000000)
 Explanation: The input binary string 00000010100101000001111010011100 represents the unsigned integer 43261596, so return 964176192 which its binary representation is 00111001011110000010100101000000.

 Example 2:
 Input: n = 11111111111111111111111111111101
 Output:   3221225471 (10111111111111111111111111111111)
 Explanation: The input binary string 11111111111111111111111111111101 represents the unsigned integer 4294967293, so return 3221225471 which its binary representation is 10111111111111111111111111111111.

 Constraints:
 The input must be a binary string of length 32
 */

import Testing

struct ReverseBitsTest {

    class Solution {
        func reverseBits(_ n: Int) -> Int {
            var result = 0
            var n = n

            for _ in 0..<32 {
                result = (result << 1) | (n & 1)
                n = n >> 1
            }

            return result
        }
    }

    @Test func example1() {
        #expect(Solution().reverseBits(0b00000010100101000001111010011100) == 964176192)
    }

    @Test func example2() {
        #expect(Solution().reverseBits(0b11111111111111111111111111111101) == 3221225471)
    }
}
