//
//  api.swift
//  GradeBook
//
//  Created by Emery Berlik on 12/22/17.
//  Copyright © 2017 Berlik. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

var user = UserDefaults.standard.object(forKey: "user") ?? ""
var password = UserDefaults.standard.object(forKey: "password") ?? ""
var credentialData = "\(String(describing: user)):\(String(describing: password))".data(using: String.Encoding.utf8)!
var base64Credentials = credentialData.base64EncodedString(options: [])
var headers = ["Authorization": "Basic \(base64Credentials)"]

let base_url = "https://sis.okulkarni.me"
let query = "?save_password=True"

func test_login(new_user: String, new_password: String){
    user = new_user
    password = new_password

    credentialData = "\(String(describing: user)):\(String(describing: password))".data(using: String.Encoding.utf8)!
    base64Credentials = credentialData.base64EncodedString(options: [])
    headers = ["Authorization": "Basic \(base64Credentials)"]
    
}

func set_login(new_user: String, new_password: String){
    user = new_user
    password = new_password
    
    UserDefaults.standard.set(true, forKey: "loggedIn")
    UserDefaults.standard.set(user, forKey: "user")
    UserDefaults.standard.set(password, forKey: "password")
    
    credentialData = "\(String(describing: user)):\(String(describing: password))".data(using: String.Encoding.utf8)!
    base64Credentials = credentialData.base64EncodedString(options: [])
    headers = ["Authorization": "Basic \(base64Credentials)"]
    
}

func logout(){
    UserDefaults.standard.set(false, forKey: "loggedIn")
}

func get(url: String, completionHandler: @escaping (_ data: [String : AnyObject]) -> ()){
    Alamofire.request(base_url + url + query, method: .get, parameters: nil, encoding: URLEncoding.default, headers:headers)
        .validate()
        .responseJSON { response in
            if response.result.value != nil{
                do {
                    let res = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String:AnyObject]
                    
                    if res != nil {
                        completionHandler(res!)
                    }
                } catch let error as NSError {
//                    print(error)
                    completionHandler(["error": error])
                }
            }else{
                print("ERROR")
                completionHandler(["error": "error" as AnyObject])
            }
    }
}

func post(url: String, parameters: [String: AnyObject], completionHandler: @escaping (_ data: [String : AnyObject]) -> ()){
    Alamofire.request(base_url + url + query, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers)
        .validate()
        .responseJSON { response in
            if response.result.value != nil{
                do {
                    let res = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String:AnyObject]
                    
                    if res != nil {
                        completionHandler(res!)
                    }
                } catch let error as NSError {
                    //                    print(error)
                    completionHandler(["error": error])
                }
            }else{
                print("ERROR")
                completionHandler(["error": "error" as AnyObject])
            }
    }
}

struct User: Equatable {
    var username: String
    var full_name: String
    var school_name: String
    var grade: String
    var photo: String
}

func ==(lhs: User, rhs: User) -> Bool {
    return lhs.username == rhs.username
}

struct Course: Equatable {
    var period: String
    var name: String
    var location: String
    var teacher: String
}

func ==(lhs: Course, rhs: Course) -> Bool {
    return lhs.name == rhs.name
}

func register_device(fcmToken: String){
    let params: [String: AnyObject] = [
        "registration_id" : fcmToken as AnyObject,
        "active" : true as AnyObject,
        "type" : "ios" as AnyObject
    ]
    post(url: "/devices/", parameters: params, completionHandler: { data in
        print(data)
    })
}

