//
//  QuizableViewCell.swift
//  Quiz
//
//  Created by Baidetskyi Jurii on 12.10.2022.
//

import UIKit

class QuizableViewCell: UITableViewCell {
    //MARK: completionHandler
    var completionHandler:((String)-> Void)?
    //MARK: properties
    private var question: Question?
    //MARK: Outlets
    @IBOutlet var answersOutletCollection: [UIButton]!
    @IBOutlet weak var questionLabel: UILabel!
    //MARK:  @IBAction func
    @IBAction func clickOnChooseButton(_ sender: Any) {
        guard let chooseButton = sender as? UIButton else { return }
        if chooseButton.titleLabel?.text == question?.answer.correctAnswer {
            answersOutletCollection.forEach{ $0.isEnabled = false}
            chooseButton.backgroundColor = .blue
        } else {
            answersOutletCollection.forEach{ $0.isEnabled = false}
            chooseButton.backgroundColor = .blue
        }
            completionHandler?(chooseButton.titleLabel?.text ?? "Error")
    }
    //MARK:  awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    //MARK:  override func setSelected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    //MARK: func
    func setQuestion(question: Question, isHighlightCorrectAnswer: Bool = false) {
        self.question = question
        questionLabel.text = question.question

        for index in 0..<answersOutletCollection.count {
            answersOutletCollection[index].setTitle(question.answer.answers[index], for: .normal)
            answersOutletCollection[index].tag = index
            answersOutletCollection[index].backgroundColor = .darkGray
        }
        
        if question.answer.chosenAnswer != nil {
            answersOutletCollection.forEach{ $0.isEnabled = false }
            answersOutletCollection.forEach { button in
                if question.answer.answers[button.tag] == question.answer.chosenAnswer {
                    button.backgroundColor = .blue
                } else {
                    button.backgroundColor = .gray
                }
            }
        }
        
        if isHighlightCorrectAnswer  {
            answersOutletCollection.forEach{ $0.isEnabled = false }
            answersOutletCollection.forEach { button in
                if question.answer.answers[button.tag] == question.answer.chosenAnswer && question.answer.answers[button.tag] == question.answer.correctAnswer {
                    button.backgroundColor = .green
                } else if question.answer.answers[button.tag] == question.answer.correctAnswer   {
                    button.backgroundColor = .yellow
                } else if question.answer.answers[button.tag] == question.answer.chosenAnswer {
                    button.backgroundColor = .red
                }
            }
        }
    }
}
