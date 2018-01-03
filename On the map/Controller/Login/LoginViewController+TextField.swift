//
//  LoginViewController+TextField.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 12/31/17.
//  Copyright © 2017 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
