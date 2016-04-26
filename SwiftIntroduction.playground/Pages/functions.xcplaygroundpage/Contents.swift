/*:
# Functions
_(... & functional techniques)_
---
*/
let array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
//: Kilka sposobów zapisu lambd
//let even01 = array.filter({ (element: Int) -> Bool in return element % 2 == 0 })
//let even02 = array.filter({ element in return element % 2 == 0 })
//let even03 = array.filter({ return $0 % 2 == 0 })
//let even04 = array.filter({ $0 % 2 == 0 })
//even01
//even02
//even03
//even04
//: Gdy Lambda jest ostatnim parametrem, możemy pominąć nawiasy
//let even05 = array.filter { $0 % 2 == 0 }
//even05

/*:
---
**Method chaining**
*/
//let evenSum = array.filter{ $0 % 2 == 0}.reduce(0, combine: +)
//evenSum

/*:
---
Currying
*/
//enum Wrapper { case Json, XML }
//
//func wrapIn(type: Wrapper) -> (String) -> String {
//    return { (item:String) -> String in
//        switch type {
//        case .Json: return "{ 'item': \(item) }"
//        case .XML: return "<item>\(item)</item>"
//        }
//        
//    }
//}

//let wrapInXml = wrapIn(Wrapper.XML)
//wrapInXml("TEST")
/*:
 ---
 Metody klas jako obiekty
 */
class Foobar {
    func square(a: Int) -> Int {
        return a * a
    }
}

let square_detached = Foobar.square
square_detached(Foobar())(4)
/*:
 ---
 [⬅️⬅️](@previous) [➡️➡️](@next)
 */
