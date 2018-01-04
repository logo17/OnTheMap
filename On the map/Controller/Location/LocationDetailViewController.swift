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
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let latitude = (placemark.location?.coordinate.latitude)!
        let longitude = (placemark.location?.coordinate.longitude)!
        
        mapView.addAnnotation(OnTheMapAnnotation(title: "\(placemark.administrativeArea ?? "") \(placemark.country ?? "")", coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude)))
        
        let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        
        mapView.setRegion(region, animated: true)
        
    }
    
    @IBAction func saveStudentLocation(_ sender: Any) {
    }
    
}
