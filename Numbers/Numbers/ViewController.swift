//
//  ViewController.swift
//  Numbers
//
//  Created by Akhil Reddy on 24/09/19.
//  Copyright © 2019 Akhil Reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultDisplayLabel: UILabel!
    
    var numberOnScreen : Double = 0
    var previousNumber : Double = 0
    var currentNumber : Double = 0
    var result : Double = 0
    
    var performMath : Bool = false
    
    var operatorTag : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func numberPressed(_ sender: UIButton) {
        
        // print(sender.tag)
        
        
        if performMath {
            resultDisplayLabel.text = ""
            retreiveNumbers(number: sender.tag)
            // print(resultDisplayLabel.text as Any)
            performMath = false
        } else {
            retreiveNumbers(number: sender.tag)
        }
    }
    
    func retreiveNumbers(number: Int) {
        
        var numberTyped : String = ""
        
        if number == 10 {
            numberTyped = "."
        } else {
            numberTyped = String(number)
        }
        //print(resultDisplayLabel.text)
        resultDisplayLabel.text = (resultDisplayLabel.text ?? "") + numberTyped
        
        numberOnScreen = Double(resultDisplayLabel.text ?? "")!
        
        // print(numberOnScreen)
        
    }
    
    
    @IBAction func operatorsPressed(_ sender: UIButton) {
        
        // print("Button pressed")
        
        if sender.tag != 11 && sender.tag != 17 && sender.tag != 18 && resultDisplayLabel.text != "" {
            
            // print(previousNumber)
            
            if previousNumber != 0 {
                performOperations(checkOperation: sender.tag)
            } else {
                previousNumber = numberOnScreen
                //print("Previous Number")
                //print(previousNumber)
                performOperations(checkOperation: sender.tag)
            }
            
            
            operatorTag = sender.tag
            
        }
        
        // Evaluate
        
        if (sender.tag == 11) {
            
            //print("Number On Screen")
            //print(numberOnScreen)
            
            if operatorTag == 12 {
                result = previousNumber + numberOnScreen
                // print(previousNumber)
                // print(numberOnScreen)
                // print(result)
            } else if operatorTag == 13 {
                result = previousNumber - numberOnScreen
            } else if operatorTag == 14 {
                result = previousNumber * numberOnScreen
            } else if operatorTag == 15 {
                result = previousNumber / numberOnScreen
            } else if operatorTag == 16 {
                result = Double(Int(previousNumber) % Int(numberOnScreen))
            }
            
            resultDisplayLabel.text = String(result)
            previousNumber = result
            // print("Previous Number")
            // print(previousNumber)
        }
        
        // Clear the Screen
        
        if sender.tag == 18 {
            resultDisplayLabel.text = ""
            numberOnScreen = 0
            previousNumber = 0
            performMath = false
            result = 0
        }
        
        // Backspace
        
        if sender.tag == 17 {
            // print(resultDisplayLabel.text?.count ?? 0)
            let newString : String = resultDisplayLabel.text ?? ""
            let lenghtOfString : Int = newString.count
            
            
            resultDisplayLabel.text = String(Array(newString)[0..<lenghtOfString-1])
            numberOnScreen = Double(resultDisplayLabel.text ?? "")!
        }
        
    }
    
    
    
    func performOperations(checkOperation: Int) {
        
        if checkOperation == 12 {
            
            // Addition
            resultDisplayLabel.text = "+"
            performMath = true
            //print("Print +")
            
        } else if checkOperation == 13 {
            
            // Subraction
            print("ADD")
            resultDisplayLabel.text = "-"
            performMath = true
        } else if checkOperation == 14 {
            
            // Multiplication
            resultDisplayLabel.text = "*"
            performMath = true
        } else if checkOperation == 15 {
            
            // Divide
            resultDisplayLabel.text = "/"
            performMath = true
        } else if checkOperation == 16 {
            
            // Modulo Division
            resultDisplayLabel.text = "%"
            performMath = true
        }
        
        
    }
    
    
    
    
}
