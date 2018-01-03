//
//  TextField+Utils.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/3/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func isTextFieldEmpty() -> Bool {
        var result = true
        if let text = self.text {
            result = text.isEmpty
        }
        return result
    }
    
    func isValidURL() -> Bool {
        if let text = self.text {
            if let url = URL(string: text) {
                return UIApplication.shared.canOpenURL(url)
            }
        }
        return true
    }
}
