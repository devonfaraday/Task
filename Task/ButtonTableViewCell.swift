//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Christian McMullin on 2/8/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.buttonCellButtonTapped(self)
    }
    
    var delegate: ButtonTableViewCellDelegate?
    
    func updateButton(_ isComplete: Bool) {
        if isComplete != true {
            completeButton.setImage(#imageLiteral(resourceName: "incomplete"), for: .normal)
        } else  {
            completeButton.setImage(#imageLiteral(resourceName: "complete"), for: .normal)
        }
        
    }
    
}

extension ButtonTableViewCell {
    func update(withTask task: Task) {
        primaryLabel.text = task.name
        updateButton(task.isComplete)
    }
}

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}


/*
 
 func taskCompleteAlert() {
 let alertviewController = UIAlertController(title: "Task Complete", message: "Mark this task as complete?", preferredStyle: .alert)
 
 let completeAction = UIAlertAction(title: "Complete", style: .default) { alert -> Void in
 
 }
 
 let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { alert -> Void in
 
 }
 
 alertviewController.addAction(completeAction)
 alertviewController.addAction(cancelAction)
 
 present(alertviewController, animated: true, completion: nil)
 }

 
 */
