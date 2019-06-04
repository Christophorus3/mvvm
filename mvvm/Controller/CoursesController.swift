//
//  CoursesController.swift
//  mvvm
//
//  Created by Christoph Wottawa on 02.06.19.
//  Copyright © 2019 Christoph Wottawa. All rights reserved.
//

import UIKit

class CoursesController: UITableViewController {

    var courses = [Course]()
    let cellId = "CourseCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        setupTableView()
        fetchData()
    }
    
    fileprivate func fetchData() {
        Service.shared.fetchCourses { (courses, error) in
            if let error = error {
                print("Failed to fetch courses: ", error)
                return
            }
            
            self.courses = courses ?? []
            self.tableView.reloadData()
        }
    }
    
    fileprivate func setupNavBar() {
        navigationItem.title = "Courses"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .yellow
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = .rgb(r: 50, g: 199, b: 242)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    fileprivate func setupTableView() {
        tableView.register(CourseCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .mainTextBlue
        tableView.backgroundColor = .rgb(r: 12, g: 47, b: 57)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! CourseCell
        let course = courses[indexPath.row]
        cell.course = course
        return cell
    }

}

class CustomNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension UIColor {
    static let mainTextBlue = UIColor.rgb(r: 7, g: 71, b: 89)
    static let highlightColor = UIColor.rgb(r: 50, g: 199, b: 242)
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
