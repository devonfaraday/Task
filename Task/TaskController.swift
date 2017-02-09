//
//  TaskController.swift
//  Task
//
//  Created by Christian McMullin on 2/8/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation
import CoreData


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
        let task = Task(name: name, notes: notes, due: due, isComplete: false, context: CoreDataStack.context)
        tasks.append(task)
        saveToPersistentStore()
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due as NSDate?
        saveToPersistentStore()
    }
    
    func remove(task: Task){
        if let moc = task.managedObjectContext {
            moc.delete(task)
            saveToPersistentStore()
        }
    }
    func saveToPersistentStore() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch {
            fatalError("there was a problem: \(error)")
        }
    }
    func fetchTasks() -> [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        return (try? CoreDataStack.context.fetch(request)) ?? []
        
    }
    
    func taskIsCompleteFor(task: Task) {
        if task.isComplete {
        task.isComplete = false
        } else {
        task.isComplete = true
    }

}
}
