//
//  CardViewController.swift
//  GradeBook
//
//  Created by Emery Berlik on 12/22/17.
//  Copyright © 2017 Berlik. All rights reserved.
//

import UIKit
import Cards

var cards = 0
class CardViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        get(url: "/grades/", completionHandler: { data in
//            print(data)
            //String : AnyObject
            for item in data["courses"] as! NSArray {
                if let course = item as? [String: AnyObject]{
                    self.addCard(course: course)
                }
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addCard(course: [String: AnyObject]){
        // Aspect Ratio of 5:6 is preferred
        let card = CardHighlight(frame: CGRect(x: 10, y: 30 + 270 * cards, width: Int(self.view.frame.width - 20) , height: 240))
        
        card.backgroundColor = UIColor(red: 0, green: 94/255, blue: 112/255, alpha: 1)
        card.icon = UIImage(named: "flappy")
        card.title = course["name"] as! String
        card.itemTitle = course["teacher"] as! String
        card.itemSubtitle = "Period \(String(describing: course["period"]!))"
        card.textColor = UIColor.white
        
        card.hasParallax = true
        
        let cardContentVC = storyboard!.instantiateViewController(withIdentifier: "CardContent") as! CardContentViewController
        cardContentVC.content = course
        card.shouldPresent(cardContentVC, from: self, fullscreen: false)
        
        scrollView.addSubview(card)
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: CGFloat(60 + 270 * (cards + 1)))
        cards += 1
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
