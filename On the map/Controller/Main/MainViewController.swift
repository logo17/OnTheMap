//
//  MainViewController.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/2/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation
import UIKit

class MainViewController : OnTheMapBaseViewController {
    
    var delegate: RetrieveStudentLocationsDelegate!

    @IBAction func logout(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func retrieveLocations(_ sender: Any) {
        showActivityIndicator()
        ParseClient.sharedInstance().retrieveStudentLocations({
            [weak self] (locations, error) in
            self?.hideActivityIndicator()
            if let error = error {
                self?.delegate.onRetrieveStudentLocationsFailure(error)
            } else {
                if let studentLocations = locations?.studentLocations {
                    self?.delegate.onRetrieveStudentLocationsSuccess(studentLocations)
                }
            }
        })
    }
    
    func openUrl(_ url: URL) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
