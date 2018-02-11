//
//  ScheduleInfoCell.swift
//  GradeBook
//
//  Created by Emery Berlik on 12/25/17.
//  Copyright © 2017 Berlik. All rights reserved.
//

import UIKit
import Eureka

final class ScheduleInfoCell: Cell<Course>, CellType {


    @IBOutlet var name: UILabel!
    @IBOutlet var teacher: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var period: UILabel!
    required init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setup() {
        super.setup()
        // we do not want our cell to be selected in this case. If you use such a cell in a list then you might want to change this.
        selectionStyle = .none
        
        // configure our profile picture imageView
        
        // specify the desired height for our cell
        height = { return 92 }
        
        // set a light background color for our cell
        backgroundColor = UIColor(red:0.984, green:0.988, blue:0.976, alpha:1.00)
        
    }
    
    override func update() {
        super.update()
        textLabel?.text = nil
        
        // get the value from our row
        guard let schedule = row.value else { return }
        period.text = "Period: " + schedule.period
        location.text = "Room: " + schedule.location
        teacher.text = schedule.teacher
        name.text = schedule.name
        
        
        
    }
    
}
