//
//  NewHabitViewController.swift
//  HabitClicker
//
//  Created by red.bean on 2020/02/01.
//  Copyright © 2020 hongsii. All rights reserved.
//

import UIKit

class NewHabitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var contentTextView: UITextView!
    
    @IBAction func save(_ sender: Any) {
        guard let content = self.contentTextView.text,
            !content.isEmpty else {
                alert(messasge: "내용을 입력하세요.")
                return
        }
        Habit.items.append(Habit(content: content))
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
