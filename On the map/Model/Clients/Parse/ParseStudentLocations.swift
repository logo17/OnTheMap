//
//  ParseStudentLocations.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/3/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation

struct ParseStudentLocations {
    
    var studentLocations: [ParseStudentLocation]
    
    init(jsonDictionary: [String: AnyObject]) {
        if let results = jsonDictionary["results"] as? [AnyObject] {
            studentLocations = [ParseStudentLocation]()
            for result in results {
                guard let studentLocation = result as? [String : AnyObject] else {
                    return
                }
                studentLocations.append(ParseStudentLocation(jsonDictionary: studentLocation))
            }
        } else {
            studentLocations = [ParseStudentLocation]()
        }
    }
}
