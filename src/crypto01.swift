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
// Exception types
//
enum Parameter: ErrorType {
    case Invalid
}
 
//
// Unit test for convertHexToBase64
//
func testConvertHexToBase64() -> Bool {

    let input = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
    let output = "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"
    let result = try! convertHexToBase64(input)

    return (result == output)
}

//
// Convert hexadecimal characters into a Base64 encoded string
//
// https://cryptopals.com/sets/1/challenges/1 -- Convert hex to base64
//
// The string:
// 49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d
// Should produce:
// SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t
//
func convertHexToBase64(input: String) throws -> String {

    let hex = "0123456789abcdef"
    let base64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
   
    var result = ""

    // an empty input string produces an empty Base64 string
    guard !input.isEmpty else {
        return result
    }

    // input string should have an even number of characters
    guard (input.characters.count % 2 == 0) else {
        throw Parameter.Invalid
    }

    // input string should only have hexadecimal characters
    for char in input.lowercaseString.characters {
        guard hex.characters.contains(char) else {
            throw Parameter.Invalid
        }
    }

    // extract raw bytes from input

    // for each 6-bit chunk

        // map 6-bit chunk to Base64 index table

        // add encoded character to result

    return result
}

print("Challenge 01 (Convert Hex to Base64)\t... \(testConvertHexToBase64() ? "passed" : "failed")")

