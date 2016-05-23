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
// Find the single-byte XOR cipher and decrypt message 
//
func findAndDecrypt(str: String) throws -> String {

    let frequent = [Character]("ETAOINSHRDLU".characters)
    let a = try convertHexToBytes(str)

    // try all possible values for the cipher and count letter frequency
    for i in 0..<255 {
    }    
    return ""
}

//
// Unit test for fixedXor
//
func testFindAndDecrypt() throws -> Bool {
    let ciphertext = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736" 
    let plaintext = "unknown" 
    let result = try findAndDecrypt(ciphertext)
    return result == plaintext
}
