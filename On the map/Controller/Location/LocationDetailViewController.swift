//
//  LocationDetailViewController.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/3/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class LocationDetailViewController : UIViewController, CLLocationManagerDelegate {
    
    var placemark: CLPlacemark!
    var mediaUrl: String!
    
    var latitude: Double!
    var longitude: Double!
    var mapString: String!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        latitude = (placemark.location?.coordinate.latitude)!
        longitude = (placemark.location?.coordinate.longitude)!
        mapString = "\(placemark.administrativeArea ?? "") \(placemark.country ?? "")"
        
        mapView.addAnnotation(OnTheMapAnnotation(title: mapString, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude)))
        
        let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        
        mapView.setRegion(region, animated: true)
        
    }
    
    @IBAction func saveStudentLocation(_ sender: Any) {
        let objectId = UdacityUserInformation.sharedInstance.locationId ?? ""
        let userId = UdacityUserInformation.sharedInstance.userId ?? ""
        let firstName = UdacityUserInformation.sharedInstance.firstName ?? ""
        let lastName = UdacityUserInformation.sharedInstance.lastName ?? ""
        
        showActivityIndicator()
        ParseClient.sharedInstance.saveStudentLoction(objectId, userId, firstName, lastName, mapString, mediaUrl, latitude, longitude) {
            (response, error) in
            performUIUpdatesOnMain {
                self.hideActivityIndicator()
                if let error = error {
                    self.presentErrorAlertController(title: "Error", errorMessage: error.localizedDescription, buttonText: "Ok")
                } else {
                    self.navigationController?.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
}
