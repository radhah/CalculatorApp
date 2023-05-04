//
//  ViewController.swift
//  CalculatorApp
//
//  Created by radha.h.s on 04/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var value: UILabel!
    
    private var isFinishedTyping : Bool = true
    
    var displayVal : Double {
        get {
            guard let number = Double(value.text!) else {
                fatalError("Cannot convert to double")
            }
            return number
        }
        set {
            value.text = String(newValue)
        }
    }
    
    private var calculatorManager = CalculatorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        value.text = "0"
        // Do any additional setup after loading the view.
    }


    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        guard  let title = sender.titleLabel?.text else {
            return
        }
        
        if isFinishedTyping {
            value.text = title
            isFinishedTyping = false
        } else {
            if title == "." {
                if ((value.text?.contains(".")) == true){
                    value.text = value.text!
                } else {
                    value.text = value.text! + title
                }
            } else {
                value.text = value.text! + title
            }
        }
    }
    
    @IBAction func calculationButtonPressed(_ sender: UIButton) {
        
        isFinishedTyping = true
        
        calculatorManager.setNumber(num: displayVal)
        
        if let symbol = sender.titleLabel?.text {
            if let res = calculatorManager.calcMethod(symbol: symbol){
                displayVal = res
            }
        }
    }
    
}

