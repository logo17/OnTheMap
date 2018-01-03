//
//  OnTheMapBaseViewController.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/3/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation
import UIKit

class OnTheMapBaseViewController : UIViewController {
    
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
