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

    var result = ""
    let bytes = try convertHexToBytes(str)

    // count integer frequency
    var freq = [Int: Int]()
    for i in 0..<bytes.count {
        if let count = freq[bytes[i]] {
            freq[bytes[i]] = count + 1
        } else {
            freq[bytes[i]] = 1
        }
    }

    // sort by descending frequency
    for (k,v) in (Array(freq).sort {$0.1 > $1.1}) {
        // try the most frequent letters in English
        let frequent = "ETAOINSHRDLU"
        for f in frequent.utf8 {
            // derive a candidate cipher 
            let cipher = UInt8(k) ^ f
            // apply cipher to ciphertext
            for b in bytes {
                result.append(Character(UnicodeScalar(UInt8(b) ^ cipher)))
            }
            print("\(result)")
            result = ""
        }
    }

    return result
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
