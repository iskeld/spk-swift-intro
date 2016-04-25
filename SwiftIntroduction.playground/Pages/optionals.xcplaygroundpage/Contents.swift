/*: 
# Optionals 
_(... czyli jak radzić sobie z nullami)_
---
* Wartość `nil` może ona być użyta tylko w określonych warunkach
* Oznaczamy dodając `?` do typu
*/
func greet(name: String) -> String? {
    if name == "" {
        return nil
    }
    return "Hello, \(name)!"
}

let daveGreeting: String? = greet("Dave") // :String? nie jest wymagane
let nilGreeting = greet("")

//: próba użycia
func changeCaseAndWrap(value: String) -> String {
    return "__\(value.uppercaseString)__"
}

//changeCaseAndWrap(daveGreeting)
//: **opcja 1**: _"forced unwrapping"_ 😤 poprzez dodanie "`!`"
//changeCaseAndWrap(daveGreeting!)
//changeCaseAndWrap(nilGreeting!)
//: **opcja 2**: klauzula `if let` - bezpieczniejsza
if let greeting = daveGreeting {
    changeCaseAndWrap(greeting)
} else {
    "NIL"
}

if let greeting = nilGreeting {
    changeCaseAndWrap(greeting)
} else {
    "NIL"
}

//: **opcja 3**: klauzula `guard` - odwrócone `if`
func changeCaseAndWrap_v2(value: String?) -> String {
    guard let safeValue = value else {
        return "NILA DOSTAŁEM 🙈!"
    }
    let uppercase = safeValue.uppercaseString
    return "__\(uppercase)__"
}

changeCaseAndWrap_v2(daveGreeting)
changeCaseAndWrap_v2(nilGreeting)


/*: 
 ---
#### Operatory przydatne do obsługi `nil`
* `?.` optional chaining
* `??` nil coalescing
*/

func changeCaseAndWrap_v3(value: String?) -> String {
    return value?.uppercaseString ??  "NILA DOSTAŁEM 🙈!"
}

changeCaseAndWrap_v3(daveGreeting)
changeCaseAndWrap_v3(nilGreeting)
/*:
---
[⬅️⬅️](@previous) [➡️➡️](@next)
*/
