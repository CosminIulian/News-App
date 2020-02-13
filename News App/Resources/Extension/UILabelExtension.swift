//
//  UILabelExtension.swift
//  News App
//
//  Created by Cosmin Iulian on 10/02/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import UIKit


extension UILabel {
    
    func addDropShadow() {
        
        // Add dropshadow on title label
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5
        
        // Sets the color of text to white
        textColor = UIColor.white
    }
}
