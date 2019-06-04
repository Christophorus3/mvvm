//
//  Service.swift
//  mvvm
//
//  Created by Christoph Wottawa on 03.06.19.
//  Copyright © 2019 Christoph Wottawa. All rights reserved.
//

import Foundation

/**
 # Service
 
 The Service class helps us get the courses off of letsbuildthatapp.com
 */
class Service: NSObject {
    static let shared = Service()
    
    func fetchCourses(completion: @escaping ([Course]?, Error?) -> ()) {
        let urlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                print("Failed to fetch courses: ", error)
                return
            }
            
            guard let data = data else { return }
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    completion(courses, nil)
                }
            } catch let jsonError {
                print("Failed parsing json: ", jsonError)
            }
        }.resume()
        
    }
    
}
