//
//  NewHabitAlertViewController.swift
//  HabitClicker
//
//  Created by red.bean on 2020/02/01.
//  Copyright © 2020 hongsii. All rights reserved.
//

import UIKit

extension UIViewController {
    func alert(title: String = "알림", messasge: String) {
        let alert = UIAlertController(title: title, message: messasge, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
