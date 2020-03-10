//
//  LeaderTableViewCell.swift
//  TZ
//
//  Created by Иван Бабушкин on 09.03.2020.
//  Copyright © 2020 Ivan Babushkin. All rights reserved.
//

import UIKit

class LeaderTableViewCell: UITableViewCell {
    
    static let reuseId = "LeaderTableViewCell"
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPoints: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(user: Users) {
        userName.text = user.User.name
        userPoints.text = "User points: " + String(user.totalScore)
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
}
