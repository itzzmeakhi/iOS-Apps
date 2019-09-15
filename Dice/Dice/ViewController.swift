//
//  ViewController.swift
//  Dice
//
//  Created by Akhil Reddy on 11/09/19.
//  Copyright © 2019 Akhil Reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Dice Array that holds the images names
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    // Random variables to store indexe's of both dices
    
    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    var result: Int = 0

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    @IBOutlet weak var diceResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        // Executes when a Roll Button is pressed
        
        diceImagesGenerate()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        diceImagesGenerate()
    }
    
    
    func diceImagesGenerate() {
        
        // Generating random numbers between 0 to 5 for dice indices
            
        randomDiceIndex1 = Int.random(in: 0 ... 5)
        randomDiceIndex2 = Int.random(in: 0 ... 5)
        
        // Result of both dice values
        
        result = randomDiceIndex1 + randomDiceIndex2 + 2
        
        // Print the indices of both dice for validating
        
        // print(randomDiceIndex1)
        // print(randomDiceIndex2)
        
        // Access the diceImageview object to modify it's image property
        
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
        
        diceResultLabel.text = String(result)
        
    }
    
}

