/*:
# Enumerations
---
*/
enum CompassPoint {
    case North
    case South
    case East
    case West
}

let direction = CompassPoint.North
let oppositeDirection:CompassPoint = .South

//: enumeracja z określonym typem
enum Animal: Character {
    case Cat = "🐱"
    case Dog = "🐶"
    case Bird = "🐦"
    
//: enumeracje mogą mieć funkcje i właściwości
    func printMe() {
        print(self.rawValue)
    }
}

let helloKitty = "Hello \(Animal.Cat.rawValue)"

//: enumeracja z powiązanymi wartościami
enum Shape {
    case Rectangle (width: Double, height: Double)
    case Circle (radius: Double)
}

let rectangle = Shape.Rectangle(width: 10, height: 5)
/*:
---
[⬅️⬅️](@previous) [➡️➡️](@next)
*/
