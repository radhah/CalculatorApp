//
//  CalculatorManager.swift
//  CalculatorApp
//
//  Created by radha.h.s on 04/05/23.
//

import Foundation

struct CalculatorManager {
    
    var num : Double?
    var intermediateValues : (n1:Double,op:String)?
    
    mutating func setNumber(num:Double){
        self.num = num
    }
    
    mutating func calcMethod(symbol:String)->Double? {
        
        guard let n = num else {
            fatalError("Number is not initialised yet")
        }
        
        switch symbol  {
        case "AC" :
            return 0
        case "+/-" :
            return n * -1
        case "%" :
            return n * 0.01
        case "=" :
            //print("inside = case")
            return performCalculation(n2:n)
        default:
            intermediateValues = (n1:n,op:symbol)
        }
        
        return nil
    }
    
    func performCalculation(n2:Double)->Double?{
        if let n1 = intermediateValues?.n1, let symbol = intermediateValues?.op {
            switch symbol {
            case "+" : return n1 + n2
            case "-" : return n1 - n2
            case "*" : return n1 * n2
            case "/" : return n1 / n2
            default:
                fatalError("The operation passed in does not any match cases")
            }
        }
        return nil
    }
    
}
