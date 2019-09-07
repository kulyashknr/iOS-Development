//
//  ViewController.swift
//  calculatorApp
//
//  Created by Kulyash Konyrova on 9/5/19.
//  Copyright © 2019 Kulyash Konyrova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var newNumber = 0.0;
    var operation = false;
    var prevNumber = 0.0;
    var answer = 0.0;
    var action = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var label: UILabel!
    @IBAction func numbers(_ sender: UIButton) {
        if (operation == true) {
            label.text = sender.titleLabel!.text
            operation = false;
        }
        else {
            if (label.text == "0") {
                label.text = ""
            }
            label.text = label.text! + sender.titleLabel!.text!
        }
    }
    
    @IBAction func operation(_ sender: UIButton) {
        operation = true;
        prevNumber = Double(label.text!)!
    }
    
    @IBAction func add(_ sender: UIButton) {
        action = 1;
    }
    
    @IBAction func minus(_ sender: UIButton) {
        action = 2;
    }
    
    @IBAction func mult(_ sender: UIButton) {
        action = 3;
    }
    
    @IBAction func del(_ sender: UIButton) {
        action = 4;
    }
    
    @IBAction func solution(_ sender: UIButton) {
        newNumber = Double(label.text!)!
        if (action == 1) {
            answer = prevNumber + newNumber;
        }
        if (action == 2) {
            answer = prevNumber - newNumber;
        }
        if (action == 3) {
            answer = prevNumber * newNumber;
        }
        if (action == 4) {
            answer = prevNumber / newNumber;
        }
        label.text = String(answer);
    }
    
    @IBAction func clear(_ sender: UIButton) {
        label.text = "0";
        answer = 0;
        prevNumber = 0;
        newNumber = 0;
        operation = false;
        action = 0;
    }
}

