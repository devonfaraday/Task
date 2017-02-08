//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Christian McMullin on 2/8/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.shared.tasks.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.taskCellKey, for: indexPath)
        let task = TaskController.shared.tasks[indexPath.row]
        
        cell.textLabel?.text = task.name
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = TaskController.shared.tasks[indexPath.row]
            TaskController.shared.remove(task: task)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
}
