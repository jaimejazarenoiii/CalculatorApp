//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Jaime Jazareno III on 02/01/2018.
//  Copyright © 2018 Jaime Jazareno III. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var isFirstDigit = true
    var operation1 : Double = 0
    var operation2 = "="
    
    var displayValue : Double {
        get {
            return NumberFormatter().number(from: label.text!)!.doubleValue
        }
        set {
            label.text = String(format: "%2.0f", newValue)
            isFirstDigit = true
            operation2 = "="
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func digitPressed(_ sender: AnyObject) {
        let digit = sender.currentTitle!
        
        label.text = isFirstDigit ? digit : label.text! + digit!
        isFirstDigit = false
    }
    
    @IBAction func cancel(_ sender: Any) {
        displayValue = 0
    }
    
    @IBAction func operation(_ sender: AnyObject) {
        operation2 = sender.currentTitle!!
        operation1 = displayValue
        isFirstDigit = true
    }
    
    @IBAction func calculate(_ sender: Any) {
        switch operation2 {
        case "+":
            displayValue += operation1
        case "-":
            displayValue = operation1 - displayValue
        case "*":
            displayValue *= operation1
        case "/":
            displayValue = operation1 / displayValue
        default:
            break
        }
    }
    
}

