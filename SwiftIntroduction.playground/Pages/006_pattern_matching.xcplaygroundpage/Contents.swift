//: # Pattern matching

//: dla enum
import Foundation
enum Shape {
    case Rectangle (width: Double, height: Double)
    case Circle (radius: Double)
}

func getArea(shape: Shape) -> Double {
    switch shape {
    case let .Rectangle(width, height):
        return width * height
    case .Circle (let radius):
        return M_PI * radius * radius
    }
}

getArea(Shape.Rectangle(width: 5, height: 10))

//: dla optional
let optional: Int? = 42

switch optional {
case .Some(let val):
    "We have \(val)"
case .None:
    "we have none :("
}

//: dodakowe warunki
typealias httpResult = (code: Int, contents: String)
let http404 = (code: 404, contents: "Not found")
let http200 = (code: 200, contents: "OK 😇")

func validateRequest(result: httpResult) -> String {
    switch result {
    case let (code, contents) where 200..<300 ~= code:
        return "Everything is fine: \(contents)"
    case let (code, contents) where code >= 400 && code < 500:
        return "Client error: \(contents)"
//: w `switch` musimy uwzględnić wszystkie opcje
    default:
        return "Unsupported"
    }
}

validateRequest(http404)
validateRequest(http200)
