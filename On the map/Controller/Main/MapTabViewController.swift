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
        mapView.delegate =  self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        super.delegate = self
        super.retrieveLocations(self as Any!)
    }
    
    //MARK - Delegate
    func onRetrieveStudentLocationsSuccess(_ locations: [ParseStudentLocation]) {
        performUIUpdatesOnMain {
            for location in locations {
                self.mapView.addAnnotation(OnTheMapAnnotation(title: "\(location.firstName) \(location.lastName)", url: location.mediaUrl, coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)))
            }
        }
    }
    
    func onRetrieveStudentLocationsFailure(_ error: NSError) {
        print(error)
    }
    
}
