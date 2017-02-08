//
//  DateHelper.swift
//  Task
//
//  Created by Christian McMullin on 2/8/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation


extension Date {
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
    }

}
