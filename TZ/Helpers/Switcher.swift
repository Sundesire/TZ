//
//  Switcher.swift
//  TZ
//
//  Created by Иван Бабушкин on 10.03.2020.
//  Copyright © 2020 Ivan Babushkin. All rights reserved.
//

import Foundation
import UIKit

class Switcher {
    static func updateRootVC(){
        let status = UserDefaults.standard.bool(forKey: Token.login)
        var rootVC: UIViewController?
        print(status)
        
        if status == true {
            let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LeaderTableViewController") as? LeaderTableViewController
            rootVC = UINavigationController(rootViewController: VC!)
        } else {
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? ViewController
        }
        
        let window = UIApplication.shared.windows.first
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        
        let options: UIView.AnimationOptions = .transitionFlipFromLeft
        let duration: TimeInterval = 0.7
        UIView.transition(with: window!, duration: duration, options: options, animations: {}) { completed in
            
        }
    }
}
