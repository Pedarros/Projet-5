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
    
    
    @IBAction func tappedOperands(_sender: UIButton) {
       
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
      
    }
    
    @IBAction func tappedResetButton(_ sender: Any) {
        model.reset()
    }
    
    
    @objc func giveTheResult() {
        
    }
}

extension ViewController: ShowDelegate {
    func setDisplay(text: String) {
        textView.text = text
    }
    
    func presentAlert() {
        //TODO add alert
    }
    
}


