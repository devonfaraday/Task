//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Christian McMullin on 2/8/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController, UITextViewDelegate, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dueTextField.inputView = dueDatePicker
        updateViews()
    }

    // MARK: - Properties
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    var task: Task? {
        didSet {
        if !isViewLoaded {
            loadView()
        }
        updateViews()
        }
    }
    var dueDateValue: Date?
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var dueTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    
    // MARK: - UI Functions
    
    @IBAction func userTappedView(_ sender: Any) {
        taskTextField.resignFirstResponder()
        dueTextField.resignFirstResponder()
        notesTextView.resignFirstResponder()
    }
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        dueDateValue = dueDatePicker.date
        guard let dueDate = dueDateValue else { return }
        dueTextField.text = dueDate.stringValue()
    }
    
    
       @IBAction func cancelButtonTapped(_ sender: Any) {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let task = task,
            let taskName = taskTextField.text,
            let notes = notesTextView.text {
        TaskController.shared.update(task: task, name: taskName, notes: notes, due: dueDateValue)
        } else {
            TaskController.shared.add(taskWithName: taskTextField.text!, notes: notesTextView.text!, due: dueDateValue)
        }
        
        let _ = navigationController?.popViewController(animated: true)
    }
    
    // MARK: - private functions
    private func updateViews() {
    guard let task = task,
        let taskName = task.name,
        let dueText = task.due as Date?,
        let notesText = task.notes else { return }
        
        taskTextField.text = taskName
        dueTextField.text = dueText.stringValue()
        notesTextView.text = notesText
        
        
    }
    

}
