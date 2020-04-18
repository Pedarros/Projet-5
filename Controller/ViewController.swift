//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UILabel!
    @IBOutlet var numberButtons: UIButton!
    @IBOutlet var operators: UIButton!
    
    
    let model = CountOnMeModel()
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberButton = sender.title(for: .normal) else { return }
        model.numberButton(number: numberButton)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        model.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func tappedOperands(_ sender: UIButton) {
        guard let operands = sender.title(for: .normal) else { return }
        model.setOperand(operands: operands) 
        
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
      model.performOperations()
    }
    
    @IBAction func tappedResetButton(_ sender: Any) {
        model.reset()
    }
    
    
    
}

extension ViewController: ShowDelegate {
    func setDisplay(text: String) {
        textView.text = text
    }
    
    func presentAlert() {
        let alert = UIAlertController(title: "My Alert", message: "Error, you can't do that.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
        
        //TODO add alert
    }
    
}


