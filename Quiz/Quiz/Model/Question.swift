//
//  Model.swift
//  Quiz
//
//  Created by Baidetskyi Jurii on 10.10.2022.
//

import Foundation

struct Question {
    var question: String
    var answer: Answer
    
    
}
//TODO: change answers to arrat of strings
struct Answer {
    var answers: [String]
    var correctAnswer: String
    var chosenAnswer: String?
}
