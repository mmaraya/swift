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
// https://cryptopals.com/sets/1/challenges/1 -- Convert hex to base64
//
// The string
//
// 49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d
//
// Should produce:
//
// SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t
//

//
// Unit test for convertHexToBase64
//
func testConvertHexToBase64() -> Bool {

    let input = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
    let output = "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"
    let result = convertHexToBase64(input)

    if result == output {
        return true
    } else {
        return false
    }
}

//
// Converts the supplied sequence of hexadecimal characters into a Base64 encoded string
//
func convertHexToBase64(name: String) -> String {
    return "Construction in Progress"
}

print("Challenge 01 (Convert Hex to Base64)\t... \(testConvertHexToBase64() ? "passed" : "failed")")

