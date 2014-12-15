// Lesson 03 playground

import Foundation

// TODO: Create two variables, name and age. Name is a string, age is an integer.

var name: String = "Prima"
var age: Int = 36

// TODO: Print "Hello {whatever the value of name is}, you are {whatever the value of age is} years old!"

println("Hello \(name), you are \(age) years old!")

// TODO: Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”

if age >= 21 {
    println("You can drink!")
} else if age > 18 {
    println("You can vote!")
} else if age >= 16 {
    println("You can drive")
} else {
    println("You can't do shit")
}

// TODO: Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.

if age > 16 && age < 18 {
    println("You can drive and vote")
}

if age >= 21 {
    println("You can drive, vote and drink (but not at the same time!)")
}

// TODO: Print the first fifty multiples of seven minus one (e.g. the first three multiples are 7, 14, 21. The first three multiples minus one are 6, 13, 20)

for i in 1 ... 50 {
    println(i * 7 - 1)
}
// TODO: Create a constant called number

let number = 314

// TODO: Print whether the above number is even
println(number % 2 == 0)

// TODO: The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number. Print the 37th fibonacci number below

var num1 = 0
var num2 = 1
var temp = 0

for var i = 0; i < 36; ++i {
    println(num1 + num2)
    temp = num1
    num1 = num2
    num2 = temp + num2
}

// TODO: Print out "Hello {whatever the value of name is}, your name is {however long the string name is} characters long!. Use countElements()

println("Hello \(name), your name is \(countElements(name)) characters long!")

// TODO: Print the sum of one hundred random numbers. Use rand() to generate random numbers.

var numArray = [Int32]()

for i in 1 ... 100 {
    numArray.append(rand())
}

var x: Int32 = 0

for num in numArray {
    x += num
    println(x)
}



