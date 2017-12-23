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

let user = "1645711"
let password = "TrekFur17105"
let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
let base64Credentials = credentialData.base64EncodedString(options: [])
let headers = ["Authorization": "Basic \(base64Credentials)"]

let base_url = "https://sis.okulkarni.me"

func get(url: String, completionHandler: @escaping (_ data: [String : AnyObject]) -> ()){
    Alamofire.request(base_url + url, method: .get, parameters: nil, encoding: URLEncoding.default, headers:headers)
        .validate()
        .responseJSON { response in
            if response.result.value != nil{
                do {
                    let res = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String:AnyObject]
                    
                    if res != nil {
                        completionHandler(res!)
                    }
                } catch let error as NSError {
                    print(error)
                }
            }else{
                
            }
    }
}

