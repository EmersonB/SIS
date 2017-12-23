//
//  FirstViewController.swift
//  GradeBook
//
//  Created by Emery Berlik on 12/22/17.
//  Copyright © 2017 Berlik. All rights reserved.
//

import UIKit
class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        get(url: "/user/", completionHandler: { data in
            print(data)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

