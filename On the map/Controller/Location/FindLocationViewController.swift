//
//  FindLocationViewController.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/3/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class FindLocationViewController : UIViewController {
    let geoCoder: CLGeocoder = CLGeocoder()
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    
    @IBAction func dismissViewController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func findLocation(_ sender: Any) {
        let errorMessage = checkFields()
        if errorMessage.isEmpty {
            searchLocationFromString(locationTextField.text ?? "")
        } else {
            presentErrorAlertController(title: "Required field", errorMessage: errorMessage, buttonText: "Ok")
        }
    }
    
    //MARK: Private methods
    
    private func searchLocationFromString(_ locationAsString: String) {
        geoCoder.geocodeAddressString(locationAsString) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let location = placemarks.first?.location
                else {
                    self.showNoLocationError()
                    return
            }
                
            // Use your location
            self.lookUpCurrentLocation(location)
        }
    }
    
    private func lookUpCurrentLocation(_ location: CLLocation?) {
        // Use the last reported location.
        if let lastLocation = location {
            // Look up the location and pass it to the completion handler
            geoCoder.reverseGeocodeLocation(lastLocation,
                                            completionHandler: { (placemarks, error) in
                                                if error == nil {
                                                    let firstLocation = placemarks?[0]
                                                    self.performSegue(withIdentifier: "showLocationDetail", sender: firstLocation)
                                                }
                                                else {
                                                    //show location error
                                                    self.showNoLocationError()
                                                }
            })
        }
    }
    
    private func showNoLocationError() {
        presentErrorAlertController(title: "Error", errorMessage: "No location found for this text", buttonText: "Ok")
    }
    
    private func checkFields() -> String {
        var result: String?
        if locationTextField.isTextFieldEmpty() {
            result = "Location text required"
        } else if urlTextField.isTextFieldEmpty() {
            result = "URL text required"
        } else if !urlTextField.isValidURL() {
            result = "Valid URL required"
        }
        return result ?? ""
    }
    
    //MARK: prepare segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLocationDetail" {
            if let placemark = sender as? CLPlacemark {
                let locationDetailViewController = segue.destination as! LocationDetailViewController
                locationDetailViewController.placemark = placemark
            }
        }
    }
    
}
