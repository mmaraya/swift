/*
 * Copyright (c) 2016 Mike Maraya <mike[dot]maraya[at]gmail[dot]com>
 * All rights reserved.
 *
 * This file is subject to the terms and conditions defined in
 * https://github.com/mmaraya/swift/blob/master/LICENSE,
 * which is part of this software package.
 *
 */

print("Hello, world!")

// Simple Values

let explicitFloat: Float = 4

let label = "The width is "
let width = 94
let widthLabel = label + String(width)
var myVariable = 42

// let widthLabel = label + width
print(widthLabel)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit"
print(appleSummary)
print(fruitSummary)

let fpCalcText = "Floating point calculation: \(explicitFloat * 1.5)"
print(fpCalcText)
let name = "Arthur Dent"
let greeting = "Hello, \(name)!"
print(greeting)

// Control Flow

//var optionalName: String? = "Ford Prefect"
var optionalName: String? = nil
var greeting2 = "Hello"
if let yourName = optionalName {
    greeting2 = "Hello, \(yourName)!"
}
print(greeting2)
