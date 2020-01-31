//
//  Habit.swift
//  HabitClicker
//
//  Created by red.bean on 2020/01/31.
//  Copyright © 2020 hongsii. All rights reserved.
//

import Foundation

class Habit {
    
    var content: String
    var createdAt: Date
    
    init(content: String) {
        self.content = content
        createdAt = Date()
    }
    
    static var habits = [
        Habit(content: "6시 기상"),
        Habit(content: "8시 출근")
    ]
}
