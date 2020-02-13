//
//  CategoryEnum.swift
//  News App
//
//  Created by Cosmin Iulian on 08/02/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import Foundation

public enum CategoryEnum: String, CaseIterable {
    
    case general = "general"
    case business = "business"
    case entertainment = "entertainment"
    case health = "health"
    case science = "science"
    case sports = "sports"
    case technology = "technology"
    
    static var categoryList: [String] {
        return CategoryEnum.allCases.map { $0.rawValue }
    }
}
