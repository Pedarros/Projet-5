 
 protocol ShowDelegate: class {
    func setDisplay(text: String)
    func presentAlert()
 }
 
 class CountOnMeModel {
    
    var elements : [String] = []
    var delegate: ShowDelegate?
    
    func ErrorMessage() {
        print("Erreur")
    }
    
    var results: String {
        return elements.joined().replacingOccurrences(of: ".0", with: "")
    }
    
    func reset() {
        elements.removeAll()
        delegate?.setDisplay(text: results)
    }
    
    func setOperand (operand : Double) {
       
    }
    
    func performOperations (symbol : String) {
    }
    
    func numberButton(number: String) {
        //If a result is displayed, tapping a number starts a new expression:
        
        elements.append(number)
        
        delegate?.setDisplay(text: results)
    }
    
    func Multiply (a: Int, b: Int) -> Int {
        return a * b
    }
    
    func Divide (a: Int, b: Int) -> Int {
        
        if a == 0 || b == 0 {
            ErrorMessage()
            return 0
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
 
 
