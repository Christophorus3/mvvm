//
//  CourseCell.swift
//  mvvm
//
//  Created by Christoph Wottawa on 02.06.19.
//  Copyright © 2019 Christoph Wottawa. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell {
    
    var course: Course! {
        didSet {
            textLabel?.text = course.name
            
            if course.number_of_lessons > 35 {
                accessoryType = .detailDisclosureButton
                detailTextLabel?.text = "Lessons 30+ Check it out!"
            } else {
                detailTextLabel?.text = "Lessons: \(course.number_of_lessons)"
                accessoryType = .none
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        contentView.backgroundColor = isHighlighted ? .highlightColor : .white
        textLabel?.textColor = isHighlighted ? .white : .mainTextBlue
        detailTextLabel?.textColor = isHighlighted ? .white : .black
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        textLabel?.font = .boldSystemFont(ofSize: 24)
        textLabel?.numberOfLines = 0
        detailTextLabel?.textColor = .black
        detailTextLabel?.font = .systemFont(ofSize: 20, weight: .light)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("called init of CourseCell")
    }
}
