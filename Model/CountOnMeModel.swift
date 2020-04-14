import Foundation


 protocol ShowDelegate: class {
    func setDisplay(text: String)
    func presentAlert()
 }
 
 class CountOnMeModel {
    
    
    var elements : [String] = []
    var delegate: ShowDelegate?
    var operations : [String] = []
    var results: String
    {
        return elements.joined().replacingOccurrences(of: ".0", with: "")
    }
    var isLastElementNotAnOperand: Bool
    {
        return (elements.last != "+" && elements.last != "-" && elements.last != "*" && elements.last != "/")
    }
    var zeroIsFirst : Bool
    {
        return (elements.first == "0" )
    }
    
    func reset() {
        elements.removeAll()
        elements.append("0")
        delegate?.setDisplay(text: results)
    }
    
    func setOperand (operands : String) {
        if isLastElementNotAnOperand {
        elements.append(operands)
        delegate?.setDisplay(text: results)
        } else {
            delegate?.presentAlert()
        }
    }
    
    
    
    func performOperations () {
        let mathExpression = NSExpression(format: "\(elements.joined())")
        var result = mathExpression.expressionValue(with: nil, context: nil) as? Double
            result = round(100 * result!)/100
            elements.append("=")
            elements.append("\(result!)")
            print(elements)
        
        delegate?.setDisplay(text: results)
    }
    
    func numberButton(number: String) {
        //If a result is displayed, tapping a number starts a new expression:
        if zeroIsFirst {
           elements.removeFirst()
        }
        elements.append(number)
        // Regarder si le premier élement de tableau est égal à 0 => supprimer le 0 
        delegate?.setDisplay(text: results)
    }
    
 
    
 }
 
 
