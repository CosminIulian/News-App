//
//  UIViewExtension.swift
//  News App
//
//  Created by Cosmin Iulian on 09/02/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import UIKit

extension UIView {
    
    func addShadowAndRoundedCorners() {
        
        layer.shadowOpacity = 1 // make shadow visible
        layer.shadowOffset = CGSize.zero // change pozition of shadow
        layer.shadowColor = UIColor.darkGray.cgColor // change color of shadow
        layer.cornerRadius = 10 // add corner radius
    }
}
