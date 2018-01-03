//
//  UdacityUserInformation.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/3/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation

class UdacityUserInformation : NSObject {
    
    var userId: String?
    var sessionId: String?
    var firstName: String?
    var lastName: String?
    
    class func sharedInstance() -> UdacityUserInformation {
        struct Singleton {
            static var sharedInstance = UdacityUserInformation()
        }
        return Singleton.sharedInstance
    }
    
}
