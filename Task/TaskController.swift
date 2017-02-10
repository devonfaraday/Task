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
    
    
    let fetchResultsController: NSFetchedResultsController<Task>
    
    //    var fetchRequest:  NSFetchRequest<Task> {
    //        let isCompleteDescriptor = NSSortDescriptor(key: "isComplete", ascending: true)
    //        let dueDescriptor = NSSortDescriptor(key: "due", ascending: true)
    //
    //        let request: NSFetchRequest<Task> = Task.fetchRequest()
    //        request.sortDescriptors = [isCompleteDescriptor, dueDescriptor]
    //
    //        return request
    //    }
    
    
    static let shared = TaskController()
    
    
    // var tasks = [Task]()
    
    
    
    // MARK: - Initializer
    init() {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let isCompleteSortDescriptor = NSSortDescriptor(key: "isComplete", ascending: true)
        let dueSortDescriptor = NSSortDescriptor(key: "due", ascending: true)
        fetchRequest.sortDescriptors = [isCompleteSortDescriptor, dueSortDescriptor]
        // tasks = fetchTasks()
        self.fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
            try fetchResultsController.performFetch()
        } catch let error {
            print("\(error)")
        }
        
        
        
    }
    
    
    
    /*
     
     Inside your initializer, after having initialized your fetchedResultsController, you will need to call performFetch() on it.
     note: You will need to use the do, try, catch syntax since performFetch() is a throwing function. The catch should print out an error if there is one.
     
     */
    
    // MARK: - Crud
    func add(taskWithName name: String, notes: String?, due: Date?) {
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
    
    //    func fetchTasks() -> [Task] {
    //        let request: NSFetchRequest<Task> = Task.fetchRequest()
    //        return (try? CoreDataStack.context.fetch(request)) ?? []
    //
    //    }
    
    func taskIsCompleteFor(task: Task)  {
        if task.isComplete {
            task.isComplete = false
        } else {
            task.isComplete = true
        }
        
    }
}
