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
    
    static var items: [Habit] = []
}
