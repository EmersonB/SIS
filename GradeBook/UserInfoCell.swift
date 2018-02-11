//
//  UserCell.swift
//  GradeBook
//
//  Created by Emery Berlik on 12/25/17.
//  Copyright © 2017 Berlik. All rights reserved.
//

import UIKit
import Eureka

final class UserInfoCell: Cell<User>, CellType {
    
    @IBOutlet var photo: UIImageView!
    

    @IBOutlet var grade: UILabel!
    @IBOutlet var school_name: UILabel!
    @IBOutlet var username: UILabel!
    @IBOutlet var full_name: UILabel!
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
        height = { return 144.5 }
        
        // set a light background color for our cell
        backgroundColor = UIColor(red:0.984, green:0.988, blue:0.976, alpha:1.00)
        
        photo.layer.cornerRadius = photo.frame.size.width / 2;
        photo.clipsToBounds = true
        
        photo.layer.borderWidth = 3.0;
        photo.layer.borderColor = UIColor(red: 52/255, green: 73/255, blue: 94/255, alpha: 1).cgColor
    }
    
    override func update() {
        super.update()
        
        // we do not want to show the default UITableViewCell's textLabel
        textLabel?.text = nil
        
        // get the value from our row
        guard let user = row.value else { return }
        grade.text = user.grade
        school_name.text = user.school_name
        username.text = user.username
        full_name.text = user.full_name
        
        let dataDecoded : Data = Data(base64Encoded: user.photo, options: .ignoreUnknownCharacters)!
        let decodedimage = UIImage(data: dataDecoded)
        photo.image = decodedimage
        // set the image to the userImageView. You might want to do this with AlamofireImage or another similar framework in a real project
        

    }
    
}

