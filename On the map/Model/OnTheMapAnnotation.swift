//
//  OnTheMapAnnotation.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/3/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import MapKit

class OnTheMapAnnotation : NSObject, MKAnnotation {
    let title: String?
    let url: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, url: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.url = url
        self.coordinate = coordinate
        
        super.init()
    }
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        self.url = ""
        super.init()
    }
    
    var subtitle: String? {
        return url
    }
}
