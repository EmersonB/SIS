//
//  CardContentViewController.swift
//  GradeBook
//
//  Created by Emery Berlik on 12/22/17.
//  Copyright © 2017 Berlik. All rights reserved.
//

import UIKit

class Card2ContentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet var tableView: UITableView!
    var content: [String: AnyObject] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //        self.tableView.separatorStyle = .none
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //        print(content)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content["grades"]!.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("GradeTableViewCell", owner: self, options: nil)?.first as! GradeTableViewCell
        let grades = content["grades"]! as! [String: [String: String]]
        let keys = Array(grades.keys)
        let key = keys[keys.count-indexPath.row-1]
        let val = grades[key]!
        cell.grading_period.text = format_string(key)
        cell.letter.text = val["letter"]!
        cell.percentage.text = val["percentage"]! + "%"
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95.5
    }
    
    func format_string(_ val: String) -> String{
        return val.replacingOccurrences(of: "_", with: " ")
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

