import Foundation


 protocol ShowDelegate: class {
    func setDisplay(text: String)
    func presentAlert()
 }
 
 class CountOnMeModel {
    
    var elements : [String] = []
    var delegate: ShowDelegate?

    var operations : [String] = []
    func ErrorMessage() {
        print("Erreur")
    }
    
    var results: String {
        return elements.joined().replacingOccurrences(of: ".0", with: "")
    }
  
    func TwoOppImpossible() {
        
        if elements.last == "-" {
           delegate?.presentAlert()
        }
        if elements.last == "+" {
            delegate?.presentAlert()
        }
        if elements.last == "*" {
            delegate?.presentAlert()
        }
        if elements.last == "/" {
            delegate?.presentAlert()
        }
     
    }
    
    func reset() {
        elements.removeAll()
        elements.append("0")
        delegate?.setDisplay(text: results)
    }
    
    func setOperand (operands : String) {
        
        elements.append(operands)
        TwoOppImpossible()
        delegate?.setDisplay(text: results)
            
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
        if elements.first == "0" {
            elements.removeFirst()
        }
        elements.append(number)
        // Regarder si le premier élement de tableau est égal à 0 => supprimer le 0 
        delegate?.setDisplay(text: results)
    }
    
    
 }
 
 
