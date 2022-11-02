//
//  QuestionManager.swift
//  Quiz
//
//  Created by Baidetskyi Jurii on 23.10.2022.
//

import Foundation

protocol QuestionManagerProtocol {
    func addQuestions() -> [Question]
}

class QuestionManager: QuestionManagerProtocol {
    
    static let shared = QuestionManager()
    
    private init () {}

    
    func addQuestions() -> [Question] {
        let questions = [
            Question(question: "Частку не треба писати разом у варіанті?",
                     answer: Answer(
                        answers: ["не/зовсім зрозумілий",
                                  "зошит не/підписано",
                                  "не/всі з цим обізнані",
                                  "не/забутня подорож"],
                        correctAnswer: "не/забутня подорож")),
            Question(question: "Суфікс -ов- має прикметник, утворений від іменника?",
                     answer: Answer(
                        answers: ["плащ",
                                  "читач",
                                  "ситець",
                                  "насіння"],
                        correctAnswer: "плащ")),
            Question(question: "Помилково вжито слово в рядку?",
                     answer: Answer(
                        answers: ["розв'язувати задачу",
                                  "уникнути небезпеки",
                                  "заказати букет квітів",
                                  "перекладати болгарською"],
                        correctAnswer: "заказати букет квітів")),
            Question(question: "Неправильно утворено форму слова у варіанті?",
                     answer: Answer(
                        answers: ["пане Костянтине",
                                  "для всіх дослідників",
                                  "восьмидесяти років",
                                  "візьмімо участь"],
                        correctAnswer: "восьмидесяти років")),
            Question(question: "Спонукальним є речення?",
                     answer: Answer(
                        answers: ["Жінки втомились бути непрекрасними.",
                                  "За правду, браття, єднаймось щиро.",
                                  "Весна прийшла, та якось несподівано!",
                                  "Шматок землі, ти звешся Україною."],
                        correctAnswer: "За правду, браття, єднаймось щиро."))
        ]
        
        return questions
    }
    
   
    
    
}
