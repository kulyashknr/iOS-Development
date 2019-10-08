//
//  CalculatorModel.swift
//  calculatorMVC
//
//  Created by Kulyash Konyrova on 10/8/19.
//  Copyright © 2019 Kulyash Konyrova. All rights reserved.
//

import Foundation

class CalculatorModel {
    var value = 0.0
    
    func setOperation(operation : Double) {
        value = operation
    }
    
    enum operation{
        case oneNumberOperation((Double) -> Double)
        case twoNumbersOperation((Double,Double) -> Double)
        case equals
        case clear
        case delete
    }
    
    var Operations : Dictionary<String,operation> = [
        "+" : operation.twoNumbersOperation({$0+$1}),
        "-" : operation.twoNumbersOperation({$0-$1}),
        "×" : operation.twoNumbersOperation({$0*$1}),
        "/" : operation.twoNumbersOperation({$0/$1}),
        "=" : operation.equals,
        "C" : operation.clear,
        "Del" : operation.delete
    ]
    
    var pend : pending?
    
    struct pending{
        var binaryOp : (Double,Double) -> Double
        var firstOperand : Double
    }
    
    func clear(){
        value = 0.0;
    }
    
    func doOperation(symbol:String){
        if let operation = Operations[symbol]{
            switch operation {
            case .twoNumbersOperation(let function):
                execute()
                pend = pending(binaryOp: function, firstOperand: value)
                
            case .oneNumberOperation(let function):
                value = function(value)
            case .equals:
                execute()
            case .clear:
                clear()
            case .delete:
                delete()
            }
        }
    }
    
    func execute() {
        if pend != nil {
            value = pend!.binaryOp(pend!.firstOperand, value)
            pend = nil
        }
    }
    
    func delete() {
        value = 0.0
        pend!.firstOperand = 0.0
    }
    
    var result : Double{
        get{
            return value
        }
    }
}
