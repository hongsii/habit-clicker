//
//  NewHabitAlertViewController.swift
//  HabitClicker
//
//  Created by red.bean on 2020/02/01.
//  Copyright © 2020 hongsii. All rights reserved.
//

import UIKit

extension UIViewController {
    func alert(title: String = "알림", message: String) {
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        createAlert(title: title, message: message, actions: okAction, handler: nil)
    }
    
    func confirm(title: String = "확인", message: String, handler: ((UIAlertAction) -> Void)?) {
        let cancelAction = UIAlertAction(title: "아니요", style: .default, handler: nil)
        let okAction = UIAlertAction(title: "네", style: .default, handler: handler)
        createAlert(title: title, message: message, actions: cancelAction, okAction, handler: handler)
    }
    
    private func createAlert(title: String, message: String, actions: UIAlertAction..., handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { action in alert.addAction(action) }
        present(alert, animated: true, completion: nil)
    }


}
