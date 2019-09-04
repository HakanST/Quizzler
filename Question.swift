//
//  Question.swift
//  Quizzler
//
//  Created by Hakan Turgut on 8/11/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question{
    
    let question: String
    var answer: Bool
    
    init(text: String, correctAnswer: Bool){
        
        question = text
        answer = correctAnswer
        
    }
    
}
