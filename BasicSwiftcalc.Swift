// Swift calculator

import UIKit
// create a class
class ViewController: UIViewController {
    // create a variable
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false;
    var operation = 0;
    // create a function
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        } else {
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
    }
    // create a function
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            previousNumber = Double(label.text!)!
            if sender.tag == 12 { // Divide
                label.text = "/";
            } else if sender.tag == 13 { // Multiply
                label.text = "x";
            } else if sender.tag == 14 { // Subtract
                label.text = "-";
            } else if sender.tag == 15 { // Add
                label.text = "+";
            }
            operation = sender.tag
            performingMath = true;
        } else if sender.tag == 16 {
            if operation == 12 { // Divide
                label.text = String(previousNumber / numberOnScreen)
            } else if operation == 13 { // Multiply
                label.text = String(previousNumber * numberOnScreen)
            } else if operation == 14 { // Subtract
                label.text = String(previousNumber - numberOnScreen)
            } else if operation == 15 { // Add
                label.text = String(previousNumber + numberOnScreen)
            }
        } else if sender.tag == 11 {
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    }
    // create a variable
    @IBOutlet weak var label: UILabel!
    // create a function
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    // create a function
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}