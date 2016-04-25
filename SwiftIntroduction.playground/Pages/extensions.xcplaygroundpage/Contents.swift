/*:
# Extensions
---
Dzięki nim możemy rozszerzać istniejące typy o nowe:
* wyliczone właściwości (computed properties) (+ statyczne)
* metody (+ statyczne)
* konstruktory
* indeksery ([])

Możemy również: 
* adopotwać protokoły dla istniejących typów
* rozszerzać protokoły dostaraczając domyślnej imlementacji
---
**Rozszerzenie typu wbudowanego (generycznego) o nową metodę:**
*/
extension Array {
    func firstTwo() -> (Element?, Element?) {
        switch count {
        case 0: return (nil, nil)
        case 1: return (self[0], nil)
        default: return (self[0], self[1])
        }
    }
}
// ["du", "hast", "mich"].firstTwo()
//: **Rozszerzenie typu o nowy konstruktor**
import Foundation

struct Point { let x: Int, y: Int }

extension Point {
    init(string: String) {
        let segments = string.componentsSeparatedByString(",")
        x = Int(segments[0])!
        y = Int(segments[1])!
    }
}
//let point = Point(string: "800,42")
//point.x
//point.y
//: **Adpotowanie protokołu za pomocą rozszerzeń**
protocol JsonSerializable {
    func toJson() -> String
}

extension Point : JsonSerializable {
    func toJson() -> String {
        return "{ 'x': \(x), 'y': \(y) }"
    }
}

func serialize(item: JsonSerializable) {
    print("Serialized: \(item.toJson())")
}

//serialize(Point(string: "8,13"))
//: **Rozszerzenie protokołu o nową metodę z domyślną implementacją**
extension JsonSerializable {
    func toBson() -> [Int] {
        return [0, 0]
    }
}

struct User : JsonSerializable {
    let name: String
    
    func toJson() -> String {
        return "{ 'name': '\(name)'}"
    }
    
    func toBson() -> [Int] {
        return [1, 2, 3, 4, 5]
    }
}

//let point01 = Point(string: "800,500")
//let user01 = User(name: "Isaac Clarke")
//point01.toBson()
//user01.toBson()
/*:
 ---
 [⬅️⬅️](@previous) [➡️➡️](@next)
 */
