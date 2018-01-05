//
//  ParseConvenience.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/3/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation

extension ParseClient {
    
    func retrieveStudentLocations(_ completionForRetrieveStudentLocations: @escaping (_ response: ParseStudentLocationsResponse?, _ error: NSError?) -> Void) {
        /* 1. Method and parameters */
        let method = Methods.studentLocations
        
        var parameters : [String:AnyObject] = [String:AnyObject]()
        parameters[ParameterKeys.order] = ParameterValues.order as AnyObject?
        parameters[ParameterKeys.limit] = ParameterValues.limit as AnyObject?
        
        /* 2. Make the request */
        let _ = taskForGETMethod(method, parameters) {
            (response, error) in
            
            /* 3. Send the desired value(s) to completion handler */
            if let error = error {
                completionForRetrieveStudentLocations(nil, error)
            } else {
                let parseLocationsResponse = ParseStudentLocationsResponse(jsonDictionary: response as! [String : AnyObject])
                completionForRetrieveStudentLocations(parseLocationsResponse, nil)
            }
            
        }
    }
    
    func retrieveStudentLocation(_ userId: String, _ completionForRetrieveStudentLocations: @escaping (_ response: ParseStudentLocationsResponse?, _ error: NSError?) -> Void) {
        let method = Methods.studentLocations
        
        var parameters : [String:AnyObject] = [String:AnyObject]()
        parameters[ParameterKeys.whereKey] = "{\"uniqueKey\":\"\(userId)\"}" as AnyObject?
        
        /* 2. Make the request */
        let _ = taskForGETMethod(method, parameters) {
            (response, error) in
            
            /* 3. Send the desired value(s) to completion handler */
            if let error = error {
                completionForRetrieveStudentLocations(nil, error)
            } else {
                let parseLocationsResponse = ParseStudentLocationsResponse(jsonDictionary: response as! [String : AnyObject])
                completionForRetrieveStudentLocations(parseLocationsResponse, nil)
            }
            
        }
    }
    
    func saveStudentLoction(_ locationObjectId: String, _ userId: String, _ firstName: String, _ lastName: String, _ mapString: String, _ mediaUrl: String, _ latitude: Double, _ longitude: Double, completionForSaveStudentLocation: @escaping (_ response: SaveLocationResponse?, _ error: NSError?) -> Void) {
        
        let httpMethod = locationObjectId.isEmpty ? "POST" : "PUT"
        
        let objectIdPath = locationObjectId.isEmpty ? "" : "/\(locationObjectId)"
        let method = "\(Methods.studentLocations)\(objectIdPath)"
        
        
        /* 2. Create the body */
        
        let body = "{\"uniqueKey\": \"\(userId)\", \"firstName\": \"\(firstName)\", \"lastName\": \"\(lastName)\",\"mapString\": \"\(mapString)\", \"mediaURL\": \"\(mediaUrl)\",\"latitude\": \(latitude), \"longitude\": \(longitude)}".data(using: .utf8)
        
        /* 2. Make the request */
        let _ = taskForPOSTPUTMethod(httpMethod, method, body, [:]) {
            (response, error) in
            
            /* 3. Send the desired value(s) to completion handler */
            if let error = error {
                completionForSaveStudentLocation(nil, error)
            } else {
                let saveLocationResponse = SaveLocationResponse(dictionary: response as! [String: AnyObject])
                completionForSaveStudentLocation(saveLocationResponse, nil)
            }
            
        }
    }
    
}
