/*: 
# Structs & Classes
---
* struktury - typy wartościowe (value types)
* klasy - typy referencyjne (reference types)
---
## Struktury
*/
struct Resolution {
    //: stored properties
    let width: Int
    let height: Int
    
    //: computed properties
    var display: String {
        return "\(width) x \(height)"
    }
}

//: W strukturach dostajemy gratis konstruktor do inicjalizowania wszystkich właściwości
let res:Resolution = Resolution(width: 1920, height: 1280)
res.display

/*:
---
## Klasy
*/
class Display {
    let nativeResolution: Resolution
    private (set) var currentResolution: Resolution
    
    init(nativeResolution: Resolution) {
        self.nativeResolution = nativeResolution
        self.currentResolution = nativeResolution
    }
    
//: Dodatkowe, zewnętrzne nazwy parametrów (external names)
    func changeResolution(newResolution res: Resolution) {
        if res.height <= nativeResolution.height && res.width <= nativeResolution.width {
            self.currentResolution = res
        } else {
            print("Not supported")
        }
    }
    
//: Przeciążenie metod za pomocą etykiet argumentów
    func enablePictureByPicture(horizontalCount h: Int) {
        print("Enabled horizontal \(h) PbP")
    }
    
    func enablePictureByPicture(verticalCount v: Int) {
        print("Enabled vertical \(v) PbP")
    }
}

let display = Display(nativeResolution: Resolution(width: 1920, height: 1280))
display.enablePictureByPicture(horizontalCount: 3)

//: ## Dziedziczenie
class Display4k : Display {
    private (set) var refreshRateHz : Int
    private var supports60Hz : Bool
    
    init(supports60Hz: Bool) {
        self.supports60Hz = supports60Hz
        refreshRateHz = supports60Hz ? 60 : 30
        super.init(nativeResolution: Resolution(width: 4096, height: 2160))
    }
    
    override func changeResolution(newResolution res: Resolution) {
        super.changeResolution(newResolution: res)
        
        if res.width < 4096 && res.height < 2160 {
            refreshRateHz = 60
        } else {
            refreshRateHz = supports60Hz ? 60 : 30
        }
    }
}

let display4k = Display4k(supports60Hz: false)
display4k.currentResolution.display
display4k.refreshRateHz
display4k.changeResolution(newResolution: Resolution(width: 1024, height: 768))
display4k.currentResolution.display
display4k.refreshRateHz
/*:
 ---
 [⬅️⬅️](@previous) [➡️➡️](@next)
 */
