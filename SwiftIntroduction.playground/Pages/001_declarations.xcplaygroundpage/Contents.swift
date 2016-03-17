/*: 
#### Deklaracje
* Funkcje
* Stałe
* Zmienne
*/

func fibonacci(index: Int) -> Int {
    var fib0 = 0, fib1 = 1
    
    for _ in 0 ..< index {
        let tempSum = fib0 + fib1
        fib0 = fib1
        fib1 = tempSum
    }
    
    return fib0
}

fibonacci(0)
fibonacci(5)
fibonacci(20)

//: #### Tablice
let numbers = [3, 4, 5, 6, 7, 8]
numbers

//: ### Słowniki
var emojiDict: [String:String] = ["cat": "🐱", "dog": "🐶"]
emojiDict["bird"] = "🐦"
