
import UIKit

// declaration and connection between the buttons and the controller
class ViewController: UIViewController {
    @IBOutlet weak var textView: UILabel!
    @IBOutlet var numberButtons: UIButton!
    @IBOutlet var operators: UIButton!
    
    
    let model = CountOnMeModel()
    // numbers are tapped and the method number Button of the model is called
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberButton = sender.title(for: .normal) else { return }
        model.numberButton(number: numberButton)
    }
    
    //Allows to upload the view when it's loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        model.delegate = self
    }
    
    // sent to the ViewController when the app receives a memory warning
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // when one operand is tapped, set operands in the view and the method setOperand of the model is called
    @IBAction func tappedOperands(_ sender: UIButton) {
        guard let operands = sender.title(for: .normal) else { return }
        model.setOperand(operands: operands)
        
    }
    // Tapped the equal Button and the method performPêrations of the model is called
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        model.performOperations()
    }
    // Tapped the reset button and the method reset of the model is called
    @IBAction func tappedResetButton(_ sender: Any) {
        model.reset()
    }
    
    
    
}
// Implementation of the protocol/ methods which will be called in the model

// SetDisplay allows the transfer of information between the model and the controller
extension ViewController: ShowDelegate {
    func setDisplay(text: String) {
        textView.text = text
    }
    
// Send an alert when some actions are not allowed
    func presentAlert() {
        let alert = UIAlertController(title: "My Alert", message: "Error, you can't do that.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    
    }
    
}
