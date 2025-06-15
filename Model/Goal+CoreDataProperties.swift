//
//  Goal+CoreDataProperties.swift
//  LifeTarget
//
//  Created by HarrisShao on 2025/6/15.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var goalText: String?
    @NSManaged public var targetDate: Date?
    @NSManaged public var currentProgess: Int64

}

extension Goal : Identifiable {

}
