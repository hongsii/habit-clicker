//
//  HabitCountHistory+CoreDataProperties.swift
//  HabitClicker
//
//  Created by red.bean on 2020/02/02.
//  Copyright © 2020 hongsii. All rights reserved.
//
//

import Foundation
import CoreData


extension HabitCountHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HabitCountHistory> {
        return NSFetchRequest<HabitCountHistory>(entityName: "HabitCountHistory")
    }

    @NSManaged public var count: Int16
    @NSManaged public var closedAt: Date?
    @NSManaged public var habit: Habit?

}
