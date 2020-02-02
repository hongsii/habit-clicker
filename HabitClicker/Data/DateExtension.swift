//
//  DateExtension.swift
//  HabitClicker
//
//  Created by red.bean on 2020/02/02.
//  Copyright © 2020 hongsii. All rights reserved.
//

import Foundation

extension Date {
    
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let dateString = dateFormatter.string(from: self)
        return dateFormatter.date(from: dateString)!
    }
}
