//
//  BaseClient.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/3/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation

class BaseClient : NSObject {
        
    // create a URL from parameters
    func createURLFromParameters(_ parameters: [String:AnyObject], withPathExtension: String? = nil, scheme:String, host: String, path: String) -> URL {
        
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path + (withPathExtension ?? "")
        components.queryItems = [URLQueryItem]()
        
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.queryItems!.append(queryItem)
        }
        
        return components.url!
    }
    
}
