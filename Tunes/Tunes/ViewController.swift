//
//  ViewController.swift
//  Tunes
//
//  Created by Akhil Reddy on 20/09/19.
//  Copyright © 2019 Akhil Reddy. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tunePlay(_ sender: UIButton) {
        
        print("Key pressed!")
        
        let soundFiles = ["C3", "D3", "E3", "F3", "G3", "A3", "B3", "C4", "D4", "E4", "F5", "G4", "A4", "B4", "C5", "C#3", "D#3", "F#3", "G#3", "A#3", "C#4", "D#4", "F#4", "G#4", "A#4"]
        
        let keyPressed = sender.tag - 1
        
        let url = Bundle.main.url(forResource: "\(soundFiles[keyPressed])", withExtension: "mp3")!
        

        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else {return}
            
            player.prepareToPlay()
            player.play()
        } catch {
            print("Cannot load the resource!")
        }
            
        
        
        
        
    }
    
}

