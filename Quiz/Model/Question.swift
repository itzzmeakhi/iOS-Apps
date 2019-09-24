//
//  Question.swift
//  Quiz
//
//  Created by Akhil Reddy on 23/09/19.
//  Copyright © 2019 Akhil Reddy. All rights reserved.
//

import Foundation

class Question {
    
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
