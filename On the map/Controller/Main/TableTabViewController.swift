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
        tableView.delegate =  self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        super.delegate = self
        super.retrieveLocations(self as Any!)
    }
    
    var studentLocations: [ParseStudentLocation]?
    
    //MARK: Delegate
    func onRetrieveStudentLocationsSuccess(_ locations: [ParseStudentLocation]) {
        studentLocations = locations
        performUIUpdatesOnMain {
            self.tableView.reloadData()
        }
    }
    
    func onRetrieveStudentLocationsFailure(_ error: NSError) {
        
    }
    
    
}
