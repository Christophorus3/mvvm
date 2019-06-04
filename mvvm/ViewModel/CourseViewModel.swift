//
//  CourseViewModel.swift
//  mvvm
//
//  Created by Christoph Wottawa on 04.06.19.
//  Copyright © 2019 Christoph Wottawa. All rights reserved.
//

import Foundation

struct CourseViewModel {
    
    let name: String
    
    init(course: Course) {
        self.name = course.name
    }
}
