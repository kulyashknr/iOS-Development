//
//  ViewController.swift
//  calculatorMVC
//
//  Created by Kulyash Konyrova on 10/8/19.
//  Copyright © 2019 Kulyash Konyrova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    var typing : Bool = false
    

    @IBAction func numberButton(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        let result = resultLabel!.text!
        
        if typing {
            resultLabel!.text = result + number
        }
        else {
            resultLabel!.text = number
            typing = true
        }
    }
    
    var displayValue : Double {
        get {
            return Double(resultLabel.text!)!
        }
        set {
            resultLabel.text = String(newValue)
        }
    }
    
    var function = CalculatorModel()
    
    @IBAction func operationButton(_ sender: UIButton) {
        if typing {
            function.setOperation(operation: displayValue)
            typing = false
        }
        if let mathSymbol = sender.currentTitle {
            function.doOperation(symbol: mathSymbol)
        }
        displayValue = function.result
    }
}

