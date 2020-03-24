 
class CountOnMeModel {

    var results = 0.0
    
    func ErrorMessage() {
        print("Erreur")
    }
    
    func setOperand (operand : Double) {
        results = operand
    }
    
    func performOperations (symbol : String) {
    }
    
    var result : Double {
        get {
            return results
        }
    }
    
    func Multiply (a: Int, b: Int) -> Int {
        return a * b
    }
    func Divide (a: Int, b: Int) -> Int {
        
        if a == 0 || b == 0 {
            ErrorMessage()
        } else {
            return a / b
        } 
    }
    
    func Plus (a: Int, b: Int) -> Int {
        return a + b
    }
    func Minus (a: Int, b: Int) -> Int {
        return a - b
    }
    
 
    
    
    

    
    enum Operands : String {
        case minus = "-"
        case plus = "+"
        case divide = "/"
        case multiply = "x"
            
        }
    
    
 }
 extension CountOnMeModel : getCalculDelegate {
    func equal() {
        print(results)
    }
    
    func reset() {
        print(0)
    }
    
    func operands() {
        print(Operands.self)
    } 
 }
 
