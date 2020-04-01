 
 protocol ShowDelegate: class {
    func setDisplay(text: String)
    func presentAlert()
 }
 
 class CountOnMeModel {
    
    var elements : [String] = []
    var delegate: ShowDelegate?
    var opperands : [String] = []
    var operations : [String] = [
    "-" = 
    ]
    func ErrorMessage() {
        print("Erreur")
    }
    
    var results: String {
        return elements.joined().replacingOccurrences(of: ".0", with: "")
    }
    /*
    var setOp : String {
        
     return opperands.joined().replacingOccurrences(of: "", with: "") } */
    
    
    func reset() {
        elements.removeAll()
        numberButton(number: "")
        delegate?.setDisplay(text: results)
    }
    
    func setOperand (operands : String) {
        
        opperands.append(operands)
        
        
        delegate?.setDisplay(text: operands)
            
    }
    
    func performOperations (symbol : String, _: Operands) {
        
        
    }
    
    func numberButton(number: String) {
        //If a result is displayed, tapping a number starts a new expression:
        
        elements.append(number)
        
        delegate?.setDisplay(text: results)
    }
    
    func Multiply (a: Double, b: Double) -> Double {
        return a * b
    }
    
    func Divide (a: Double, b: Double) -> Double {
        
        if a == 0 || b == 0 {
            ErrorMessage()
            return 0
        } else {
            return a / b
        }
    }
    
    func Plus (a: Double, b: Double) -> Double {
        return a + b
    }
    func Minus (a: Double, b: Double) -> Double {
        return a - b
    }
    
    enum Operands : String {
        case minus = "-"
        case plus = "+"
        case multiply = "×"
        case divide = "÷"
    }
    
 }
 
 
