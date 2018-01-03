//
//  UdacityUserInformationResponse.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/3/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation

struct UdacityUserInformationResponse {
    
    let firstName: String
    let lastName: String
    
    init(dictionary: [String : AnyObject]) {
        if let user = dictionary["user"] {
            if let _firstName = user["first_name"] {
                firstName = _firstName as! String
            } else {
                firstName = ""
            }
            if let _lastName = user["last_name"] {
                lastName = _lastName as! String
            } else {
                lastName = ""
            }
        } else {
            firstName = ""
            lastName = ""
        }
    }
    
}
