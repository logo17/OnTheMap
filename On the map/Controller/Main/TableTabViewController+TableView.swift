//
//  TableTabViewController+TableView.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/3/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation
import UIKit

extension TableTabViewController : UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Tableview delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows = studentLocations?.count else {
            return 0
        }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentLocationsCell", for: indexPath)
        cell.textLabel?.text = "\(studentLocations?[indexPath.row].firstName ?? "") \(studentLocations?[indexPath.row].lastName ?? "")"
        cell.detailTextLabel?.text = "\(studentLocations?[indexPath.row].mediaUrl ?? "")"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let url = studentLocations?[indexPath.row].mediaUrl else {
            return
        }
        openUrl(URL(string: url)!)
    }
    
    
}
