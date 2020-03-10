//
//  LeaderTableViewController.swift
//  TZ
//
//  Created by Иван Бабушкин on 09.03.2020.
//  Copyright © 2020 Ivan Babushkin. All rights reserved.
//

import UIKit

class LeaderTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .black
    }

    
}
extension LeaderTableViewController: UITableViewDelegate {
    
}
extension LeaderTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LeaderTableViewCell.reuseId, for: indexPath) as! LeaderTableViewCell
        cell.configure(name: "Ivan", points: 1)
        cell.backgroundColor = .clear
        cell.bgView.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        return cell
    }

}
