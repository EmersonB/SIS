//
//  ProfileViewController.swift
//  GradeBook
//
//  Created by Emery Berlik on 12/25/17.
//  Copyright © 2017 Berlik. All rights reserved.
//

import UIKit
import Eureka

class ProfileViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        
        spinner.startAnimating()
        
        spinner.color = UIColor.black
        //spinner.alpha = 0.0
        
        spinner.center = CGPoint(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height/2)
        
        view.addSubview(spinner)
        
        get(url: "/user/", completionHandler: { data in
            spinner.stopAnimating()
            let username = data["username"] as! String
            let full_name = data["full_name"] as! String
            let school_name = data["school_name"] as! String
            let grade = String(describing: data["grade"] as! Int)
            let photo = data["photo"] as! String
            let schedule = data["schedule"] as! [[String: AnyObject]]
            let user = User(username: username,
                           full_name: full_name,
                           school_name: school_name,
                           grade: grade,
                           photo: photo)
            
            self.form +++ Section()
                <<< UserInfoRow { row in
                    row.value = user
                }
            self.form +++ Section("Schedule")
                for item in schedule{
                    print(item)
                    let course = Course(period: String(describing:item["period"]! as! Int), name: item["name"]! as! String, location: item["location"]! as! String, teacher: item["teacher"]! as! String)
                    self.form.last!

                    <<< ScheduleRow {
                        $0.value = course
                    }
                }
            self.form +++ Section("Settings")
                <<<  ButtonRow() {
                    $0.title = "logout"
                    $0.onCellSelection(self.quit)
            }
        })
        
    }
    
    func quit(cell: ButtonCellOf<String>, row: ButtonRow) {
        logout()
        self.performSegue(withIdentifier: "logoutSegue", sender: self)
    }
}
