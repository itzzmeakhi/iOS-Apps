//
//  ViewController.swift
//  Quiz
//
//  Created by Akhil Reddy on 23/09/19.
//  Copyright © 2019 Akhil Reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Creating Question Bank Object
    
    let allQuestions = QuestionBank()
    
    // Declaring all Labels and Buttons in the UI
    
    @IBOutlet weak var progressBarView: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    var questionBeingReviewed : Int = 0
    var pickedAnswer : Bool = false
    var answerVerified : Bool = false
    var progressCompleted : Int = 1
    var score : Int = 0
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        nextQuestion(questionNumber: questionBeingReviewed)
        
        // print(firstQuestion.questionText)
        
        progressLabel.text = "Progress: \(progressCompleted) / 15"
        scoreLabel.text = "Score: \(score)"
        
        progressBarReset()
        
    }
    
    
    // Triggers when an User answered a Question (Whether True/False)
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if sender.tag == 1 {
            // print("Correct")
            pickedAnswer = true
            
        } else if sender.tag == 2 {
            // print("Incorrect")
            pickedAnswer = false

        }
        
        answerVerified = checkAnswer(questionNumber : questionBeingReviewed)
        
        questionBeingReviewed = questionBeingReviewed + 1
        progressCompleted = progressCompleted + 1
        
        nextQuestion(questionNumber: questionBeingReviewed)
        
        updateUI(number: progressCompleted, check: answerVerified)
        
    }
    
    // Triggers to update Question
    
    func nextQuestion(questionNumber: Int) {
        
        // print(questionNumber)
        
        if questionNumber <= 14 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
        } else {
            print("End of the Quiz!!")
            
            let alert = UIAlertController(title: "Awesome..!!", message: "You have completed the Quiz. \n Your score is \(score).\n Do you want to restart the Quiz?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: {
                (UIAlertAction) in
                self.startOver()
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                (UIAlertAction) in
                exit(0)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    // Triggers to Update Score and Progress values
    
    func updateUI(number: Int, check: Bool) {
        
        if number <= 15 {
        
            progressLabel.text = "Progress: \(number) / 15"
            
            if(check) {
                score = score + 10
                scoreLabel.text = "Score: \(String(score))"
            }
            
            progressBarView.frame.size.width = (view.frame.size.width / 15) * CGFloat(number)
        }
        
    }
    
    // Triggers to check Answer
    
    func checkAnswer(questionNumber: Int) -> Bool {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            return true
        } else {
            return false
        }
        
    }
    
//    // Triggers to display Alert
//
//    func displayAlert() {
//
//    }
//
    
    // Triggers to start over
    
    func startOver() {
        
        questionBeingReviewed = 0
        progressCompleted = 1
        score = 0
        
        nextQuestion(questionNumber: questionBeingReviewed)
        progressLabel.text = "Progress: \(progressCompleted) / 15"
        scoreLabel.text = "Score: \(String(score))"
        
        progressBarReset()
    }
    
    // Reset progress bar
    
    func progressBarReset() {
        
        let number : Int = 1
        
        progressBarView.frame.size.width = (view.frame.size.width / 15) * CGFloat(number)
        
    }
    

}

