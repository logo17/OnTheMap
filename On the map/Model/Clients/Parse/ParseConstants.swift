//
//  ParseConstants.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/3/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation

extension ParseClient {
    
    struct Constants {
        // MARK: URLs
        static let ApiScheme = "https"
        static let ApiHost = "parse.udacity.com"
        static let ApiPath = "/parse/classes"
    }
    
    struct Methods {
        static let StudentLocations = "/StudentLocation"
    }
    
    struct ParameterKeys {
        static let Limit = "limit"
    }
    
    struct ParameterValues {
        static let Limit = "100"
    }
    
    struct HeaderKeys {
        static let ApplicationId = "X-Parse-Application-Id"
        static let RestApi = "X-Parse-REST-API-Key"
    }
    
    struct HeaderValues {
        static let ApplicationId = "QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr"
        static let RestApi = "QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY"
    }
    
}
