//
//  QuizViewController.swift
//  Quiz
//
//  Created by Baidetskyi Jurii on 12.10.2022.
//

import UIKit

class QuizViewController: UIViewController {
    //MARK:  properties
    var questions: [Question]?
    var playerNameString: String?
    //MARK:  @IBOutlet weak var
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var submitButtonOutlet: UIButton!
    //MARK:  viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setCustomCell()
        addQuestions()
        submitButtonOutlet.layer.cornerRadius = 20
    }
    //MARK:   @IBAction func
    @IBAction func submitButtonPressed(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "AnswersViewController") as? AnswersViewController else { return }
        vc.questions = questions
        vc.playerNameString = playerNameString
        
        navigationController?.pushViewController(vc, animated: true)
    }
    //MARK: private func
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
    
    private func addQuestions () {
        questions = QuestionManager.shared.addQuestions()
    }
}
     //MARK: UITableViewDelegate
extension QuizViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(390)
    }
}
     //MARK: UITableViewDataSource
extension QuizViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        questions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuizableViewCell", for: indexPath) as? QuizableViewCell else {
            return UITableViewCell()
        }
        if let question = questions?[indexPath.row] {
            cell.setQuestion(question: question)
            cell.completionHandler = { [weak self] text in
                self?.questions?[indexPath.row].answer.chosenAnswer = text
            }
        }
        return cell
    }
}
