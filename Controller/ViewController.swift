//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    
   // let model = CountOnMeModel()
    // View Life cycles
  
  //      model.delegate = self
    //    model.downloadData()
    
    
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        textView.text = textView.text! + String(sender.tag-1)
    }
override func viewDidLoad() {
    super.viewDidLoad()
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
       
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
       
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
       
    }
   /*
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
        
        textView.text.append(" = \(operationsToReduce.first!)")
    }
}
extension ViewController: ModelDelegate {
    func didReceiveData(_ data: String) {
        print(data) // textview.text = data
    }
}
*/
}
