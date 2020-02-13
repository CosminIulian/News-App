//
//  UIImageViewExtension.swift
//  News App
//
//  Created by Cosmin Iulian on 09/02/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import UIKit

extension UIImageView {
    
    // Sets the image from URL
    func load(url: URL) {
        
        DispatchQueue.global().async { [weak self] in
            
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                       
                        self?.image = image
                    }
                }
            }
        }
    }
    
}
