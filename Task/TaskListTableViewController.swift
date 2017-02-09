//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Christian McMullin on 2/8/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController, ButtonTableViewCellDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.shared.tasks.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.taskCellKey, for: indexPath) as? ButtonTableViewCell else { return ButtonTableViewCell() }
        let task = TaskController.shared.tasks[indexPath.row]
        
        cell.update(withTask: task)
        cell.delegate = self
        
       return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = TaskController.shared.tasks[indexPath.row]
            TaskController.shared.remove(task: task)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    // MARK: - Delegate Method
    
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell) {
        guard let indexPath = tableView.indexPath(for: sender) else { return }
        let task = TaskController.shared.tasks[indexPath.row]
        TaskController.shared.taskIsCompleteFor(task: task)
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
        
    }
   
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let detailVC = segue.destination as? TaskDetailTableViewController else { return }
        if segue.identifier == PropertyKeys.taskDetailSegueKey {
            let task = TaskController.shared.tasks[indexPath.row]
            detailVC.task = task
            detailVC.dueDateValue = task.due as Date?
        }
        
    }
    
       
    
}
