//
//  Habit+CoreDataProperties.swift
//  HabitClicker
//
//  Created by red.bean on 2020/02/02.
//  Copyright © 2020 hongsii. All rights reserved.
//
//

import Foundation
import CoreData


extension Habit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Habit> {
        return NSFetchRequest<Habit>(entityName: "Habit")
    }

    @NSManaged public var content: String?
    @NSManaged public var count: Int16
    @NSManaged public var createdAt: Date?
    @NSManaged public var order: Int16
    @NSManaged public var countHistories: Set<HabitCountHistory>?

}

// MARK: Generated accessors for countHistories
extension Habit {

    @objc(addCountHistoriesObject:)
    @NSManaged public func addToCountHistories(_ value: HabitCountHistory)

    @objc(removeCountHistoriesObject:)
    @NSManaged public func removeFromCountHistories(_ value: HabitCountHistory)

    @objc(addCountHistories:)
    @NSManaged public func addToCountHistories(_ values: NSSet)

    @objc(removeCountHistories:)
    @NSManaged public func removeFromCountHistories(_ values: NSSet)

}
