//
//  Task+CoreDataProperties.swift
//  SwiftUI-TaskManager
//
//  Created by Mehmet Kerim ÖZEK on 6.01.2023.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var color: String?
    @NSManaged public var deadline: Date?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var title: String?
    @NSManaged public var type: String?

}

extension Task : Identifiable {

}
