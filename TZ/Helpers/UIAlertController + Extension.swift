//
//  UIAlertController + Extension.swift
//  TZ
//
//  Created by Иван Бабушкин on 10.03.2020.
//  Copyright © 2020 Ivan Babushkin. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(with title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true)
        alertController.view.tintColor = #colorLiteral(red: 0.152451545, green: 0.1685512364, blue: 0.1769267023, alpha: 1)
        let subview = (alertController.view.subviews.first?.subviews.first?.subviews.first)! as UIView
        subview.layer.cornerRadius = 10
        subview.backgroundColor = #colorLiteral(red: 0, green: 0.8588235294, blue: 0.7607843137, alpha: 1)
    }
}
