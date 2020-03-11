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
    
    var networking: Networking!
    var helper: Helper!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.layer.borderColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        loginView.layer.borderWidth = 4
        loginView.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        loginTextField.attributedPlaceholder = NSAttributedString(string: "User 8463",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor(cgColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))])
        
        helper = Helper()
        networking = Networking(helper: helper)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        activityIndicator.isHidden = true
        activityIndicator.hidesWhenStopped = true
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func checkLoginTextField() -> Bool {
        if loginTextField.text!.isEmpty {
            loginTextField.placeholder = "Enter user name!"
            return false
        }
        return true
    }

    @IBAction func okButtonTouched(_ sender: Any) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        let uid = UIDevice.current.identifierForVendor!.uuidString
        guard checkLoginTextField() else {
            activityIndicator.stopAnimating()
            return
        }
        
        networking.loginUser(userName: loginTextField.text!, uid: "UserId\(uid)") {[weak self] (token) in
            guard token != nil else { return }
            DispatchQueue.main.async {
                self?.helper.saveToken(token: token)
                UserDefaults.standard.set(true, forKey: Token.login)
                self?.activityIndicator.stopAnimating()
                Switcher.updateRootVC()
            }
        }
    }
}

