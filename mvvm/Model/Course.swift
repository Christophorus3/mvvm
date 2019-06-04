//
//  Course.swift
//  mvvm
//
//  Created by Christoph Wottawa on 02.06.19.
//  Copyright © 2019 Christoph Wottawa. All rights reserved.
//

import Foundation

/**
 # Course
 
 A Course contains all the information of an LBTA course.
 */

struct Course: Decodable {
    let id: Int
    let name: String
    let number_of_lessons: Int
}
