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
} else {
    greeting2 = "Hello, no name!"
}
print(greeting2)

let vegetable = "celery"
switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log")
    case "cucumber","watercress":
        print("That would make a good tea sandwich")
    case let x where x.hasSuffix("pepper"):
        print("Is it a spicy \(x)?")
    default:
        print("Everything tastes good in soup")
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var largestType = "Unknown"
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largestType = kind 
        }
    }
}
print("The largest number is a \(largestType) with a value of \(largest)")

// Functions and Closures

func greet(name: String, special: String) -> String {
    return "Hello \(name), today's special is \(special)."
}

print(greet("Bob", special:"meatballs"))

// Experiment: write a function that calculates the average of its arguments

func average(numbers: Int...) -> Float {
    var sum: Float = 0
    for number in numbers {
        sum += Float(number)
    }
    return (sum / Float(numbers.count))
}

print("The average of 1,3,5, and 9 is \(average(1,3,5,9))")

// Rewrite the closure to return zero for all odd numbers.

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        print(item)
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number.map() < 10
}

var numbers = [20, 19, 7, 12]

numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

print("Values: \(numbers), matches: \(hasAnyMatches(numbers, condition: lessThanTen))")
