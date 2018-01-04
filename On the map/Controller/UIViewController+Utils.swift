//
//  UIViewController+Utils.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/3/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentErrorAlertController(title: String, errorMessage: String, buttonText: String) {
        let alert = UIAlertController(title: title, message: errorMessage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: buttonText, style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showActivityIndicator() {
        performUIUpdatesOnMain {
            UIApplication.shared.beginIgnoringInteractionEvents()
            LoadingOverlay.shared.showOverlay(view: self.view)
        }
    }
    
    func hideActivityIndicator() {
        performUIUpdatesOnMain {
            LoadingOverlay.shared.hideOverlayView()
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
    
}
