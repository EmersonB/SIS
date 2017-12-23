//
//  CardContentViewController.swift
//  GradeBook
//
//  Created by Emery Berlik on 12/22/17.
//  Copyright © 2017 Berlik. All rights reserved.
//

import UIKit

class CardContentViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var content: [String: AnyObject] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.separatorStyle = .none
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(content)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
