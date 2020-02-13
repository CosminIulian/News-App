//
//  Article.swift
//  News App
//
//  Created by Cosmin Iulian on 08/02/2020.
//  Copyright © 2020 Cosmin Iulian. All rights reserved.
//

import Foundation

public struct Article: Codable {
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}
