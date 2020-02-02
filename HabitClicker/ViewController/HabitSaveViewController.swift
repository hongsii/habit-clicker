//
//  NewHabitViewController.swift
//  HabitClicker
//
//  Created by red.bean on 2020/02/01.
//  Copyright © 2020 hongsii. All rights reserved.
//

import UIKit

class HabitSaveViewController: UIViewController {
    
    var habitForEdit: Habit?
    private var originalContent: String?
    
    @IBOutlet weak var contentTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let habit = habitForEdit {
            navigationItem.title = "습관 편집"
            contentTextView.text = habit.content
            originalContent = habit.content
        }
        
        contentTextView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.presentationController?.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.presentationController?.delegate = nil
    }
    
    @IBAction func add(_ sender: Any) {
        guard let content = self.contentTextView.text,
            !content.isEmpty else {
                alert(message: "내용을 입력하세요.")
                return
        }
        
        if let habit = habitForEdit {
            habit.content = content
            DataManager.shared.saveContext()
        } else {
            DataManager.shared.addNewHabit(content)
        }
        NotificationCenter.default.post(name: HabitSaveViewController.refresh, object: nil)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension HabitSaveViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        if let origin = originalContent, let edited = textView.text {
            if #available(iOS 13.0, *) {
                isModalInPresentation = origin != edited
            } else {
                // Support only 13.0
            }
        }
    }
    
}

extension HabitSaveViewController: UIAdaptivePresentationControllerDelegate {
    
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        confirm(message: "편집 중인 내용이 있습니다.\n그래도 나가시겠어요?") { action -> Void in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

extension HabitSaveViewController {
    
    static let refresh = Notification.Name(rawValue: "refresh")
    
}
