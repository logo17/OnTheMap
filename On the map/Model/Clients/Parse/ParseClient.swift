//
//  ParseClient.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/3/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation

class ParseClient : BaseClient {
    let session = URLSession.shared
    
    // MARK: Initializers
    
    override init() {
        super.init()
    }
    
    func taskForGETMethod(_ method : String, _ parameters : [String:AnyObject], completionHandlerForGET: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) -> URLSessionDataTask {
        
        /* 1. Set the parameters */
        var parametersWithApiKey = parameters
        parametersWithApiKey[ParameterKeys.Limit] = ParameterValues.Limit as AnyObject?
        
        /* 2/3. Build the URL, Configure the request */
        let request = NSMutableURLRequest(url: createURLFromParameters(parameters, withPathExtension: method, scheme: Constants.ApiScheme, host: Constants.ApiHost, path: Constants.ApiPath))
        request.httpMethod = "GET"
        request.addValue(HeaderValues.ApplicationId, forHTTPHeaderField: HeaderKeys.ApplicationId)
        request.addValue(HeaderValues.RestApi, forHTTPHeaderField: HeaderKeys.RestApi)
        
        /* 4. Make the request */
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (data, response, error) in
            
            func sendError(_ error: String) {
                let userInfo = [NSLocalizedDescriptionKey : error]
                completionHandlerForGET(nil, NSError(domain: "taskForGETMethod", code: 1, userInfo: userInfo))
            }
            
            /* GUARD: Was there an error> */
            guard (error == nil) else {
                sendError("There was an error with your request: \(error!)")
                return
            }
            
            /* GUARD: Was there any data returned? */
            guard let data = data else {
                sendError("No data was returned by the request!")
                return
            }
            
            /* GUARD: Did we get a successful 2XX response? */
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                self.convertDataWithCompletionHandler(data, completionHandlerForConvertData: completionHandlerForGET)
                return
            }
            
            /* 5/6. Parse the data and use the data (happens in completion handler) */
            self.convertDataWithCompletionHandler(data, completionHandlerForConvertData: completionHandlerForGET)
            
        })
        
        /* 7. Start the request */
        task.resume()
        
        return task
    
    }
    
    // given raw JSON, return a usable Foundation object
    private func convertDataWithCompletionHandler(_ data: Data, completionHandlerForConvertData: (_ result: AnyObject?, _ error: NSError?) -> Void) {
        
        var parsedResult: AnyObject! = nil
        do {
            parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as AnyObject
            if let error = parsedResult["error"] as? String {
                let userInfo = [NSLocalizedDescriptionKey : error]
                completionHandlerForConvertData(nil, NSError(domain: "Server error", code: 1, userInfo: userInfo))
                return
            }
        } catch {
            let userInfo = [NSLocalizedDescriptionKey : "Could not parse the data as JSON: '\(data)'"]
            completionHandlerForConvertData(nil, NSError(domain: "convertDataWithCompletionHandler", code: 1, userInfo: userInfo))
        }
        
        completionHandlerForConvertData(parsedResult, nil)
    }
    
    //MARK: Shared instance
    
    class func sharedInstance() -> ParseClient {
        struct Singleton {
            static var sharedInstance = ParseClient()
        }
        return Singleton.sharedInstance
    }
    
}
