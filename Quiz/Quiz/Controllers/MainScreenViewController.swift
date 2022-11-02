//
//  ViewController.swift
//  Quiz
//
//  Created by Baidetskyi Jurii on 10.10.2022.
//

import UIKit

class MainScreenViewController: UIViewController {
    //MARK: properties
    var userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager.shared
    var players: [Player]?
   
    //MARK:  @IBOutlet weak var
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startButtonOutlet: UIButton! {
        didSet {
            startButtonOutlet.layer.cornerRadius = 15
        }
    }
    //MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setCustomCell()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        players = userDefaultsManager.loadData()
        tableView.reloadData()
    }

    //MARK:  @IBAction func
    @IBAction func startButtonPressed(_ sender: Any) {
        if let playerName = nameTextField.text {
            if playerName.count > 1 {
                guard let vc = storyboard?.instantiateViewController(withIdentifier: "QuizViewController") as? QuizViewController else { return }
                vc.playerNameString = playerName
                navigationController?.pushViewController(vc, animated: true)
            } else {
                presentAlert(withTitle: "Error", message: "Name can not contain less than 2 symbols")
            }
        }
    }
    //MARK:  private func
    private func setTableView () {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setCustomCell () {
        let cellIdentifier = "RateTableViewCell"
        tableView.register(UINib(
            nibName: cellIdentifier,
            bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
}
     //MARK:  UITableViewDelegate
extension MainScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(80)
    }
}
     //MARK:  UITableViewDataSource
extension MainScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        players?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RateTableViewCell", for: indexPath) as? RateTableViewCell else {
            return UITableViewCell()
        }
        let player = players?[indexPath.row]
        cell.namePlayer.text = player?.name
        cell.playerScore.text = player?.score
        return cell
    }
}

