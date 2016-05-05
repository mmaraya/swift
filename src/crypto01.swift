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
// Constants used throughout this file
//
let hex = "0123456789abcdef"
let base64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

//
// Exception types
//
enum Parameter: ErrorType {
    case InvalidHexCharacterCount
    case InvalidHexCharacter(char: Character)
    case InvalidHexString(str: String)
}
 
//
// Convert hexadecimal string into an array of bytes
//
func convertHexToBytes(input: String) throws -> [UInt8] {

    // input string should have an even number of characters
    guard (input.characters.count % 2 == 0) else {
        throw Parameter.InvalidHexCharacterCount
    }

    // input string should only have hexadecimal characters
    for char in input.lowercaseString.characters {
        guard hex.characters.contains(char) else {
            throw Parameter.InvalidHexCharacter(char: char)
        }
    }

    // extract raw bytes from input
    var bytes = [UInt8](count: input.characters.count / 2, repeatedValue: 0)
    var index = input.startIndex
    for i in 1...(input.characters.count / 2) {
        var str = String(input[index]) + String(input[index.successor()])
        if let digit = UInt8(str, radix: 16) {
            bytes[i-1] = digit
        } else {
            throw Parameter.InvalidHexString(str: str)
        }
        index = index.successor().successor()
    }

    print (bytes)
    return bytes
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

    // an empty input string produces an empty Base64 string
    guard !input.isEmpty else {
        return ""
    }

    let bytes = try? convertHexToBytes(input)

    var result = ""

    // for each 6-bit chunk

        // map 6-bit chunk to Base64 index table

        // add encoded character to result

    return result
}

//
// Unit test for convertHexToBase64
//
func testConvertHexToBase64() -> Bool {

    let input = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
    let output = "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"

    // for this unit test, the input is valid so we don't have to catch the exception
    let result = try! convertHexToBase64(input)

    return (result == output)
}

print("Challenge 01 (Convert Hex to Base64)\t... \(testConvertHexToBase64() ? "passed" : "failed")")

