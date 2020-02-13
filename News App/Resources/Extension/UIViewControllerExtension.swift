//
//  UIViewControllerExtension.swift
//  News App
//
//  Created by Cosmin Iulian on 10/02/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import UIKit

extension UIViewController {
    /**
     Just returns the initial view controller on a storyboard
     */
    static func getInstance() -> UIViewController {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateInitialViewController()!
    }
}
