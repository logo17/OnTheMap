//
//  ParseStudentLocation.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/3/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation

struct ParseStudentLocation {
    let objectId: String
    let uniqueKey: String
    let firstName: String
    let lastName: String
    let mapString: String
    let mediaUrl: String
    let latitude: Double
    let longitude: Double
    
    init(jsonDictionary: [String: AnyObject]) {
        if let _objectId = jsonDictionary["objectId"] {
            objectId = _objectId as! String
        } else {
            objectId = ""
        }
        
        if let _uniqueKey = jsonDictionary["uniqueKey"] {
            uniqueKey = _uniqueKey as! String
        } else {
            uniqueKey = ""
        }
        
        if let _firstName = jsonDictionary["firstName"] {
            firstName = _firstName as! String
        } else {
            firstName = ""
        }
        
        if let _lastName = jsonDictionary["lastName"] {
            lastName = _lastName as! String
        } else {
            lastName = ""
        }
        
        if let _mapString = jsonDictionary["mapString"] {
            mapString = _mapString as! String
        } else {
            mapString = ""
        }
        
        if let _mediaUrl = jsonDictionary["mediaURL"] {
            mediaUrl = _mediaUrl as! String
        } else {
            mediaUrl = ""
        }
        
        if let _latitude = jsonDictionary["latitude"] {
            latitude = _latitude as! Double
        } else {
            latitude = 0
        }
        
        if let _longitude = jsonDictionary["longitude"] {
            longitude = _longitude as! Double
        } else {
            longitude = 0
        }
        
        
    }
}
