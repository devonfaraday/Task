//
//  TaskController.swift
//  Task
//
//  Created by Christian McMullin on 2/8/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation


class TaskController {
    
    static let shared = TaskController()
    var tasks = [Task]()
    
    func add(taskWithName name: String, notes: String?, due: Date?) {
        
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        
    }
    
    func remove(task: Task){
        
    }
    func saveToPersistentStore() {
        
    }
    func fetchTasks() -> [Task] {
        return []
    }
}
