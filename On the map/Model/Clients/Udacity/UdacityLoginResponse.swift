//
//  UdacityLoginResponse.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/1/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation
struct UdacityLoginResponse {
    let userID: String
    let sessionID: String
    
    init(dictionary: [String:AnyObject]) {
        if let account = dictionary["account"] {
            userID = account["key"] as! String
        } else {
            userID = ""
        }
        if let session = dictionary["session"] {
            sessionID = session["id"] as! String
        } else {
            sessionID = ""
        }
    }
    
}
