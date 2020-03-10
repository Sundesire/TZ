//
//  ViewController.swift
//  TZ
//
//  Created by Иван Бабушкин on 09.03.2020.
//  Copyright © 2020 Ivan Babushkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var loginView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.layer.borderColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        loginView.layer.borderWidth = 4
        loginView.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        let uid = UIDevice.current.identifierForVendor!.uuidString
    }
    
    func checkLoginTextField() -> Bool {
        if loginTextField.text!.isEmpty {
            loginTextField.placeholder = "Enter user name!"
            print("failed")
            return false
        }
        return true
    }

    @IBAction func okButtonTouched(_ sender: Any) {
        guard checkLoginTextField() else {
            return
        }
    }
}

