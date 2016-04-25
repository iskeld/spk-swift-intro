/*: 
# Tuples
---
*/
let krotka = (42, "answer")
krotka.0
krotka.1

//: Zwracanie parametrów z funkcji
import Foundation
func makeRequest(url: String)
    -> (statusCode: Int, contents: String) {
        
    return arc4random() % 2 == 0
        ? (400, "not found")
        : (statusCode: 200,
           contents: "Here is your kitten 🐱")
}

//: bezpośrednie przypisanie elementów według kolejności
let (status, result) = makeRequest("http://kittens.org")
status
result

//: ... lub po nazwach (zalecane)
let response = makeRequest("http://kittens.org")
response.statusCode
response.contents
/*:
---
[⬅️⬅️](@previous) [➡️➡️](@next)
*/
