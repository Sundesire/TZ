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
    var users: [Users]? = []
    var networking: Networking!
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .black
        networking = Networking()
        
        getRating()
        timer = Timer.scheduledTimer(timeInterval: 300, target: self, selector: #selector(getRating), userInfo: nil, repeats: true)
    }
    
    @objc func getRating() {
        networking.getRating {[weak self] (usersRating) in
            if usersRating != nil {
                var i = 0
                while i < 5 {
                    self?.users?.append(usersRating![i])
                    i += 1
                }
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            } else {
                self?.showAlert(with: "Ошибка!", message: "Невозможно получить данные")
            }
            
        }
        print("timer completed")
    }
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: Token.login)
        Switcher.updateRootVC()
    }
    
}
extension LeaderTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if users != nil {
            return users!.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LeaderTableViewCell.reuseId, for: indexPath) as! LeaderTableViewCell
        if users != nil {
            let user = users![indexPath.row]
            cell.configure(user: user)
        } else {
            print("Cannot update status")
        }
        return cell
    }
}

