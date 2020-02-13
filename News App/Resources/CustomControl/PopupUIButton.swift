//
//  PopupUIButton.swift
//  News App
//
//  Created by Cosmin Iulian on 12/02/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import UIKit

class PopupUIButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = frame.height / 2
        backgroundColor = Theme.tint
    }
    
}
