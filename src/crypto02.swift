/*
 * Copyright (c) 2016 Mike Maraya <mike[dot]maraya[at]gmail[dot]com>
 * All rights reserved.
 *
 * This file is subject to the terms and conditions defined in
 * https://github.com/mmaraya/swift/blob/master/LICENSE,
 * which is part of this software package.
 *
 */

//
// Return the exclusive-or for two equal-length buffers
//
func fixedXor(str1: String, str2: String) throws -> String {

    // input strings must be of equal length
    guard str1.characters.count == str2.characters.count else {
        throw Parameter.MismatchingLengths(str1: str1, len1: str1.characters.count,
                                            str2: str2, len2: str2.characters.count)
    }

    let a = try convertHexToBytes(str1)
    let b = try convertHexToBytes(str2)

    var result = ""

    for i in 0..<a.endIndex {
        result += String(a[i] ^ b[i], radix: 16)
    }

    return result
}

//
// Unit test for fixedXor
//
func testFixedXor() throws -> Bool {

    let test = (
        input1: "1c0111001f010100061a024b53535009181c",
        input2: "686974207468652062756c6c277320657965",
        output: "746865206b696420646f6e277420706c6179"
    )

    let result = try fixedXor(test.input1, str2: test.input2)
    return result == test.output 
}
