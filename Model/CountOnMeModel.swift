import Foundation

// Protocol implemented from the ViewController

protocol ShowDelegate: class {
    func setDisplay(text: String)
    func presentAlert()
}

class CountOnMeModel {
    
    // elements collects what is tapped on the ViewController
    var elements : [String] = []
    // Alloews to implement methods of the protocol
    var delegate: ShowDelegate?
    // When the result is displayed, if it's 2.0, it takes the ".0" of
    var results: String
    {
        return elements.joined().replacingOccurrences(of: ".0", with: "")
    }
    // Check if the last element is not an operand
    var isLastElementNotAnOperand: Bool
    {
        return (elements.last != " + " && elements.last != " - " && elements.last != " × " && elements.last != " ÷ ")
    }
    // Check if the first element is not 0
    var zeroIsFirst : Bool
    {
        return (elements.first == "0" ) //&& elements.count > 1
    }
    
    var OperqtionImpo : Bool
    {
        return results.contains("÷ 0")
    }
    
    var atLeastOneNumber: Bool {
        if results >= "0" {
            return elements.count >= 1
        } else {
            delegate?.presentAlert()
        }
        return false
    }
    
    var currentNumber: String {
        
        var currentNumberArray: [String] = elements
        var operandIndices = [Int]()
        for element in currentNumberArray {
            if (element == " + " || element == " - " || element == " × " || element == " ÷ ") {
                operandIndices.append(currentNumberArray.lastIndex(of: element)!)
            }
        }
        if let operandIndex = operandIndices.max() {
            currentNumberArray.removeSubrange(0...operandIndex)
        }
        return currentNumberArray.joined()
    }
    
    var isExpressionCorrect: Bool
    {
        return  (isLastElementNotAnOperand && (results.contains(" + ") || results.contains(" - ") || results.contains(" × ") || results.contains(" ÷ ")))
    }
    
    var isResultDisplayed : Bool
    {
        return results.contains("=")
        
    }
    var isDecimal : Bool
    {
        return currentNumber.contains(".")
    }
    
    
    // Determine which operands it is and perform the operation
    func performOperations () {
        if isResultDisplayed {
            reset()
        }
        
        if(OperqtionImpo || !isExpressionCorrect){
            delegate?.presentAlert();
        }else{
            var index = 0
            // Separate every element in order to use operands priority
            var operationsToReduce = results.split(separator: " ").map { "\($0)" }
            while operationsToReduce.count > 1 {
                let iscontainopp = operationsToReduce.contains("÷") || operationsToReduce.contains("×")
                let operand = operationsToReduce[index+1]
                if(iscontainopp && operand != "÷" && operand != "×"){
                    index += 2
                    continue
                }
                
                let left = Double(operationsToReduce[index])!
                let right = Double(operationsToReduce[index+2])!
                let result: Double
                switch operand {
                    
                case "+": result = left + right
                case "-": result = left - right
                case "÷": result = left / right
                case "×": result = left * right
                    
                default: fatalError("Unknown operator !")
                    
                }
                
                operationsToReduce.remove(at: index)
                operationsToReduce.remove(at: index)
                operationsToReduce.remove(at: index)
                operationsToReduce.insert("\(result)", at: index)
                
                index = 0
                
            }
            
            // Add "="
            elements.append(" = ")
            
            // Print the first index
            elements.append("\(operationsToReduce[0])")
            
            delegate?.setDisplay(text: results)
        }
        
    }
    
    
    
    // everything is removed and then add a "0"
    func reset() {
        elements.removeAll()
        elements.append("0")
        delegate?.setDisplay(text: results)
    }
    
    
    // Add operands
    func setOperand (operands : String) {
        
        // Check if the last operand is not an operand, if it is, present alert is displayed
        if isLastElementNotAnOperand {
            
            elements.append(" "+operands+" ")
            delegate?.setDisplay(text: results)
        } else {
            delegate?.presentAlert()
        }
    }
    
    // Fix a number
    func numberButton(number: String) {
        // If there is already a point, can't put a point
        if(isDecimal && number == "."){
            return
        }
        //Check if zero is the first one, if it is, it removes it
        if zeroIsFirst {
            elements.removeFirst()
        }
        if isResultDisplayed {
            reset()
            elements.removeFirst()
        }
        
        elements.append(number)
        delegate?.setDisplay(text: results)
    }
    
}


