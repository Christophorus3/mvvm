//
//  Course.swift
//  mvvm
//
//  Created by Christoph Wottawa on 02.06.19.
//  Copyright © 2019 Christoph Wottawa. All rights reserved.
//

import Foundation

struct Course: Decodable {
    let id: Int
    let name: String
    let numberOfLessons: Int
}
