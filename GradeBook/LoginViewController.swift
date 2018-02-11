//
//  LoginViewController.swift
//  GradeBook
//
//  Created by Emery Berlik on 1/25/18.
//  Copyright © 2018 Berlik. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var idInput: UITextField!
    @IBOutlet var passwordInput: UITextField!
    @IBOutlet var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loggin_pressed(_ sender: Any) {
        test_login(new_user: idInput.text!, new_password: passwordInput.text!)
        get(url: "/user/", completionHandler: { data in
            if data["error"] != nil {
                self.errorLabel.text = "Invalid login"
            }
            else{
                set_login(new_user: self.idInput.text!, new_password: self.passwordInput.text!)
                let fcm = UserDefaults.standard.object(forKey: "fcmToken")
                register_device(fcmToken: fcm as! String)
                self.performSegue(withIdentifier: "loginSegue", sender: self)
            }
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
