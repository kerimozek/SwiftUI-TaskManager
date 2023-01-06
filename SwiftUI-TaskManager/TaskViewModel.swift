//
//  TaskViewModel.swift
//  SwiftUI-TaskManager
//
//  Created by Mehmet Kerim ÖZEK on 3.01.2023.
//

import SwiftUI
import CoreData

class TaskViewModel: ObservableObject {
    
    // MARK: New Task Properties
    @Published var currentTab: String = "Today"
    @Published var openEditTask: Bool = false
    @Published var taskTitle: String = ""
    @Published var taskColor: String = "Yellow"
    @Published var taskDeadline: Date = Date()
    @Published var taskType: String = "Basic"
    @Published var showDatePicker: Bool = false
    
    // MARK: Adding Task To Core Data
    func addTask(context: NSManagedObjectContext)-> Bool {
        let task = Task(context: context)
        task.title = taskTitle
        task.color = taskColor
        task.deadline = taskDeadline
        task.type = taskType
        task.isCompleted = false
        
        if let _ = try? context.save() {
            return true
        }
        return false
    }
    
    // MARK: Resetting Data
    func resetTaskData() {
        taskType = "Basic"
        taskColor = "Yellow"
        taskTitle = ""
        taskDeadline = Date()
    }
    
}


