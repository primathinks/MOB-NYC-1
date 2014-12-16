// Playground - noun: a place where people can play
// Lesson 04

// Complete these, in order, writing code under each TODO statement. Each statement calls for a function to be written, write each of them and then immediately call it after the function definition.

// TODO: Write a function that prints out "Hello world!" 10 times

func helloWorld() {
    var i: Int
    for i = 0; i < 10; i++ {
        println("Hello World")
    }
}

/****** Call Function ******/
//helloWorld()

// TODO: Write a function that prints out "Hit this line {number of iterations of the loop} times!" 20 times

func hitThis() {
    var i: Int
    for i = 1; i <= 20; i++ {
        println("Hit this line \(i) times!")
    }
}

/****** Call Function ******/
//hitThis()

// TODO: Write a function that accepts a string as a parameter. Print "Hello {value of string}!"

func helloName(name: String) {
    println("Hello \(name)!")
}

/****** Call Function ******/
//helloName("Optimus Prime")

// TODO: Write a function accepts a string optional. If the string optional exists, print "Hello {value of string}!". If it doesn't, print "Hello world!"

func helloWhat(str: String?) {
    if let name = str {
        println("Hello \(name)")
    } else {
        println("Hello world")
    }
}

/****** Call Function ******/
//helloWhat(nil)

func helloTwo(nameOne: String, nameTwo: String) {
    println("Hello \(nameOne) and \(nameTwo)")
}

/****** Call Function ******/
//helloTwo("Mary", "Jane")

func formatHello(str: String) -> String {
    var newStr = str + " really?"
    return newStr
}

/****** Call Function ******/
//var msg = formatHello("woah")


// return multiple values

func lengthOfNames(nameOne: String, nameTwo: String) -> (Int, Int) {
    return (countElements(nameOne), countElements(nameTwo))
}

/****** Call Function ******/
//println(lengthOfNames("Bill", "Hillary"))

// TODO: Write a function that takes one parameter, n, and returns an integer, the nth series in the fibonacci
// sequence. The first fibonacci number is 0, the second is 1, the third is 1, the fourth is 2, fifth is 3, sixth is 5, etc. fibonacci numbers at sequence n are the sum of the n-1 and n-2 fibonacci number.


// populate array with Fib sequence
func makeFib(num: Int) -> Array<Int> {
    var fibArray: [Int] = [0, 1]
    
    for var i = 2; i < num; i++ {
        var newNum = fibArray[i-1] + fibArray[i-2]
        fibArray.append(newNum)
    }
    return fibArray
}

// return nth series in Fib sequence
func fibThis(num: Int) -> Int {
    var currArray: [Int] = makeFib(num)
    return currArray[num-1]
}

/****** Call Functions ******/
/*var n:Int = 11
println("The \(n)th series in the Fibonacci sequence is \(fibThis(n))")
*/

// TODO: Write a function that calls the above function in order to print the sum of the first 20 fibonacci numbers.

func sumFib(num: Int) -> Int {
    var currArray: [Int] = makeFib(num)
    var sumArray: Int = 0
    
    for var i = 0; i < currArray.count; i++ {
        sumArray += currArray[i]
    }
    
    return sumArray
}

/****** Call Functions ******/
/*var sum: Int = 20
println("The sum of the first \(sum) Fibonacci numbers is \(sumFib(sum))")
*/

// TODO: Write a function that takes in a number and prints out whether it is prime, composite or neither.

func isPrime(num: Int) -> Bool {
    var bool: Bool = true
    
    for var i = 2; i < num; i++ {
        if num % i == 0 {
            bool = false
        }
    }
    return bool
}

func numType(num: Int) -> String {
    var type: String
    
    if num <= 1 {
        type = "neither"
    } else if isPrime(num) {
        type = "prime"
    } else {
        type = "composite"
    }
    
    return type
}

/****** Call Functions ******/
/*var number: Int = 11
println("\(number) is a \(numType(number)) number")
*/

// TODO: Write a function that prints out each of the first 20 fibonacci numbers and whether they are prime. (e.g. 0 is not prime or composite, 1 is prime, etc)

func primeFib(num: Int) {
    var currArray: Array = makeFib(num)
    
    for var i = 0; i < currArray.count; i++ {
        var currNum = currArray[i]
        var currType = numType(currNum)
        println("\(currNum) is \(currType)")
    }
}

/****** Call Function ******/
//primeFib(20)


// TODO: Write a function that takes in two numbers, a bill amount and an optional tip percentage (represented as a float, e.g. .2 = 20% tip). Return a tuple with the total bill amount and the tip amount (if included).

func payBill(amt: Float, percentage: Float) -> (Float, Float) {
    var tip = amt * percentage
    var total = amt + tip
    return (total, tip)
}

/****** Call Function ******/
//println("The total and tip are \(payBill(40.0, 0.2))")


// TODO: Write a function that takes in a string and returns a string that is the reverse of the input. Append two strings using the + operator.

func reverseStr(str: String) -> String {
    let strArray = Array(str).reverse()
    var revStr: String = ""
    
    for char in strArray {
        revStr.append(char)
    }
    return revStr
}

/****** Call Functions ******/
/*var currStr: String = "live"
var comboStr = currStr + reverseStr(currStr)
println("Combined strings are \(comboStr)")
*/

// BONUS TODO: Write a function that takes in an array of strings and a search term string. Return a boolean indicating whether the search term string exists in the array.

func searchTerm(strArray: Array<String>, str: String) -> Bool {
    var isFound: Bool = false
    for var i = 0; i < strArray.count; i++ {
        if str == strArray[i] {
            isFound = true
        }
    }
    return isFound
}

/****** Call Function ******/
/*var currArray: [String] = ["red", "orange", "yellow", "green", "blue", "purple"]
searchTerm(currArray, "indigo")
*/

// BONUS TODO: Write a function that accepts a string and returns a boolean indicating whether a string is a palindrome (reads the same backwards or forwards).

func isPalindrome(str: String) -> Bool {
    var currBool: Bool = false
    var reversed: String = reverseStr(str)
    if str == reversed {
        currBool = true
    }
    return currBool
}

/****** Call Function ******/
/*var test = "deified"
println("Is \(test) a palindrome?\t\(isPalindrome(test))")
*/


// BONUS TODO: Write a function that takes in two strings and returns a boolean indicating whether the two strings
// What?


// BONUS TODO: Write a function that accepts two parameters, a string and a function that accepts a string and returns a string. Print the result of passing the string into the function 10 times.

func makeQuestion(str: String) -> String {
    return str + "?"
}

/****** Call Function ******/
/*func repeatStr(str: String, num: Int, funStr: (String) -> String) {
    for index in 1...num {
        println(funStr(str))
    }
}

repeatStr("dinner", 10, makeQuestion)
*/

// Named Parameters
func repeatStr2(#str: String, #num: Int, #funStr: (String) -> String) {
    for index in 1...num {
        println(funStr(str))
    }
}

repeatStr2(str: "beer", num: 12, funStr: makeQuestion)