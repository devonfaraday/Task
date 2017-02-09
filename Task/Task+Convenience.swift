//
//  Task+Convenience.swift
//  Task
//
//  Created by Christian McMullin on 2/8/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    @discardableResult convenience init(name: String, notes: String? = nil, due: Date? = nil, isComplete: Bool = false, context: NSManagedObjectContext = CoreDataStack.context ) {
    self.init(context: context)
        self.name = name
        self.notes = notes
        self.due = due as NSDate?
        self.isComplete = isComplete
    }
}
