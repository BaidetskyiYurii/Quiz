//
//  RateTableViewCell.swift
//  Quiz
//
//  Created by Baidetskyi Jurii on 10.10.2022.
//

import UIKit

class RateTableViewCell: UITableViewCell {
    //MARK: Outlets
    @IBOutlet weak var namePlayer: UILabel!
    @IBOutlet weak var playerScore: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
