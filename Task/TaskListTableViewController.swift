//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Christian McMullin on 2/9/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit
import CoreData


class TaskListTableViewController: UITableViewController, ButtonTableViewCellDelegate {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let sections = TaskController.shared.fetchResultsController.sections else { return 0 }
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = TaskController.shared.fetchResultsController.sections else {
         return TaskController.shared.fetchResultsController.fetchedObjects?.count ?? 0
        }
        let sectionInfo = sections[section]
        return sectionInfo.numberOfObjects
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.taskCellKey, for: indexPath) as? ButtonTableViewCell else { return ButtonTableViewCell() }
        guard let tasks = TaskController.shared.fetchResultsController.fetchedObjects else { return cell }
        let task = tasks[indexPath.row]
        
        cell.update(withTask: task)
        cell.delegate = self
        
        return cell
    }
    
    
    
    /*
     
     func buttonCellButtonTapped(_ sender: ButtonTableViewCell) {
     guard let indexPath = tableView.indexPath(for: sender) else { return }
     let task = TaskController.shared.tasks[indexPath.row]
     TaskController.shared.taskIsCompleteFor(task: task)
     tableView.reloadRows(at: [indexPath], with: .automatic)
     
     
     }
     
     */
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = TaskController.shared.fetchResultsController.object(at: indexPath)
            TaskController.shared.remove(task: task)
        }
    }
    
    // MARK: - Delegate Method
    
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell) {
        guard let indexPath = tableView.indexPath(for: sender) else { return }
       let task = TaskController.shared.fetchResultsController.object(at: indexPath)
        //let task = tasks[indexPath.row]
        TaskController.shared.taskIsCompleteFor(task: task)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tasks = TaskController.shared.fetchResultsController.fetchedObjects,
            let indexPath = tableView.indexPathForSelectedRow,
            let detailsVC = segue.destination as? TaskDetailTableViewController else { return }
        if segue.identifier == PropertyKeys.taskDetailSegueKey {
            detailsVC.loadViewIfNeeded()
        let task = tasks[indexPath.row]
        detailsVC.task = task
        
        }
        
        
    }
    
    let actionController = UIAlertController(title: "Grocery List", message: "This is the messsage", preferredStyle: .alert)

    
    
    //MARK: - NSFetchedResultsControllerDelegate
    
//    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
//        switch type {
//        case .delete:
//            guard let indexPath = indexPath else { return }
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        case .insert:
//            guard let newIndexPath = newIndexPath else { return }
//            tableView.insertRows(at: [newIndexPath], with: .automatic)
//        case .move:
//            guard let indexPath = indexPath,
//                let newIndexPath = newIndexPath else { return }
//            tableView.moveRow(at: indexPath, to: newIndexPath)
//        case .update:
//            guard let indexPath = indexPath else { return }
//            tableView.reloadRows(at: [indexPath], with: .automatic)
//        
//        }
//    }
    
}
