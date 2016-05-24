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

    // count letter frequency
    var freq = [Character: Int]()
    for i in 0..<a.count {
        let char = Character(UnicodeScalar(a[i]))
        if let count = freq[char] {
            freq[char] = count + 1
        } else {
            freq[char] = 1
        }
    }

    print ("Frequency counts: \(freq)")

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
