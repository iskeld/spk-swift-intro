/*: 
# Protocols
Protokoły - mocarny odpowiednik interface'ów 😎
*/

protocol JsonSerializable {
    var prettyPrint: Bool { get set }

    func toJson() -> String
    
//: Protokoły pozwalają na określenie konstruktorów
    init(json: String)
    
//: Jak również statyczne metody (lub właściwości)
    static func isValidJson(json: String) -> Bool
}

//: ## Adoptowanie protokołu "adopting a protocol"
class Person : JsonSerializable {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        prettyPrint = true
    }
    
    var prettyPrint: Bool
    
    func toJson() -> String {
        return " { 'name': '\(name)', 'age': \(age) }"
    }
    
    required init (json: String) {
        self.name = "TODO"
        self.age = 42
        prettyPrint = false
    }
    
    class func isValidJson(json: String) -> Bool {
        return true
    }
}

//: ## Generics i użycie protokołu
func deserialize<T:JsonSerializable>(json: String) -> T {
    return T(json: json)
}

func serialize(item: JsonSerializable) -> String {
    return item.toJson()
}

//: Gdy nie chcemy korzystać z generics a mamy kilka protokołów
protocol XmlSerializable {
    func toXml() -> String
}

func serialize(item: protocol<JsonSerializable, XmlSerializable>, toJson: Bool) -> String {
    return toJson ? item.toJson() : item.toXml()
}
