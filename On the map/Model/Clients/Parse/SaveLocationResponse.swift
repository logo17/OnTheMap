//
//  SaveLocationResponse.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/5/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation

struct SaveLocationResponse {
    let objectId: String
    let createdDate: String
    
    init(dictionary: [String: AnyObject]) {
        if let _objectId = dictionary["objectId"] {
            objectId = _objectId as! String
        } else {
            objectId = ""
        }
        if let _createdDate = dictionary["createdDate"] {
            createdDate = _createdDate as! String
        } else {
            createdDate = ""
        }
    }
}
