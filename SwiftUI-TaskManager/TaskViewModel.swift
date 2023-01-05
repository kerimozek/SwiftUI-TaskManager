//
//  TaskViewModel.swift
//  SwiftUI-TaskManager
//
//  Created by Mehmet Kerim ÖZEK on 3.01.2023.
//

import SwiftUI
import CoreData

class TaskViewModel: ObservableObject {
    @Published var currentTab: String = "Today"
    @Published var openEditTask: Bool = false
    @Published var taskTitle: String = ""
    @Published var taskColor: String = "Yellow"
    @Published var taskDeadline: Date = Date()
    @Published var taskType: String = "Basic"
}


