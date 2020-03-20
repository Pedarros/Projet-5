 
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
    /*
    enum Operation {
        case minus
        case plus
        case multiply
        case divide
        }
    
    if minus {
    */
 
 
 
 }
