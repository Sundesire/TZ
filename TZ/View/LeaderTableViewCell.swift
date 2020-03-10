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
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(name: String, points: Int) {
        userName.text = name
        userPoints.text = String(points)
    }
    
}
