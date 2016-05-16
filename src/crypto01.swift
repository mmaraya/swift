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
let base64 = [Character]("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".characters)

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
func convertHexToBytes(input: String) throws -> [Int] {

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
    var result = [Int](count: input.characters.count / 2, repeatedValue: 0)
    var index = input.startIndex
    for i in 1...(input.characters.count / 2) {
        let str = String(input[index]) + String(input[index.successor()])
        if let digit = Int(str, radix: 16) {
            result[i-1] = digit
        } else {
            throw Parameter.InvalidHexString(str: str)
        }
        index = index.successor().successor()
    }

    return result
}

//
// Convert array of bytes to Base64
//
func convertBytesToBase64(bytes: [Int]) -> String {

    var result = ""

    if bytes.count == 1 {
        result += String(base64[bytes[0] >> 2])
        result += String(base64[(bytes[0] & 0x03) << 4])
        result += "=="
    }

    if bytes.count == 2 {
        result += String(base64[bytes[0] >> 2])
        result += String(base64[((bytes[0] & 0x03) << 4) | (bytes[1] >> 4)])
        result += String(base64[(bytes[1] & 0x0F) << 2])
        result += "="
    }

    if bytes.count == 3 {
        result += String(base64[bytes[0] >> 2])
        result += String(base64[((bytes[0] & 0x03) << 4) | (bytes[1] >> 4)])
        result += String(base64[((bytes[1] & 0x0F) << 2) | ((bytes[2] & 0xC0) >> 6)])
        result += String(base64[bytes[2] & 0x3F])
    }

    if bytes.count > 3 {
        result = convertBytesToBase64(Array(bytes[0...2])) + convertBytesToBase64(Array(bytes[3..<bytes.endIndex]))
    }

    return result
}

//
// Convert hexadecimal characters into a Base64 encoded string
//
// https://cryptopals.com/sets/1/challenges/1 -- Convert hex to base64
//
func convertHexToBase64(input: String) throws -> String {

    // an empty input string produces an empty Base64 string
    guard !input.isEmpty else {
        return ""
    }

    // convert input string to byte array
    let bytes = try convertHexToBytes(input)

    // convert byte arry to Base64
    return convertBytesToBase64(bytes)
}

//
// Unit test for convertHexToBase64
//
func testConvertHexToBase64() throws -> Bool {

    let tests: [String: String] = [
        "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d":
            "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t",
        "4d616e": "TWFu",
        "4d61": "TWE=",
        "4d": "TQ==",
        "": "",
    ]

    var retval = true
    for (input, output) in tests {
        let result = try convertHexToBase64(input)
        print("expected\t\(output)\noutput\t\t\(result)")
        if result != output {
            retval = false
        }
    }

    return retval
}
