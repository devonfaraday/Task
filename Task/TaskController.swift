//
//  TaskController.swift
//  Task
//
//  Created by Christian McMullin on 2/8/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation


class TaskController {
    
    // MARK: - Properties
    static let shared = TaskController()
    var tasks = [Task]()
    
    
    // MARK: - Initializer
    init() {
        tasks = fetchTasks()
    }
    
    // MARK: - Crud
    func add(taskWithName name: String, notes: String?, due: Date?) {
        
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        
    }
    
    func remove(task: Task){
        
    }
    func saveToPersistentStore() {
        
    }
    func fetchTasks() -> [Task] {
        return mockTasks
    }
    
    // MARK: - Mock Data
    
    var mockTasks: [Task] {
        let task1 = Task(name: "Get Sode", isComplete: false)
        let task2 = Task(name: "move car", isComplete: true)
        let task3 = Task(name: "get food", notes: "Milk, eggs, butter, and other stuff", due: Date(),  isComplete: false)
        return [task1, task2, task3]
    }
}
