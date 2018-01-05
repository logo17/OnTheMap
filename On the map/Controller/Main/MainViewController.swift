//
//  MainViewController.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/2/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation
import UIKit

class MainViewController : UIViewController {
    
    var delegate: RetrieveStudentLocationsDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func logout(_ sender: Any) {
        UdacityClient.sharedInstance.logout() {
            (response, error) in
            performUIUpdatesOnMain {
                if let error = error {
                    // For Logging
                    self.presentErrorAlertController(title: "Error", errorMessage: error.localizedDescription, buttonText: "Ok")
                } else {
                    // For Logging
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func retrieveLocations(_ sender: Any) {
        showActivityIndicator()
        ParseClient.sharedInstance.retrieveStudentLocations({
            [weak self] (locations, error) in
            self?.hideActivityIndicator()
            if let error = error {
                self?.delegate.onRetrieveStudentLocationsFailure(error)
            } else {
                if let studentLocations = locations?.studentLocations {
                    ParseStudentLocations.sharedInstance.studentLocations = studentLocations
                    self?.delegate.onRetrieveStudentLocationsSuccess()
                }
            }
        })
    }
    
    @IBAction func addStudentLocation(_ sender: Any) {
        checkIfUserHasLocations()
    }
    
    
    private func checkIfUserHasLocations() {
        showActivityIndicator()
        ParseClient.sharedInstance.retrieveStudentLocation(UdacityUserInformation.sharedInstance.userId ?? ""){
            [unowned self] (locations, error) in
            self.hideActivityIndicator()
            if let error = error {
                self.presentErrorAlertController(title: "Error checking user locations", errorMessage: error.localizedDescription, buttonText: "Ok")
            } else {
                if let studentLocations = locations?.studentLocations {
                    if (studentLocations.count > 0) {
                        UdacityUserInformation.sharedInstance.locationId = studentLocations.first?.objectId
                        self.presentAlreadyHasLocationErrorAlertController()
                    } else {
                        performUIUpdatesOnMain {
                            self.showAddLocationViewController()
                        }
                    }
                }
            }
        }
    }
    
    func openUrl(_ url: URL) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    private func presentAlreadyHasLocationErrorAlertController() {
        let alert = UIAlertController(title: "Alert", message: "You already have a location saved. Do you want to overwrite it?", preferredStyle: .alert)
        let overwriteAction = UIAlertAction(title: "Overwrite", style: .default, handler: {action in
            self.showAddLocationViewController()
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(overwriteAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func showAddLocationViewController() {
        self.performSegue(withIdentifier: "showAddLocation", sender: self)
    }
    
}
