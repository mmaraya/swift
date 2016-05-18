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
func fixedXor(input1: String, input2: String) -> String {
    return ""
}

//
// Unit test for fixedXor
//
func testFixedXor() -> Bool {

    let test = (
        input1: "1c0111001f010100061a024b53535009181c",
        input2: "686974207468652062756c6c277320657965",
        output: "746865206b696420646f6e277420706c6179"
    )

    let result = fixedXor(test.input1, input2: test.input2)
    return result == test.output 
}
