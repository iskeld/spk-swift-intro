/*: 
### Optionals - ujarzmianie nulli
* Wartość `nil` może ona być użyta tylko w określnych warunkach
* Oznaczamy dodając `?` do typu
*/

func greet(name: String) -> String? {
    if name == "" {
        return nil
    }
    return "Hello, \(name)!"
}

func changeCaseAndWrap(value: String) -> String {
    let uppercase = value.uppercaseString
    return "__\(uppercase)__"
}

let daveGreeting: String? = greet("Dave") // :String? nie jest wymagane
let nilGreeting = greet("")

//: nie zadziała ☹️
// printUppercase(daveGreeing)

//: **opcja 1**: _"forced unwrapping"_ 😤 poprzez dodanie "`!`"
//changeCaseAndWrap(daveGreeting!)
//: _prepare for unforeseen consequences_
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
#### Operatory przydatne do obsługi `nil`
* `.?` optional chaining
* `??` nil coalescing
*/

func changeCaseAndWrap_v3(value: String?) -> String {
    return value?.uppercaseString ??  "NILA DOSTAŁEM 🙈!"
}

changeCaseAndWrap_v2(daveGreeting)
changeCaseAndWrap_v2(nilGreeting)

func makeHttpRequest(url: String) -> (statusCode:Int, result:String) {
    return (400, "bad")
}

class Macz {
    func doJob(a: Int) -> Int {
        return a * a
    }
}

let fap = Macz.doJob
fap(Macz())(4)
