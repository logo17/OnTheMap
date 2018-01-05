//
//  MapTabViewController.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/2/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapTabViewController : MainViewController, CLLocationManagerDelegate, RetrieveStudentLocationsDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.delegate = self
        mapView.delegate =  self
        if let _ = ParseStudentLocations.sharedInstance.studentLocations?.count {
            onRetrieveStudentLocationsSuccess()
        } else {
            super.retrieveLocations(self)
        }
    }
    
    //MARK - Delegate
    func onRetrieveStudentLocationsSuccess() {
        performUIUpdatesOnMain {
            self.mapView.removeAnnotations(self.mapView.annotations)
            for location in ParseStudentLocations.sharedInstance.studentLocations! {
                self.mapView.addAnnotation(OnTheMapAnnotation(title: "\(location.firstName) \(location.lastName)", url: location.mediaUrl, coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)))
            }
        }
    }
    
    func onRetrieveStudentLocationsFailure(_ error: NSError) {
        presentErrorAlertController(title: "Error", errorMessage: error.localizedDescription, buttonText: "Ok")
    }
    
}
