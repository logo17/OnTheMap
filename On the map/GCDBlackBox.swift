//
//  GCDBlackBox.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 1/2/18.
//  Copyright © 2018 Heriberto Ureña Madrigal. All rights reserved.
//

import Foundation

func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
    DispatchQueue.main.async {
        updates()
    }
}
