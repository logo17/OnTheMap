//
//  ParseConvenience.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/3/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation

extension ParseClient {
    
    func retrieveStudentLocations(_ completionForRetrieveStudentLocations: @escaping (_ response: ParseStudentLocations?, _ error: NSError?) -> Void) {
        let method = Methods.StudentLocations
        
        var parameters : [String:AnyObject] = [String:AnyObject]()
        parameters[ParameterKeys.Limit] = ParameterValues.Limit as AnyObject?
        
        /* 2. Make the request */
        let _ = taskForGETMethod(method, parameters) {
            (response, error) in
            
            /* 3. Send the desired value(s) to completion handler */
            if let error = error {
                completionForRetrieveStudentLocations(nil, error)
            } else {
                let parseLocationsResponse = ParseStudentLocations(jsonDictionary: response as! [String : AnyObject])
                completionForRetrieveStudentLocations(parseLocationsResponse, nil)
            }
            
        }
    }
    
}
