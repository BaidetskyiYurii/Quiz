//
//  AnswersViewController.swift
//  Quiz
//
//  Created by Baidetskyi Jurii on 16.10.2022.
//

import UIKit

class AnswersViewController: UIViewController {
    //MARK: properties
    var questions: [Question]?
    var playerNameString: String?
    var playerScore: Int = 0
    var userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager.shared
    //MARK:  @IBOutlet weak var
    @IBOutlet weak var tableView: UITableView!
    //MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setCustomCell()
        
        if let questions = questions {
            calculateScore(questions: questions)
        }
    }
    //MARK:  @IBAction func
    @IBAction func completeButtonPressed(_ sender: Any) {
        guard storyboard?.instantiateViewController(withIdentifier: "MainScreenViewController") is MainScreenViewController else { return }
        userDefaultsManager.save(with: Player(name: playerNameString ?? "error", score: String(playerScore)))
        navigationController?.popToRootViewController(animated: true)
    }
    //MARK:  private func
    private func setTableView () {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setCustomCell () {
        let cellIdentifier = "QuizableViewCell"
        tableView.register(UINib(
            nibName: cellIdentifier,
            bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    private func calculateScore(questions: [Question]) {
        questions.forEach { question in
            if question.answer.chosenAnswer == question.answer.correctAnswer {
                playerScore += 5
            }
        }
    }
}
     //MARK: UITableViewDelegate
extension AnswersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(390)
    }
}
      //MARK: UITableViewDataSource
extension AnswersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        questions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuizableViewCell", for: indexPath) as? QuizableViewCell else {
            return UITableViewCell()
        }
        if let question = questions?[indexPath.row] {
            cell.setQuestion(question: question, isHighlightCorrectAnswer: true)
        }
        return cell
    }
}
