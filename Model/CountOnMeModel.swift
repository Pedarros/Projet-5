import Foundation

// Protocol implemented from the ViewController

 protocol ShowDelegate: class {
    func setDisplay(text: String)
    func presentAlert()
 }
 
 class CountOnMeModel {
    
    // elements collects what is tapped on the ViewController
    var elements : [String] = []
    // Allows to implement methods of the protocol
    var delegate: ShowDelegate?
    // When the result is displayed, if it's 2.0, it takes the ".0" of
    var results: String
    {
        return elements.joined().replacingOccurrences(of: ".0", with: "")
    }
    // Check if the last element is not an operand
    var isLastElementNotAnOperand: Bool
    {
        return (elements.last != "+" && elements.last != "-" && elements.last != "*" && elements.last != "/")
    }
    // Check if the first element is not 0
    var zeroIsFirst : Bool
    {
        return (elements.first == "0" )
    }
    
    
    // Determine which operands it is and perform the operation
    func performOperations () {
        
       var operationsToReduce = results.split(separator: " ").map { "\($0)" }
        
        while operationsToReduce.count > 1 {
            
        let operand = operationsToReduce[1]
        let left = Double(operationsToReduce[0])!
        
        let right = Double(operationsToReduce[2])!
        let result: Double
            
        switch operand {
                
            case "+": result = left + right
            case "-": result = left - right
            case "÷": result = left / right
            case "×": result = left * right
            
            default: fatalError("Unknown operator !")
                
            }
            
            if operationsToReduce[0] == "0" || operationsToReduce[2] == "0" && operand == "÷" {
                reset()
             delegate?.presentAlert()
             
            }
            //
            
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            // put the result in the first index
            operationsToReduce.insert("\(result)", at: 0)
            
            
        }
        // Add "="
        elements.append("=")
        // Print the first index
        elements.append("\(operationsToReduce[0])")
        
   
        delegate?.setDisplay(text: results)
        
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
    
    

    //
    func numberButton(number: String) {
        
        //Check if zero is the first one, if it is, it removes it
        if zeroIsFirst {
           elements.removeFirst()
        }
        if elements.count >= 5 {
            reset()
        }
        

        elements.append(number)
        
        delegate?.setDisplay(text: results)
    }
    
 
    
 }
 
 
