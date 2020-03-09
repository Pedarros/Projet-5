 
 class CountOnMeModel {

    weak var delegate: ModelDelegate?
    func downloadData() {
        let data = "Network request information."
        delegate?.didReceiveData(data)
    }
    
var elements: [String] {
return textView.text.split(separator: " ").map { "\($0)" }
    }
 // Error check computed variables
 var expressionIsCorrect: Bool {
    return elements.last != "+" && elements.last != "-"
 }
 
 var expressionHaveEnoughElement: Bool {
    return elements.count >= 3
 }
 
 var canAddOperator: Bool {
    return elements.last != "+" && elements.last != "-"
 }
 
 var expressionHaveResult: Bool {
    return textView.text.firstIndex(of: "=") != nil
    }
    
    // Create local copy of operations
    var operationsToReduce = elements
    
    // Iterate over operations while an operand still here
    while operationsToReduce.count > 1 {
    let left = Int(operationsToReduce[0])!
    let operand = operationsToReduce[1]
    let right = Int(operationsToReduce[2])!
    
    let result: Int
    switch operand {
    case "+": result = left + right
    case "-": result = left - right
    default: fatalError("Unknown operator !")
    }
    
    operationsToReduce = Array(operationsToReduce.dropFirst(3))
    operationsToReduce.insert("\(result)", at: 0)
    }
    
    func Multiply (a: Int, b: Int) -> Int {
        return a * b
    }
    func Divide (a: Int, b: Int) -> Int {
        return a / b
    }
    func Plus (a: Int, b: Int) -> Int {
        return a + b
    }
    func Minus (a: Int, b: Int) -> Int {
        return a - b
    }
    
    var result : Int = 0
    
    func Reset() {
        result = 0
    }
    
    func Equal() {
        if Multiply(a: <#T##Int#>, b: <#T##Int#>) = String(a * b)
    }
    
    func Operands (a: Float, b: Float) -> Float {
        if Multiply(a: <#T##Int#>, b: <#T##Int#>) {
            
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
 
 
