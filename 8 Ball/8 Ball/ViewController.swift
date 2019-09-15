//
//  ViewController.swift
//  8 Ball
//
//  Created by Akhil Reddy on 14/09/19.
//  Copyright © 2019 Akhil Reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomIndex: Int = 0
    
    let ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    
    

    @IBOutlet weak var answerImage: UIImageView!
    
    
    @IBAction func askButton(_ sender: UIButton) {
        imageChange()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageChange()
    }
    
    func imageChange() {
        randomIndex = Int.random(in: 0 ... 5)
        
        answerImage.image = UIImage(named: ballArray[randomIndex])
    }
    

    
}

