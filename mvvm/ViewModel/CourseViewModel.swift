//
//  CourseViewModel.swift
//  mvvm
//
//  Created by Christoph Wottawa on 04.06.19.
//  Copyright © 2019 Christoph Wottawa. All rights reserved.
//

import Foundation
import UIKit

struct CourseViewModel {
    
    let name: String
    let detailText: String
    let accessoryType: UITableViewCell.AccessoryType
    
    init(course: Course) {
        self.name = course.name
        
        if course.number_of_lessons > 35 {
            detailText = "Lessons 30+ Check it out!"
            accessoryType = .detailDisclosureButton
        } else {
            detailText = "Lessons: \(course.number_of_lessons)"
            accessoryType = .none
        }
    }
}
