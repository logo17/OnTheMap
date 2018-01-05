//
//  TableTabViewController.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/3/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation
import UIKit

class TableTabViewController : MainViewController, RetrieveStudentLocationsDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.delegate = self
        tableView.delegate =  self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.reloadData()
        if let _ = ParseStudentLocations.sharedInstance.studentLocations?.count {
            onRetrieveStudentLocationsSuccess()
        } else {
            super.retrieveLocations(self)
        }
    }
    
    //MARK: Delegate
    func onRetrieveStudentLocationsSuccess() {
        performUIUpdatesOnMain {
            self.tableView.reloadData()
        }
    }
    
    func onRetrieveStudentLocationsFailure(_ error: NSError) {
        presentErrorAlertController(title: "Error", errorMessage: error.localizedDescription, buttonText: "Ok")
    }
    
    
}
