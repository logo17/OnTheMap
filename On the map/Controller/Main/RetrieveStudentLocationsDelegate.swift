//
//  RetrieveStudentLocationsDelegate.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/3/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation

protocol RetrieveStudentLocationsDelegate {
    func onRetrieveStudentLocationsSuccess(_ locations: [ParseStudentLocation])
    func onRetrieveStudentLocationsFailure(_ error: NSError)
}
